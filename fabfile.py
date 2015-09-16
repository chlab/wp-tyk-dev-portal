from fabric.api import (
    cd, env, execute, get, local, put, require, run, settings, shell_env,
    task, roles
)
from gitric import api as gitric


# This is the definition of your environments. Every item of the ENVIRONMENTS
# dict will be made available as a fabric task and the properties you put in a
# particular environment will be made available in the `env` variable.
ENVIRONMENTS = {
    'stage': {
        'root': '/home/liipadmin/ogd-ch',
        'roledefs': {
           'wordpress': ['ogdprodwp1'],
           'wordpress_db': ['ogdproddbwp'],
           'ckan': ['ogdprodappckan1'],
           'ckan_db': ['ogdproddbckan'],
        }
    },
    'test': {
        'root': '/home/liipadmin/ogd-ch',
        'roledefs': {
           'wordpress': ['ogdentwwp1'],
           'wordpress_db': ['ogdentwwp1'],
           'ckan': ['ogdentwckan1'],
           'ckan_db': ['ogdentwckan1'],
        }
    },
    'dev': {
        'root': '/vagrant',
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

@roles('wordpress', 'wordpress_db', 'ckan', 'ckan_db')
@task
def ls():
    run("ls")


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
