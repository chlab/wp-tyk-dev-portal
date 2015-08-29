#!/bin/bash

set -e

DIR=`dirname $0`

# Reset DB
/vagrant/scripts/restore_dumps.sh

# Installation
$DIR/install-wp-test.sh wordpress_test cms '123' localhost latest
cd $DIR/..
curl -s https://getcomposer.org/installer | php
php composer.phar install
$DIR/../bin/phpcs --config-set installed_paths $DIR/../vendor/wp-coding-standards/wpcs

set +e

# Check code style
$DIR/../phpcodesniffer.sh $DIR/../web/ogdch.dev/content/plugins/wp-ckan-backend/ $DIR/../web/ogdch.dev/content/themes/wp-ogdch-theme
phpcs_exit=$?
echo "Exit Code: $phpcs_exit"

# make sure there is a valid WP config around
cp /vagrant/web/ogdch.dev/wp-functest-config.php.dist /vagrant/web/ogdch.dev/wp-functest-config.php

# run cucumber tests
RESET_DB=true cucumber.js --tags @finished $DIR/../tests/features
func_exit=$?
echo "Exit Code: $func_exit"

# Run tests
$DIR/../bin/phpunit
unit_exit=$?
echo "Exit Code: $unit_exit"

echo ""
if [ $phpcs_exit -eq 0 -a $func_exit -eq 0 -a $unit_exit -eq 0 ] ; then
    echo "Everything okay!"
    exit 0
else
    echo "Something went wrong, see output above"
    exit 1
fi
