import os
from fabric.api import (
    cd, env, execute, get, local, put, require, run, settings, shell_env,
    task, roles, sudo
)


# This is the definition of your environments. Every item of the ENVIRONMENTS
# dict will be made available as a fabric task and the properties you put in a
# particular environment will be made available in the `env` variable.
ENVIRONMENTS = {
    'stage': {
        'home': '/home/liipadmin',
        'root': '/home/liipadmin/ogd-ch',
        'mysql_with_password': True,
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
        'mysql_with_password': True,
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
        'mysql_with_password': False,
        'roledefs': {
           'wordpress': ['ogdch.dev'],
           'wordpress_db': ['ogdch.dev'],
           'ckan': ['ogdch.dev'],
           'ckan_db': ['ogdch.dev'],
        }
    }
}

env.project_name = 'ogd-ch'
env.use_ssh_config = True


def get_virtualenv_root():
    """
    Return the path to the virtual environment on the remote server.
    """
    return os.path.join(env.home, 'pyenv')


def run_in_virtualenv(cmd, args):
    """
    Run the given command from the remote virtualenv.
    """
    return run('%s %s' % (os.path.join(get_virtualenv_root(), 'bin', cmd),
                          args))

def run_paster(args):
    return run_in_virtualenv('paster', args)

def rev_parse(rev):
    return local("git rev-parse %s" % rev)

@roles('wordpress', 'wordpress_db', 'ckan', 'ckan_db')
@task
def update_repo(commit):
    with cd(env.root):
        run('git fetch')
        run('git checkout %s' % commit)
        run('git submodule init')
        run("git submodule foreach --recursive 'git fetch --tags'")
        run('git submodule update --recursive')

@roles('wordpress', 'ckan')
@task
def restart_apache():
    sudo('systemctl restart httpd')

@roles('wordpress')
@task
def flush_cache():
    sudo('redis-cli flushall')

@roles('ckan')
@task
def restart_tomcat():
    sudo("systemctl restart tomcat")

@roles('ckan')
@task
def rebuild_search_index():
    run_paster("--plugin=ckan search-index rebuild -c /var/www/ckan/development.ini") 

@roles('ckan_db')
@task
def restore_ckan_db():
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
@task
def restore_wp_db():
    if env.mysql_with_password:
        root_password = run("awk '{print $2}' %s/mariadb.txt" % env.home)
        pass_option = '-p%s' % root_password
    else:
        pass_option = ''
    db_list = run("mysql -u root %s -e'show databases;'" % pass_option)
    if 'cms' in db_list:
        run("mysql -u root %s -e'DROP DATABASE cms;'" % pass_option)
    run("mysql -u root %s -e'CREATE DATABASE cms;'" % pass_option)
    run("mysql -u root %s cms < %s/sql/cms.sql" % (pass_option, env.root))

@task
def deploy(rev='origin/master'):
    # commit = rev_parse(rev)
    # execute(update_repo, commit=commit)
    execute(restore_ckan_db)
    execute(restore_wp_db)
    execute(flush_cache)
    execute(restart_apache)
    execute(restart_tomcat)
    execute(rebuild_search_index)

# Environment handling stuff
############################

def get_environment_func(key, value):
    def load_environment():
        env.update(value)
        env.environment = key
    load_environment.__name__ = key
    load_environment.__doc__ = "Definition of the %s environment." % key

    return load_environment


def load_environments(environments):
    for (key, values) in environments.items():
        globals()[key] = task(get_environment_func(key, values))


load_environments(ENVIRONMENTS)
