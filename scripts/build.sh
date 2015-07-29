#!/bin/bash

set -e

DIR=`dirname $0`

# Installation
# $DIR/install-wp-test.sh wordpress_test cms '123' localhost latest
# cd $DIR/..
curl -s https://getcomposer.org/installer | php
php composer.phar install --dev
$DIR/../bin/phpcs --config-set installed_paths $DIR/../vendor/wp-coding-standards/wpcs

# Check code style
$DIR/../phpcodesniffer.sh $DIR/../web/ogdch.dev/content/mu-plugins/wp-ckan-backend/ $DIR/../web/ogdch.dev/content/themes/wp-ogdch-theme

# run cucumber tests
cucumber.js $DIR/tests/features

# Run tests
$DIR/../bin/phpunit
