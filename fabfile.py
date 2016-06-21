import os
import pipes
import re
from fabric.api import (
    cd, env, execute, local, run, settings, roles, sudo, parallel, serial, runs_once
)
from fabric.contrib.files import exists, sed
from fabric.contrib.console import confirm
from fabric.utils import abort


# This is the definition of your environments. Every item of the ENVIRONMENTS
# dict will be made available as a fabric task and the properties you put in a
# particular environment will be made available in the `env` variable.
ENVIRONMENTS = {
    'live': {
        'home': '/home/liipadmin',
        'root': '/home/liipadmin/ogd-ch',
        'url': 'https://opendata.swiss',
        'piwik_url': 'https://piwik.opendata.swiss',
        'vagrant': False,
        'allow_restore': False,
        'ckan_config': 'live.ini',
        'wp_config': 'wp-live-config.php',
        'piwik_config': 'piwik-live-config.ini.php',
        'htaccess': 'live.htaccess',
        'roledefs': {
           'wordpress': ['ogdprodwp1'],
           'wordpress_db': ['ogdproddbwp'],
           'ckan': ['ogdprodappckan1'],
           'ckan_db': ['ogdproddbckan']
        }
    },
    'test': {
        'home': '/home/manager',
        'root': '/home/manager/odpch',
        'url': 'http://odpch-web.begasoft.ch',
        'piwik_url': 'http://ogdch-piwik-test.clients.liip.ch',
        'vagrant': False,
        'allow_restore': False,
        'ckan_config': 'test.ini',
        'wp_config': 'wp-test-config.php',
        'piwik_config': 'piwik-test-config.ini.php',
        'htaccess': 'test.htaccess',
        'roledefs': {
            'wordpress': ['sbbodptstwp01.hse.begasoft.ch'],
            'wordpress_db': ['sbbodptstwp01.hse.begasoft.ch'],
            'ckan': ['sbbodptstckan01.hse.begasoft.ch'],
            'ckan_db': ['sbbodptstckan01.hse.begasoft.ch']
        }
    },
    'abnahme': {
        'home': '/home/liipadmin',
        'root': '/home/liipadmin/ogd-ch',
        'url': 'http://ogdch-abnahme.clients.liip.ch',
        'piwik_url': 'http://ogdch-piwik-abnahme.clients.liip.ch',
        'vagrant': False,
        'allow_restore': True,
        'ckan_config': 'abnahme.ini',
        'wp_config': 'wp-abnahme-config.php',
        'piwik_config': 'piwik-abnahme-config.ini.php',
        'htaccess': 'abnahme.htaccess',
        'roledefs': {
            'wordpress': ['ogdabnawp1'],
            'wordpress_db': ['ogdabnadbwp'],
            'ckan': ['ogdabnaappckan1'],
            'ckan_db': ['ogdabnadbckan']
        }
    },
    'dev': {
        'home': '/home/vagrant',
        'root': '/vagrant',
        'url': 'http://ogdch.dev',
        'piwik_url': 'http://piwik.ogdch.dev',
        'vagrant': True,
        'allow_restore': True,
        'ckan_config': 'development.ini',
        'wp_config': 'wp-local-config.php',
        'piwik_config': 'piwik-local-config.ini.php',
        'htaccess': 'dev.htaccess',
        # roledefs will be defined dynamically below (see _get_environment_func())
    }
}

env.project_name = 'ogd-ch'
env.use_ssh_config = True
env.remote_interrupt = True


def _get_virtualenv_root():
    """
    Return the path to the virtual environment on the remote server.
    """
    return os.path.join(env.home, 'pyenv')


def _run_in_virtualenv(cmd, args):
    """
    Run the given command from the remote virtualenv.
    """
    return run('%s %s' % (os.path.join(_get_virtualenv_root(), 'bin', cmd),
                          args))

def _run_paster(args):
    args_with_config = "%s -c /var/www/ckan/development.ini" % args
    return _run_in_virtualenv('paster', args_with_config)

def _run_python(args):
    return _run_in_virtualenv('python', args)

def _run_pip(args):
    return _run_in_virtualenv('pip', args)

def _rev_parse(rev):
    with cd(env.root):
        run('git fetch')
        return run("git rev-parse %s" % rev)

