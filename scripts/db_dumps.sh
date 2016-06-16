#!/bin/bash

set -e

if [ ! -d /vagrant ] ; then
    echo "This script must be run *inside* the vagrant box"
    exit 1
fi

# PostgreSQL (CKAN DB)
echo "Create dump of ckan_default..."
sudo -i -u postgres pg_dump ckan_default > /vagrant/sql/ckan_default.sql

# MySQL (WordPress DB)
echo "Create dump of cms..."
mysqldump -u cms -p123 --skip-extended-insert --skip-quick cms > /vagrant/sql/cms.sql

# Piwik (Piwik DB)
echo "Create dump of piwik..."
mysqldump -u piwik -p123 --skip-extended-insert --skip-quick piwik > /vagrant/sql/piwik.sql

# PostgresSQL (Discourse DB)
echo "Create dump of discourse"
docker exec app bash -c "sudo -i -u postgres pg_dump discourse --exclude-table-data=stylesheet_cache" > /vagrant/sql/discourse.sql
