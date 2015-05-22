USER = node[:user]
REPOSITORY = node[:repository]
HOME = "/home/#{USER}"
SOURCE_DIR = "#{HOME}/pyenv/src"
CKAN_DIR = "#{SOURCE_DIR}/ckan"
INSTALL_DIR = node[:install_dir]

template "/home/vagrant/.bash_aliases" do
  user "vagrant"
  mode "0644"
  source ".bash_aliases.erb"
end

template "/etc/apache2/sites-available/ckan_vhost.conf" do
  user "root"
  mode "0644"
  source "ckan_vhost.conf.erb"
  notifies :reload, "service[apache2]"
end

service "apache2" do
  supports :restart => true, :reload => true, :status => true
  action [ :enable, :start ]
end

# install the software we need
%w(
openjdk-6-jre-headless
solr-jetty
).each { | pkg | package pkg }

template "/etc/default/jetty" do
  mode "0644"
  source "jetty"
end

bash "create virtualenv" do
  user "vagrant"
  not_if "test -f /home/#{USER}/pyenv/bin/activate"
  code <<-EOH
virtualenv --no-site-packages /home/#{USER}/pyenv
EOH
end

# Create source dir
directory SOURCE_DIR do
  owner USER
  group USER
end

bash "clone ckan" do
  user USER
  group USER
  not_if "test -f #{CKAN_DIR}/README.rst"
  code <<-EOH
  git clone #{REPOSITORY} -b release-v2.3.1 #{CKAN_DIR}
  cd #{CKAN_DIR}
  git submodule update --init
EOH
end

service "jetty" do
  supports :restart => true, :reload => true, :status => true
  action [ :enable, :start ]
end

src  = "#{CKAN_DIR}/ckanext/multilingual/solr/"
dest = "/etc/solr/conf/"
[
 "schema.xml",
 "english_stop.txt",
 "fr_elision.txt",
 "french_stop.txt",
 "german_stop.txt",
 "italian_stop.txt",
 "dutch_stop.txt",
 "greek_stopwords.txt",
 "polish_stop.txt",
 "portuguese_stop.txt",
 "romanian_stop.txt",
 "spanish_stop.txt"
].each do |file|
  link dest + file do
    to src + file
    notifies :restart, "service[jetty]", :immediately
  end
end

bash "make sure postgres is using UTF-8" do
  user "root"
  not_if "sudo -u postgres psql -c '\\l' | grep UTF8"
  code <<-EOH
service apache2 stop
pg_dropcluster --stop 9.1 main
pg_createcluster --start -e UTF-8 9.1 main
EOH
  notifies :restart, "service[apache2]"
end

# copy the development.ini
template "#{CKAN_DIR}/development.ini" do
  user USER
  mode 0644
  source "development.ini"
end

bash "install the ckan pip package" do
  user USER
  code <<-EOH
source #{HOME}/pyenv/bin/activate
cd #{CKAN_DIR}
pip install #{CKAN_DIR} --exists-action=i -e #{CKAN_DIR}
EOH
end

bash "install the ckan pip dependencies" do
  user USER
  code <<-EOH
source #{HOME}/pyenv/bin/activate
pip install -r #{CKAN_DIR}/requirements.txt
EOH
end

execute "enable ckan_vhost.conf within apache" do
  not_if "stat /etc/apache2/sites-enabled/ckan_vhost.conf"
  notifies :reload, "service[apache2]"
  command "a2ensite ckan_vhost.conf"
end

template "/etc/apache2/ports.conf" do
  owner "root"
  group "root"
  mode "0644"
  source "ports.conf"
  notifies :restart, "service[apache2]"
end

execute "create etc/ckan/default folder" do
  not_if "stat /etc/ckan/default"
  command "mkdir -p /etc/ckan/default"
end

template "/etc/ckan/default/apache.wsgi" do
  owner "root"
  group "root"
  mode "0644"
  source "apache.wsgi"
end

template "/etc/ckan/default/who.ini" do
  owner "root"
  group "root"
  mode "0644"
  source "who.ini"
  notifies :reload, "service[apache2]"
end

bash "create etc/cron.daily folder" do
  user "root"
  group "root"
  code <<-EOH
mkdir -p /etc/cron.daily
EOH
end

template "/etc/cron.daily/remove_old_sessions" do
  owner "root"
  group "root"
  mode "0644"
  source "remove_old_sessions.cronjob"
end

execute "make sure /home/vagrant/bin exists" do
  user "vagrant"
  command "mkdir -p /home/vagrant/bin"
end