@roles('ckan', 'wordpress')
def update_dependencies():
    execute(update_ckan_dependencies)
    execute(update_wp_dependencies)

@roles('ckan')
def update_ckan_dependencies():
    with cd(os.path.join(env.root, 'web', 'ckan')):
        _run_pip('install -r requirements.txt') 
        _run_python('setup.py develop')
    
    ckan_extensions = [
        'ckanext-harvest',
        'ckanext-scheming',
        'ckanext-fluent',
        'ckanext-hierarchy',
        'ckanext-dcat',
        'ckanext-switzerland',
        'ckanext-geocat',
        'ckanext-oauth2',
        'ckanext-discourse',
    ]

    for ext in ckan_extensions:
        with cd(os.path.join(env.root, 'web', 'ckanext', ext)):
            if exists('requirements.txt'):
                _run_pip('install -r requirements.txt') 
            if exists('pip-requirements.txt'):
                _run_pip('install -r pip-requirements.txt') 
            _run_python('setup.py develop')

    # merge translations
    execute(update_ckan_translations)

@roles('ckan')
def update_ckan_translations():
    run('%s/web/ckanext/ckanext-switzerland/bin/build-combined-ckan-mo.sh' % env.root)

@roles('wordpress')
def update_wp_dependencies():
    with cd(os.path.join(env.root, 'web', 'ogdch.dev/content/themes/wp-ogdch-theme')):
        sudo('php composer.phar self-update')
        sudo('php composer.phar install')
    
@roles('wordpress', 'wordpress_db', 'ckan', 'ckan_db')
def update_repo(commit):
    """
    Update the remote repository to the specified commit.
    """
    with cd(env.root):
        run('git fetch')
        run('git checkout %s' % commit)
        run('git submodule init')
        run('git submodule sync')
        run("git submodule foreach --recursive 'git submodule sync'")
        run("git submodule foreach --recursive 'git reset --hard HEAD'")
        run("git submodule foreach --recursive 'git fetch --tags'")
        run('git submodule update --init --recursive')

@roles('ckan')
def update_ckan_config():
    sudo('cp %s/cookbooks/vagrant/templates/default/%s /var/www/ckan/%s' % (env.root, env.ckan_config, env.ckan_config))
    sudo('cp %s/cookbooks/vagrant/templates/default/%s /var/www/ckan/development.ini' % (env.root, env.ckan_config))
    sudo('cp %s/cookbooks/vagrant/templates/default/schema.xml /etc/solr/conf/schema.xml' % (env.root))

@roles('wordpress')
def update_wp_config():
    sudo('cp %s/cookbooks/vagrant/templates/default/%s /var/www/ogdch.dev/%s' % (env.root, env.wp_config, env.wp_config))
    sudo('cp %s/cookbooks/vagrant/templates/default/%s /var/www/ogdch.dev/.htaccess' % (env.root, env.htaccess))

@roles('wordpress')
def update_piwik_config():
    sudo('cp %s/cookbooks/vagrant/templates/default/%s /var/www/piwik/config/config.ini.php' % (env.root, env.piwik_config))
    sudo('chown liipadmin:liipadmin /var/www/piwik/config/config.ini.php')
    sudo('chmod 664 /var/www/piwik/config/config.ini.php')

@roles('wordpress')
def wp_daemon(daemon, action="restart"):
    """
    Run an action on a daemon on the WP server
    """
    sudo('systemctl %s %s' % (action, daemon))

@roles('wordpress_db')
def wpdb_daemon(daemon, action="restart"):
    """
    Run an action on a daemon on the WP DB server
    """
    sudo('systemctl %s %s' % (action, daemon))

@roles('ckan')
def ckan_daemon(daemon, action="restart"):
    """
    Run an action on a daemon on the CKAN server
    """
    sudo('systemctl %s %s' % (action, daemon))

@roles('ckan_db')
def ckandb_daemon(daemon, action="restart"):
    """
    Run an action on a daemon on the CKAN DB server
    """
    sudo('systemctl %s %s' % (action, daemon))

def restart_apache(action='restart'):
    """
    Restart Apache
    """
    execute(wp_daemon, daemon='httpd', action=action)
    execute(ckan_daemon, daemon='httpd', action=action)

