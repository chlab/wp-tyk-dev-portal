USER = node[:user]
HOME = "/home/#{USER}"
SOURCE_DIR = "#{HOME}/pyenv/src"
CKAN_DIR = "/var/www/ckan"
INSTALL_DIR = "/var/www/ckanext"
PIWIK_DIR = "/var/www/piwik"
VAGRANT_DIR = "/vagrant"
CI = node[:ci] == "yes" ? true : false
CACHE = Chef::Config[:file_cache_path]

template "/etc/sudoers" do
  user "root"
  mode "0440"
  source "sudoers"
end

template "/home/vagrant/.bash_aliases" do
  user "vagrant"
  mode "0644"
  source ".bash_aliases.erb"
end

template "/var/www/ogdch.dev/.htaccess" do
  user "vagrant"
  mode "0644"
  source "dev.htaccess"
end

remote_file "#{CACHE}/epel-release-7-6.noarch.rpm" do
  source "http://dl.fedoraproject.org/pub/epel/7/x86_64/e/epel-release-7-6.noarch.rpm"
  not_if "rpm -qa | egrep -qx 'epel-release-7-6(|.noarch)'"
  notifies :install, "rpm_package[epel-release]", :immediately
  retries 5 # We may be redirected to a FTP URL, CHEF-1031.
end

rpm_package "epel-release" do
  source "#{CACHE}/epel-release-7-6.noarch.rpm"
  only_if {::File.exists?("#{CACHE}/epel-release-7-6.noarch.rpm")}
  action :nothing
end

execute "yum -y update --disablerepo=epel"
execute "yum -y update"


# install the software we need
%w(
dkms
gcc
gcc-c++
git
httpd
java-1.6.0-openjdk
java-1.6.0-openjdk-devel
libxml2-devel
libxslt-devel
make
mod_wsgi
mariadb-server
psmisc
php
php-cli
php-mysqlnd
php-intl
php-mcrypt
php-mbstring
php-redis
php-curl
php-tidy
php-xmlrpc
php-xml
php-gd
ntp
net-tools
policycoreutils-python
postgresql-devel
postgresql-server
python-devel
python-virtualenv
rabbitmq-server
redis
subversion
tomcat
unzip
xalan-j2
xml-commons
).each do |pkg|
    package pkg do
      action :upgrade
    end
  end

bash "Symlink VBoxGuestAdditions" do
  user "root"
  code <<-EOH
  NEWEST_VBOXGUESTADDITIONS_DIR=`find /opt/ -maxdepth 1 -mindepth 1 -name "VBoxGuestAdditions-*" | tail -n 1`;
  if [[ ! -d "/usr/lib/VBoxGuestAdditions" && -n "$NEWEST_VBOXGUESTADDITIONS_DIR" ]];
  then
      ln -s ${NEWEST_VBOXGUESTADDITIONS_DIR}/lib/VBoxGuestAdditions /usr/lib/VBoxGuestAdditions
  fi
  EOH
end

# install node 4.x
bash "Install node 4.x" do
  user "root"
  cwd HOME
  code <<-EOH
  curl --silent --location https://rpm.nodesource.com/setup_4.x | bash -
  yum -y install nodejs
  EOH
end

bash "Disable firewall" do
  user "root"
  code <<-EOH
  systemctl mask firewalld
  systemctl stop firewalld
EOH
end

bash "set permissions to php session.save_path" do
  user "root"
  code <<-EOH
chmod 777 /var/lib/php/session
EOH
end

# register and start ntpd
service "ntpd" do
  action [:enable, :start]
end

# register and start rabbitmq
service "rabbitmq-server" do
  supports :restart => true, :reload => true, :status => true
  action [:enable, :start]
end

# register and start mariadb
service "mariadb" do
  supports :restart => true, :status => true, :reload => true
  action [:enable, :start]
end

# register and start redis
service "redis" do
  supports :restart => true, :status => true, :reload => true
  action [:enable, :start]
end

# register and start httpd
template "/etc/httpd/conf/httpd.conf" do
  owner "root"
  group "root"
  mode "0644"
  source "httpd.conf"
end
service "httpd" do
  supports :restart => true, :reload => true, :status => true
  action [ :enable, :start ]
end

# setup postgresql
execute "service postgresql initdb en_US.UTF8" do
  not_if "test -f /var/lib/pgsql/data/postgresql.conf"
end

service "postgresql" do
  supports :restart => true, :status => true, :reload => true
  action [:enable, :start]
end

template "/var/lib/pgsql/data/pg_hba.conf" do
  user "postgres"
  group "postgres"
  mode 0600
  source "pg_hba.conf"
  notifies :restart, "service[postgresql]", :immediately
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

