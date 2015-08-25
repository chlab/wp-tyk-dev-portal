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
mysqldump -u cms --password cms > /vagrant/sql/cms.sql