@roles('ckan')
def restart_harvester(action="restart"):
    """
    Restart CKAN gather/fetch daemons
    """
    execute(ckan_daemon, daemon="ckangather", action=action)
    execute(ckan_daemon, daemon="ckanfetch", action=action)

@roles('ckan')
def rebuild_search_index():
    """
    Rebuild the solr search index of CKAN
    """
    execute(ckan_daemon, daemon='tomcat', action='restart')
    _run_paster("--plugin=ckan search-index rebuild") 

@roles('wordpress')
def flush_cache():
    """
    Flush the cache (redis)
    """
    sudo('redis-cli flushall')


@roles('ckan_db')
def restore_ckan_db():
    """
    Restore the CKAN database based on the checked-in db dump
    """
    if not env.allow_restore:
        abort('Restore not allowed on this environment!')

    if not confirm('Do you really want to restore the CKAN database?', default=False):
        abort('Restore aborted.')

    with cd('/tmp'):
        with settings(sudo_user='postgres'):
            db_list = sudo("psql -c '\l'")
            if 'ckan_default' in db_list: 
                sql = "select pg_terminate_backend(pid) from pg_stat_activity where datname='ckan_default'"
                sudo("psql -c %s" % pipes.quote(sql))
                sudo("dropdb ckan_default")
            sudo("createdb -O ckan_default ckan_default -E utf-8")
        

        run("cp %s/sql/ckan_default.sql /tmp/ckan_default.sql" % env.root)

        with settings(sudo_user='postgres'):
            sudo("psql ckan_default < /tmp/ckan_default.sql")

        run("rm /tmp/ckan_default.sql")

@roles('wordpress_db')
def restore_wp_db():
    """
    Restore the WordPress database based on the checked-in db dump
    """
    if not env.allow_restore:
        abort('Restore not allowed on this environment!')

    if not confirm('Do you really want to restore the WordPress database?', default=False):
        abort('Restore aborted.')

    if env.vagrant:
        pass_option = ''
    else:
        root_password = run("awk '{print $2}' %s/mariadb.txt" % env.home)
        pass_option = '-p%s' % root_password

    db_list = run("mysql -u root %s -e'show databases;'" % pass_option)
    if 'cms' in db_list:
        run("mysql -u root %s -e'DROP DATABASE cms;'" % pass_option)
    run("mysql -u root %s -e'CREATE DATABASE cms;'" % pass_option)

    run("cp %s/sql/cms.sql /tmp/cms.sql" % env.root)
    sed('/tmp/cms.sql', before='http://ogdch.dev', after=env.url, backup='')
    run("mysql -u root %s cms < /tmp/cms.sql" % pass_option)

@roles('wordpress_db')
def restore_piwik_db():
    """
    Restore the Piwik database based on the checked-in db dump
    """
    if not env.allow_restore:
        abort('Restore not allowed on this environment!')

    if not confirm('Do you really want to restore the Piwik database?', default=False):
        abort('Restore aborted.')

    if env.vagrant:
        pass_option = ''
    else:
        root_password = run("awk '{print $2}' %s/mariadb.txt" % env.home)
        pass_option = '-p%s' % root_password

    db_list = run("mysql -u root %s -e'show databases;'" % pass_option)
    if 'piwik' in db_list:
        run("mysql -u root %s -e'DROP DATABASE piwik;'" % pass_option)
    run("mysql -u root %s -e'CREATE DATABASE piwik;'" % pass_option)

    run("cp %s/sql/piwik.sql /tmp/piwik.sql" % env.root)
    sed('/tmp/piwik.sql', before='http://piwik.ogdch.dev/', after=env.url, backup='')
    run("mysql -u root %s piwik < /tmp/piwik.sql" % pass_option)

@roles('wordpress', 'ckan')
def update_config():
    execute(update_ckan_config)
    execute(update_wp_config)
    execute(update_piwik_config)

@roles('wordpress', 'wordpress_db', 'ckan', 'ckan_db')
@runs_once
def deploy(rev='origin/master'):
    """
    Deploy the whole application, without a DB restore
    """
    commit = _rev_parse(rev)
    execute(update_repo, commit=commit)
    execute(update_config)
    execute(update_dependencies)
    execute(rebuild_search_index)
    execute(restart)

