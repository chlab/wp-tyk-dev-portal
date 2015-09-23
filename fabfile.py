import os
from fabric.api import (
    cd, env, execute, local, put, run, settings, task, roles, sudo, parallel, serial
)


# This is the definition of your environments. Every item of the ENVIRONMENTS
# dict will be made available as a fabric task and the properties you put in a
# particular environment will be made available in the `env` variable.
ENVIRONMENTS = {
    'stage': {
        'home': '/home/liipadmin',
        'root': '/home/liipadmin/ogd-ch',
        'vagrant': False,
        'roledefs': {
           'wordpress': ['ogdprodwp1'],
           'wordpress_db': ['ogdproddbwp'],
           'ckan': ['ogdprodappckan1'],
           'ckan_db': ['ogdproddbckan'],
        }
    },
    'test': {
        'home': '/home/liipadmin',
        'root': '/home/liipadmin/ogd-ch',
        'vagrant': False,
        'roledefs': {
            'wordpress': ['ogdentwwp1'],
            'wordpress_db': ['ogdentwwp1'],
            'ckan': ['ogdentwckan1'],
            'ckan_db': ['ogdentwckan1'],
        }
    },
    'dev': {
        'home': '/home/vagrant',
        'root': '/vagrant',
        'vagrant': True,
        'roledefs': {
            'wordpress': ['vagrant@127.0.0.1:2222'],
            'wordpress_db': ['vagrant@127.0.0.1:2222'],
            'ckan': ['vagrant@127.0.0.1:2222'],
            'ckan_db': ['vagrant@127.0.0.1:2222'],
        }
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
    return _run_in_virtualenv('paster', args)

def _rev_parse(rev):
    with cd(env.root):
        run('git fetch')
        return run("git rev-parse %s" % rev)

@roles('wordpress', 'wordpress_db', 'ckan', 'ckan_db')
def update_repo(commit):
    """
    Update the remote repository to the specified commit.
    """
    with cd(env.root):
        run('git checkout %s' % commit)
        run('git submodule init')
        run("git submodule foreach --recursive 'git fetch --tags'")
        run('git submodule update --recursive')

@roles('wordpress', 'ckan')
def restart_apache():
    """
    Restore apache webserver
    """
    sudo('systemctl restart httpd')

@roles('wordpress')
def flush_cache():
    """
    Flush the cache (redis)
    """
    sudo('redis-cli flushall')

@roles('ckan')
def restart_tomcat():
    """
    Restart tomcat server (Solr)
    """
    sudo("systemctl restart tomcat")

@roles('ckan')
def rebuild_search_index():
    """
    Rebuild the solr search index of CKAN
    """
    _run_paster("--plugin=ckan search-index rebuild -c /var/www/ckan/development.ini") 

@roles('ckan_db')
def restore_ckan_db():
    """
    Restore the CKAN database based on the checked-in db dump
    """
    with cd('/tmp'):
        with settings(sudo_user='postgres'):
            db_list = sudo("psql -c '\l'")
            if 'ckan_default' in db_list: 
                sudo("dropdb ckan_default")
            sudo("createdb -O ckan_default ckan_default -E utf-8")
        

        run("cp %s/sql/ckan_default.sql /tmp/ckan_default.sql" % env.root)

        with settings(sudo_user='postgres'):
            sudo("psql ckan_default < /tmp/ckan_default.sql")

        run("rm /tmp/ckan_default.sql")

@roles('wordpress_db')
def restore_wp_db():
    """
    Restore the WordPress databased based on the checked-in db dump
    """
    if env.vagrant:
        pass_option = ''
    else:
        root_password = run("awk '{print $2}' %s/mariadb.txt" % env.home)
        pass_option = '-p%s' % root_password

    db_list = run("mysql -u root %s -e'show databases;'" % pass_option)
    if 'cms' in db_list:
        run("mysql -u root %s -e'DROP DATABASE cms;'" % pass_option)
    run("mysql -u root %s -e'CREATE DATABASE cms;'" % pass_option)
    run("mysql -u root %s cms < %s/sql/cms.sql" % (pass_option, env.root))

def deploy(rev='origin/master'):
    """
    Deploy the whole application
    """
    commit = _rev_parse(rev)
    execute(update_repo, commit=commit)
    execute(restore)
    execute(restart)

def restore():
    """
    Restore the CKAN and WordPress database
    """
    execute(restore_ckan_db)
    execute(restore_wp_db)
    execute(flush_cache)
    execute(rebuild_search_index)
    execute(restart)

def restart():
    """
    Restart all services
    """
    execute(restart_tomcat)
    execute(restart_apache)

@roles('wordpress', 'ckan')
@serial
def log():
    """
    Show logs of server
    """
    sudo("ls /var/log/httpd")
    execute(tail_log)

@roles('wordpress', 'ckan')
@parallel
def tail_log():
    """
    Tail logs of several servers
    """
    assert(env.remote_interrupt == True)
    with settings(warn_only=True):
        sudo("bash -c 'find /var/log/httpd | xargs tail -f'", shell=False)



# Environment handling stuff
############################

def _get_environment_func(key, value):
    def load_environment():
        env.update(value)
        env.environment = key
        if env.vagrant:
            result = local('vagrant ssh-config | grep IdentityFile', capture=True)
            env.key_filename = result.split()[1]

    load_environment.__name__ = key
    load_environment.__doc__ = "Definition of the %s environment." % key

    return load_environment


def _load_environments(environments):
    for (key, values) in environments.items():
        globals()[key] = _get_environment_func(key, values)


_load_environments(ENVIRONMENTS)