template "/home/vagrant/bin/ckan" do
  owner "vagrant"
  group "vagrant"
  mode "0744"
  source "bin_ckan"
end

execute "make sure /home/vagrant/lib exists" do
  user "vagrant"
  command "mkdir -p /home/vagrant/lib"
end

bash "setup postgres db for ckan" do
  user "postgres"
  not_if "sudo -u postgres psql -c '\\l' | grep ckan_default"
  code <<-EOH
createuser -S -D -R ckan_default
psql -c "ALTER USER ckan_default with password 'pass'"
createdb -O ckan_default ckan_default -E utf-8
EOH
end

bash "install the ckan pip dev dependencies" do
  user USER
  code <<-EOH
source #{HOME}/pyenv/bin/activate
pip install -r #{CKAN_DIR}/dev-requirements.txt
EOH
end

service "rabbitmq-server" do
  supports :restart => true, :status => true
  action [ :enable, :start ]
end

#################################################################
#
# EXTENSION BLOCK
#
bash "Install the harvest extension" do
  user USER
  cwd INSTALL_DIR
  code <<-EOH
  source #{HOME}/pyenv/bin/activate
  pip install -e git+https://github.com/okfn/ckanext-harvest.git@stable#egg=ckanext-harvest --src #{INSTALL_DIR}
  cd #{INSTALL_DIR}/ckanext-harvest
  python setup.py develop
  EOH
end

bash "Installing the ckan-harvest requirements" do
  user USER
  cwd "#{INSTALL_DIR}/ckanext-harvest"
  code <<-EOH
  source #{HOME}/pyenv/bin/activate
  pip install -r pip-requirements.txt
  EOH
end

# Install custom extensions
# Put one custom extension on each line inside the %w()
# %w(
# ).each do | ckan_ext |
#     bash "Clone #{ckan_ext}" do
#       user USER
#       not_if "test -d #{INSTALL_DIR}/#{ckan_ext}"
#       cwd INSTALL_DIR
#       code <<-EOH
#       source #{HOME}/pyenv/bin/activate
#       pip install -e git+https://github.com/openresearchdata/#{ckan_ext}.git#egg=#{ckan_ext} --src #{INSTALL_DIR}
#       EOH
#     end
# 
#     bash "Update #{ckan_ext}" do
#       user USER
#       only_if "git branch | grep '* master'"
#       cwd "#{INSTALL_DIR}/#{ckan_ext}"
#       code <<-EOH
#       GIT_SSL_NO_VERIFY=true git pull origin master
#       EOH
#     end
# 
#     bash "Install #{ckan_ext}" do
#       user USER
#       cwd INSTALL_DIR
#       code <<-EOH
#       source #{HOME}/pyenv/bin/activate
#       cd #{INSTALL_DIR}/#{ckan_ext}
#       python setup.py develop
#       if test -e pip-requirements.txt; then
#           pip install -r pip-requirements.txt
#       fi
#       if test -e requirements.txt; then
#           pip install -r requirements.txt
#       fi
#       EOH
#     end
# end

#################################################################

# Generate database
bash "create database tables" do
  user USER
  cwd CKAN_DIR
  code <<-EOH
source #{HOME}/pyenv/bin/activate
paster --plugin=ckan db init
EOH
end

bash "creating folders necessary for ckan" do
  user "root"
  not_if "stat #{HOME}/filestore"
  code <<-EOH
mkdir -p #{HOME}/filestore
chown vagrant #{HOME}/filestore
chmod u+rw #{HOME}/filestore
EOH
  notifies :restart, "service[apache2]"
end

bash "creating an admin user" do
  user USER
  cwd CKAN_DIR
  not_if "sudo -u postgres psql -d ckan_default -c 'select * from #{'"'}user#{'"'}' | grep admin@email.org"
  code <<-EOH
  source #{HOME}/pyenv/bin/activate
  paster --plugin=ckan user add admin email=admin@email.org password=pass -c development.ini
  paster --plugin=ckan sysadmin add admin -c development.ini
  EOH
end

# if harvest is not sysadmin -> it'll not be able to create term_translation entries
bash "creating a harvest user" do
  user USER
  cwd CKAN_DIR
  not_if "sudo -u postgres psql -d ckan_default -c 'select * from #{'"'}user#{'"'}' | grep harvest@email.org"
  code <<-EOH
  source #{HOME}/pyenv/bin/activate
  paster --plugin=ckan user add harvest email=harvest@email.org password=pass -c development.ini
  paster --plugin=ckan sysadmin add harvest -c development.ini
  EOH
end