@roles('wordpress', 'wordpress_db', 'ckan', 'ckan_db')
@runs_once
def deploy_with_db_reset(rev='origin/master'):
    """
    Deploy the whole application and reset the DB
    """
    if not env.allow_restore:
        abort('DB reset not allowed on this environment!')

    commit = _rev_parse(rev)
    execute(update_repo, commit=commit)
    execute(update_config)
    execute(update_dependencies)
    execute(restore)
    execute(restart)

def restore():
    """
    Restore the CKAN, WordPress and Piwik database
    """
    if not env.allow_restore:
        abort('Restore not allowed on this environment!')

    execute(restore_ckan_db)
    execute(restore_wp_db)
    execute(restore_piwik_db)
    execute(flush_cache)
    execute(rebuild_search_index)
    execute(restart)

def restart():
    """
    Restart all services
    """
    # stop all daemons
    execute(ckan_daemon, daemon='rabbitmq-server', action='stop')
    execute(wpdb_daemon, daemon='mariadb', action='stop')
    execute(wp_daemon, daemon='redis', action='stop')
    execute(ckandb_daemon, daemon='postgresql', action='stop')
    execute(ckan_daemon, daemon='tomcat', action='stop')
    execute(restart_harvester, action='stop')
    execute(restart_apache, action='stop')

    # start all daemon
    execute(ckan_daemon, daemon='rabbitmq-server', action='start')
    execute(wpdb_daemon, daemon='mariadb', action='start')
    execute(wp_daemon, daemon='redis', action='start')
    execute(ckandb_daemon, daemon='postgresql', action='start')
    execute(ckan_daemon, daemon='tomcat', action='start')
    execute(restart_harvester, action='start')
    execute(restart_apache, action='start')

@roles('wordpress', 'ckan')
@serial
def log():
    """
    Show logs of server
    """
    # make sure sudo requests is done in serial part
    sudo("ls /var/log/httpd")
    execute(tail_log, path="/var/log/httpd")

@roles('ckan')
@serial
def log_ckan():
    """
    Show logs of server
    """
    # make sure sudo requests is done in serial part
    sudo("ls /var/log/httpd/ckan_default.error.log")
    execute(tail_log, path="/var/log/httpd/ckan_default.error.log")

@roles('ckan')
def paster(cmd='', plugin=None):
    if plugin is not None:
        cmd = "--plugin='%s' %s" % (plugin, cmd)
    _run_paster(cmd)

@parallel
def tail_log(path):
    """
    Tail logs of several servers
    """
    assert(env.remote_interrupt == True)
    with settings(warn_only=True):
        sudo(
            "bash -c 'find %s | xargs tail -f'" % (path),
            shell=False
        )



# Environment handling stuff
############################

def _get_environment_func(key, value):
    def load_environment():
        env.update(value)
        env.environment = key
        if env.vagrant:
            result = local('vagrant ssh-config', capture=True)
            hostname = re.findall(r'HostName\s+([^\n]+)', result)[0]
            port = re.findall(r'Port\s+([^\n]+)', result)[0]
            user = re.findall(r'User\s+([^\n]+)', result)[0]

            env.roledefs = {
                'wordpress': ['%s@%s:%s'%(user, hostname, port)],
                'wordpress_db': ['%s@%s:%s'%(user, hostname, port)],
                'ckan': ['%s@%s:%s'%(user, hostname, port)],
                'ckan_db': ['%s@%s:%s'%(user, hostname, port)]
            }
            env.forward_agent = True  # use SSH keys from host
            env.key_filename = re.findall(r'IdentityFile\s+([^\n]+)', result)[0]
            # remove surrounding quotes
            if env.key_filename.startswith('"') and env.key_filename.endswith('"'):
                env.key_filename = env.key_filename[1:-1]

    load_environment.__name__ = key
    load_environment.__doc__ = "Definition of the %s environment." % key

    return load_environment


def _load_environments(environments):
    for (key, values) in environments.items():
        globals()[key] = _get_environment_func(key, values)


_load_environments(ENVIRONMENTS)