# Configure Apache Solr
bash "download and extract Apache Solr" do
  user "root"
  cwd "/root"
  not_if "test -d /root/apache-solr-1.4.1"
  code <<-EOH
  curl http://archive.apache.org/dist/lucene/solr/1.4.1/apache-solr-1.4.1.tgz | tar xzf -
  EOH
end

bash "copy apache-solr to the solr directory" do
  user "root"
  not_if "test -f /etc/solr/apache-solr-1.4.1.war"
  code <<-EOH
  mkdir -p /etc/solr
  cp /root/apache-solr-1.4.1/dist/apache-solr-1.4.1.war /etc/solr
  EOH
end

bash "copy the solr configuration" do
  user "root"
  not_if "test -d /etc/solr/conf/"
  code <<-EOH
  mkdir -p /etc/solr/conf
  cp -r /root/apache-solr-1.4.1/example/solr/conf /etc/solr/
  EOH
end

# create a solr.xml file for tomcat
template "/etc/tomcat/Catalina/localhost/solr.xml" do
  mode "0644"
  source "tomcat_solr.xml"
end

# replace default port 8080 of tomcat with 8983
execute "sudo sed -i s/8080/8983/g /etc/tomcat/server.xml"

bash "set permissions for the solr directory" do
  code <<-EOH
  mkdir -p /var/lib/solr
  chown -R tomcat:tomcat /etc/solr /var/lib/solr /usr/share/tomcat
  EOH
end

service "tomcat" do
  supports :restart => true, :status => true, :reload => true
  action [:enable, :start]
end

