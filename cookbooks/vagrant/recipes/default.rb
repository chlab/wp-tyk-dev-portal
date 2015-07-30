USER = node[:user]
HOME = "/home/#{USER}"
SOURCE_DIR = "#{HOME}/pyenv/src"
CKAN_DIR = "/var/www/ckan"
INSTALL_DIR = "/var/www/ckanext"
VAGRANT_DIR = "/vagrant"
EPEL = node[:epel]
CI = node[:ci] == "yes" ? true : false
CACHE = Chef::Config[:file_cache_path]

template "/home/vagrant/.bash_aliases" do
  user "vagrant"
  mode "0644"
  source ".bash_aliases.erb"
end

remote_file "#{CACHE}/epel-release-#{EPEL}.noarch.rpm" do
  source "http://dl.fedoraproject.org/pub/epel/6/x86_64/epel-release-#{EPEL}.noarch.rpm"
  not_if "rpm -qa | egrep -qx 'epel-release-#{EPEL}(|.noarch)'"
  notifies :install, "rpm_package[epel-release]", :immediately
  retries 5 # We may be redirected to a FTP URL, CHEF-1031.
end

rpm_package "epel-release" do
  source "#{CACHE}/epel-release-#{EPEL}.noarch.rpm"
  only_if {::File.exists?("#{CACHE}/epel-release-#{EPEL}.noarch.rpm")}
  action :nothing
end

remote_file "#{CACHE}/rpmforge-release-0.5.3-1.el6.rf.x86_64.rpm" do
  source "http://pkgs.repoforge.org/rpmforge-release/rpmforge-release-0.5.3-1.el6.rf.x86_64.rpm"
  not_if "rpm -qa | egrep -qx 'epel-release-0.5.3-1.el6.rf.x86_64'"
  notifies :install, "rpm_package[rpmforge-release]", :immediately
  retries 5 # We may be redirected to a FTP URL, CHEF-1031.
end

rpm_package "rpmforge-release" do
  source "#{CACHE}/rpmforge-release-0.5.3-1.el6.rf.x86_64.rpm"
  only_if {::File.exists?("#{CACHE}/rpmforge-release-0.5.3-1.el6.rf.x86_64.rpm")}
  action :nothing
end

remote_file "#{CACHE}/remi-release-6.rpm" do
  source "http://rpms.famillecollet.com/enterprise/remi-release-6.rpm"
  not_if "rpm -qa | egrep -qx 'remi-release-6.rpm'"
  notifies :install, "rpm_package[remi-release]", :immediately
  retries 5 # We may be redirected to a FTP URL, CHEF-1031.
end

rpm_package "remi-release" do
  source "#{CACHE}/remi-release-6.rpm"
  only_if {::File.exists?("#{CACHE}/remi-release-6.rpm")}
  action :nothing
end

# install node repo
execute "curl --silent --location https://rpm.nodesource.com/setup | bash -"

execute "yum -y update --disablerepo=epel"
execute "yum -y update"


# install the software we need
%w(
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
mysql-server
php
php-cli
php-mysql
php-intl
php-mcrypt
php-mbstring
php-redis
php-curl
php-tidy
php-xmlrpc
php-xml
mod_fastcgi
nodejs
ntp
policycoreutils-python
postgresql-devel
postgresql-server
python-devel
python-virtualenv
rabbitmq-server
redis
subversion
tomcat6
unzip
xalan-j2
xml-commons
).each do |pkg|
    package pkg do
      action :upgrade
    end
  end

# install PHP 5.4 from the remi repository
execute "yum --enablerepo=remi install -y php"

# register and start ntpd
service "ntpd" do
  action [:enable, :start]
end

# register and start rabbitmq
service "rabbitmq-server" do
  supports :restart => true, :reload => true, :status => true
  action [:enable, :start]
end

# register and start mysql
service "mysqld" do
  supports :restart => true, :status => true, :reload => true
  action [:enable, :start]
end

# register and start redis
service "redis" do
  supports :restart => true, :status => true, :reload => true
  action [:enable, :start]
end

# register and start httpd
execute "killall -9 httpd || true"
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
template "/etc/tomcat6/Catalina/localhost/solr.xml" do
  mode "0644"
  source "tomcat_solr.xml"
end

# replace default port 8080 of tomcat with 8983
execute "sudo sed -i s/8080/8983/g /etc/tomcat6/server.xml"

bash "set permissions for the solr directory" do
  code <<-EOH
  mkdir -p /var/lib/solr
  chown -R tomcat:tomcat /etc/solr /var/lib/solr /usr/share/tomcat6
  EOH
end

service "tomcat6" do
  supports :restart => true, :status => true, :reload => true
  action [:enable, :start]
end

unless CI then
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
      notifies :restart, "service[tomcat6]", :immediately
    end
  end
end
  
# patch solr schema.xml (see: https://github.com/ckan/ckan/issues/2161)
template "/etc/solr/conf/schema.xml" do
  user USER
  mode 0644
  source "schema.xml"
  notifies :restart, "service[tomcat6]", :immediately
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
bash "setup mysql user for wordpress" do
  user "root"
  not_if "mysql -u root -e\"SELECT user FROM mysql.user;\" | grep cms"
  code <<-EOH
  mysql -u root -e"CREATE USER 'cms'@'localhost' IDENTIFIED BY '123';"
  mysql -u root -e"GRANT ALL PRIVILEGES ON * . * TO 'cms'@'localhost';"
  mysql -u root -e"FLUSH PRIVILEGES;"
EOH
end

bash "setup mysql db for wordpress" do
  user "root"
  not_if "mysql -u root -e\"show databases;\" | grep cms"
  code <<-EOH
  mysql -u root -e"CREATE DATABASE cms;"
  mysql -u root cms < /vagrant/sql/cms.sql
EOH
end

execute "killall -9 httpd || true"
template "/etc/httpd/conf.d/ckan_vhost.conf" do
  user "root"
  mode "0644"
  source "ckan_vhost.conf.erb"
  notifies :reload, "service[httpd]", :immediately
end

execute "killall -9 httpd || true"
template "/etc/httpd/conf/httpd.conf" do
  owner "root"
  group "root"
  mode "0644"
  source "httpd.conf"
  notifies :restart, "service[httpd]", :immediately
end

execute "killall -9 httpd || true"
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

execute "killall -9 httpd || true"
template "/etc/httpd/conf/ports.conf" do
  owner "root"
  group "root"
  mode "0644"
  source "ports.conf"
  notifies :restart, "service[httpd]", :immediately
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

execute "killall -9 httpd || true"
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

#################################################################
#
# EXTENSION BLOCK
#

# Put one custom extension on each line like this: { "name-of-ckanext" => "repository-url", ... }
%w(
ckanext-harvest
ckanext-fluent
ckanext-scheming
ckanext-hierarchy
ckanext-dcat
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
EOH
end

execute "killall -9 httpd || true"
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

bash "open firewall for httpd and restart" do
  user "root"
  code <<-EOH
  sudo iptables -I INPUT -p tcp -m tcp --dport 80 -j ACCEPT
  service iptables save
  EOH
  notifies :restart, "service[httpd]", :immediately
end

bash "Install test dependencies" do
  user USER
  cwd VAGRANT_DIR
  code <<-EOH
  sudo npm install -g cucumber
  sudo npm install
  EOH
end

bash "Make sure daemons are started" do
  user "root"
  code <<-EOH
  chkconfig ntpd on
  chkconfig httpd on
  chkconfig mysqld on
  chkconfig postgresql on
  chkconfig tomcat6 on
  chkconfig rabbitmq-server on
  chkconfig redis on
  EOH
end
