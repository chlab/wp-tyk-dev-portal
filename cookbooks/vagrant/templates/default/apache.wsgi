import os
activate_this = os.path.join('/home/vagrant/pyenv/bin/activate_this.py')
execfile(activate_this, dict(__file__=activate_this))

os.environ['OAUTHLIB_INSECURE_TRANSPORT'] = '1'
os.environ['OAUTHLIB_RELAX_TOKEN_SCOPE'] = '1'

from paste.deploy import loadapp

config_filepath = os.path.join('/var/www/ckan/development.ini')
from paste.script.util.logging_config import fileConfig
fileConfig(config_filepath)
application = loadapp('config:%s' % config_filepath)