src  = "#{CKAN_DIR}/ckanext/multilingual/solr/"
dest = "/etc/solr/conf/"
[
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
  end
end
  
# patch solr schema.xml (see: https://github.com/ckan/ckan/issues/2161)
template "/etc/solr/conf/schema.xml" do
  user USER
  mode 0644
  source "schema.xml"
  notifies :restart, "service[tomcat]", :immediately
end

# copy the development.ini
template "#{CKAN_DIR}/development.ini" do
  user USER
  mode 0644
  source "development.ini"
end

# copy the piwik-local-config.ini.php
template "#{PIWIK_DIR}/config/config.ini.php" do
  user USER
  mode 0644
  source "piwik-local-config.ini.php"
end

bash "update the pip package itself" do
  user USER
  code <<-EOH
  source #{HOME}/pyenv/bin/activate
  pip install --upgrade pip
EOH
end

bash "install the ckan pip package" do
  user USER
  code <<-EOH
source #{HOME}/pyenv/bin/activate
pip install -e #{CKAN_DIR} --src #{CKAN_DIR}
cd #{CKAN_DIR}
python setup.py develop
EOH
end

bash "install the ckan pip dependencies" do
  user USER
  code <<-EOH
  source #{HOME}/pyenv/bin/activate
  pip install -r #{CKAN_DIR}/requirements.txt
  EOH
end

# Setup MySQL
bash "setup mysql db for wordpress" do
  user "root"
  not_if "mysql -u root -e\"show databases;\" | grep cms"
  code <<-EOH
  mysql -u root -e"CREATE DATABASE cms;"
  mysql -u root cms < /vagrant/sql/cms.sql
EOH
end

bash "setup mysql user for wordpress" do
  user "root"
  not_if "mysql -u root -e\"SELECT user FROM mysql.user;\" | grep cms"
  code <<-EOH
  mysql -u root -e"CREATE USER 'cms'@'localhost' IDENTIFIED BY '123';"
  mysql -u root -e"GRANT ALL PRIVILEGES ON * . * TO 'cms'@'localhost';"
  mysql -u root -e"FLUSH PRIVILEGES;"
EOH
end

bash "setup mysql db for piwik" do
  user "root"
  not_if "mysql -u root -e\"show databases;\" | grep piwik"
  code <<-EOH
  mysql -u root -e"CREATE DATABASE piwik;"
  mysql -u root piwik < /vagrant/sql/piwik.sql
EOH
end

bash "setup mysql user for piwik" do
  user "root"
  not_if "mysql -u root -e\"SELECT user FROM mysql.user;\" | grep piwik"
  code <<-EOH
  mysql -u root -e"CREATE USER 'piwik'@'localhost' IDENTIFIED BY '123';"
  mysql -u root -e"GRANT ALL PRIVILEGES ON * . * TO 'piwik'@'localhost';"
  mysql -u root -e"FLUSH PRIVILEGES;"
EOH
end

template "/etc/httpd/conf.d/ckan_vhost.conf" do
  user "root"
  mode "0644"
  source "ckan_vhost.conf.erb"
  notifies :reload, "service[httpd]", :immediately
end

execute "enable ckan_vhost.conf within httpd" do
  not_if "stat /etc/httpd/conf.d/ckan_vhost.conf"
  notifies :reload, "service[httpd]", :immediately
  command "a2ensite ckan_vhost.conf"
end

bash "Make sure apache has access to fcgi" do
  user "root"
  code <<-EOH
chown apache:apache /var/www/cgi-bin/php.fastcgi
EOH
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
  notifies :reload, "service[httpd]", :immediately
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
psql ckan_default < /vagrant/sql/ckan_default.sql
createuser -S -D -R -l datastore_default
psql -c "ALTER USER datastore_default with password 'pass'"
createdb -O ckan_default datastore_default -E utf-8
EOH
end

bash "install the ckan pip dev dependencies" do
  user USER
  code <<-EOH
source #{HOME}/pyenv/bin/activate
pip install -r #{CKAN_DIR}/dev-requirements.txt
EOH
end

bash "Install setuptools" do
  user USER
  code <<-EOH
  source #{HOME}/pyenv/bin/activate
  pip install setuptools
  EOH
end

bash "Install datapusher" do
  user "root"
  code <<-EOH
  virtualenv /usr/lib/ckan/datapusher
  source /usr/lib/ckan/datapusher/bin/activate
  mkdir /usr/lib/ckan/datapusher/src
  cd /usr/lib/ckan/datapusher/src
  git clone -b stable https://github.com/ckan/datapusher.git
  cd datapusher
  /usr/lib/ckan/datapusher/bin/pip install -r requirements.txt
  /usr/lib/ckan/datapusher/bin/python setup.py develop
  cp deployment/datapusher.wsgi /etc/ckan/
  cp deployment/datapusher_settings.py /etc/ckan/
  EOH
end

#################################################################
#
# EXTENSION BLOCK
#

# Put one custom extension on each line 
%w(
ckanext-harvest
ckanext-fluent
ckanext-scheming
ckanext-hierarchy
ckanext-dcat
ckanext-switzerland
ckanext-geocat
ckanext-oauth2
ckanext-discourse
).each do | ckan_ext |
  bash "Install #{ckan_ext}" do
    user USER
    cwd INSTALL_DIR
    code <<-EOH
    source #{HOME}/pyenv/bin/activate
    pip install -e #{INSTALL_DIR}/#{ckan_ext} --src #{INSTALL_DIR}
    cd #{INSTALL_DIR}/#{ckan_ext}
    python setup.py develop
    if test -e pip-requirements.txt; then
        pip install -r pip-requirements.txt
    fi
    if test -e requirements.txt; then
        pip install -r requirements.txt
    fi
    EOH
  end
end

#################################################################

# Generate database
bash "create database tables" do
  user USER
  cwd CKAN_DIR
  code <<-EOH
source #{HOME}/pyenv/bin/activate
paster --plugin=ckan db init
paster --plugin=ckan datastore set-permissions -c /var/www/ckan/development.ini | sudo -u postgres psql --set ON_ERROR_STOP=1
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
  notifies :restart, "service[httpd]", :immediately
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

# Discourse
bash "Install discourse" do
  user "root"
  code <<-EOH
  wget -qO- https://get.docker.com/ | sh
  systemctl start docker
  git clone https://github.com/discourse/discourse_docker.git /var/discourse
  EOH
end

template "/var/discourse/containers/app.yml" do
  user "vagrant"
  mode "0644"
  source "discourse_container_app.yml"
end

bash "Install discourse" do
  user "root"
  code <<-EOH
  docker run -d -p 1025:1025 -p 8025:8025 mailhog/mailhog
  ./launcher bootstrap app
  ./launcher start app
  EOH
end


bash "Install test dependencies" do
  user USER
  cwd VAGRANT_DIR
  code <<-EOH
  sudo npm install -g cucumber
  sudo npm install
  EOH
end

bash "Enable CKAN daemons" do
  user "root"
  code <<-EOH
  cp /vagrant/ckangather.service /etc/systemd/system/
  cp /vagrant/ckanfetch.service /etc/systemd/system/
  systemctl enable /etc/systemd/system/ckangather.service
  systemctl enable /etc/systemd/system/ckanfetch.service
  systemctl start ckanfetch.service
  systemctl start ckangather.service
  EOH
end

bash "Make sure daemons are started" do
  user "root"
  code <<-EOH
  chkconfig ntpd on
  chkconfig httpd on
  chkconfig mariadb on
  chkconfig postgresql on
  chkconfig tomcat on
  chkconfig rabbitmq-server on
  chkconfig redis on

  systemctl restart ntpd
  systemctl restart httpd
  systemctl restart mariadb
  systemctl restart postgresql
  systemctl restart tomcat
  systemctl restart rabbitmq-server
  systemctl restart redis
  EOH
end

# rebuild the vbox kernel module after upgrade
bash "Rebuild the vbox kernel module after upgrade" do
  user "root"
  code <<-EOH
  yum install -y kernel-devel-`uname -r`
  /etc/init.d/vboxadd setup
  EOH
end
