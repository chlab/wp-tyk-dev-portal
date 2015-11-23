#!/bin/bash

set -e

if [ ! -d /vagrant ] ; then
    echo "This script must be run *inside* the vagrant box"
    exit 1
fi

sudo systemctl stop httpd

# PostgreSQL (CKAN DB)
echo "Restore ckan_default database..."
sudo -i -u postgres psql -c '\l' | grep ckan_default && sudo -i -u postgres dropdb ckan_default
sudo -i -u postgres createdb -O ckan_default ckan_default -E utf-8
sudo -i -u postgres psql ckan_default < /vagrant/sql/ckan_default.sql

# MySQL (WordPress DB)
echo "Restore cms database..."
mysql -u root -e"show databases;" | grep cms && mysql -u root -e"DROP DATABASE cms;"
mysql -u root -e"CREATE DATABASE cms;"
mysql -u root cms < /vagrant/sql/cms.sql

# MySQL (Piwik DB)
echo "Restore piwik database..."
mysql -u root -e"show databases;" | grep piwik && mysql -u root -e"DROP DATABASE piwik;"
mysql -u root -e"CREATE DATABASE piwik;"
mysql -u root piwik < /vagrant/sql/piwik.sql

# Flush Redis cache
sudo redis-cli flushall

# Restart Apache
sudo systemctl start httpd

# make sure solr is fine
sudo systemctl restart tomcat
source /home/vagrant/pyenv/bin/activate
paster --plugin=ckan search-index rebuild -c /var/www/ckan/development.ini
