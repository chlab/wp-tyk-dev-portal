#!/usr/bin/env bash


install_wp_cli() {
	echo "Installing WordPress CLI tool..."

	curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
	# make it executable locally
	chmod +x wp-cli.phar
	sudo mv wp-cli.phar /usr/local/bin/wp
	# test if it works
	wp --info
}

install_composer() {
	echo "Installing composer..."

	EXPECTED_SIGNATURE=$(wget https://composer.github.io/installer.sig -O - -q)
	php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
	ACTUAL_SIGNATURE=$(php -r "echo hash_file('SHA384', 'composer-setup.php');")
	if [ "$EXPECTED_SIGNATURE" = "$ACTUAL_SIGNATURE" ]
	then
	    php composer-setup.php --quiet
	    RESULT=$?
	    rm composer-setup.php

	    chmod +x composer.phar
	    sudo mv composer.phar /usr/local/bin/composer
	else
	    >&2 echo 'ERROR: Invalid installer signature'
	    rm composer-setup.php
	    exit 1
	fi
}

install_composer
install_wp_cli

composer update
sudo ln -s /vagrant/vendor/phpunit/phpunit/phpunit /usr/local/bin/phpunit