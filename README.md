               .___                                           .__                  .__        
      ____   __| _/_____     ____   _______  __   ______ ____ |  |____  _  __ ____ |__|_______
     /  _ \ / __ |\____ \   /  _ \_/ __ \  \/ /  /  ___// ___\|  |  \ \/ \/ // __ \|  \___   /
    (  <_> ) /_/ ||  |_> > (  <_> )  ___/\   /   \___ \\  \___|   Y  \     /\  ___/|  |/    / 
     \____/\____ ||   __/   \____/ \___  >\_/   /____  >\___  >___|  /\/\_/  \___  >__/_____ \
                \/|__|                 \/            \/     \/     \/            \/         \/


# Installation

1. Clone this repo
1. Run `git submodule init` and `git submodule update`
1. Install omnibus plugin for vagrant: `vagrant plugin install vagrant-omnibus`
1. Install trigger plugin for vagrant: `vagrant plugin install vagrant-triggers`
1. Run `vagrant up`
1. Copy the `web/ogdch.dev/wp-local-config.php.dist` to `web/ogdch.dev/wp-local-config.php` and fill in the DB config values
    ```
    define( 'DB_NAME', 'cms' );
    define( 'DB_USER', 'cms' );
    define( 'DB_PASSWORD', '123' );
    ```

1.  Add the following entries to your hosts (usually `/etc/hosts`) file:
    ```
    192.168.56.101 ogdch.dev
    192.168.56.101 ckan.ogdch.dev
    192.168.56.101 piwik.ogdch.dev
    ```
    
1. Open http://ogdch.dev to access the WordPress installation and http://ckan.ogdch.dev to access the CKAN installation

1. Install composer if it isn't installed system wide:
    ```
   $ curl -sS https://getcomposer.org/installer | php
   ```

1. Run `php composer.phar install --dev` to install dependencies

1. Install Node.js >=0.12.x

1. Install test dependencies
   ```
   $ sudo npm install -g cucumber
   $ npm install
   ```

1. Install python dependencies
   ```
   $ pip install 'pip>1.5' --upgrade
   $ pip install -r dev-requirements.txt
   ```

1. Install theme dependencies
   ```
   $ cd web/ogdch.dev/content/themes/wp-ogdch-theme/
   $ npm install
   ```

1. Start Vagrant-Box
   ```
   $ vagrant up
   ```

1. add wordpress-standard to phpcs: `./bin/phpcs --config-set installed_paths vendor/wp-coding-standards/wpcs`

1. install the `pre-commit.sh` script as a pre-commit hook in your local repositories: `ln -s ../../pre-commit.sh .git/hooks/pre-commit`

# Update translations

All translations of static texts are handled with [Transifex](https://www.transifex.com/opendataswiss/).
They consist of two parts:

1. WordPress part in the [wp-ogdch-theme](https://gitlab.liip.ch/jazz/wp-ogdch-theme) plugin. Download the new translations from transifex and put them in the `languages` folder of the theme
2. CKAN part in [ckanext-switzerland](https://github.com/ogdch/ckanext-switzerland) extension. Download the new translations from Transifex and put them in the the corresponding subfolder in `i18n`

The WordPress translations are automatically loaded from all plugins.
For CKAN there is a script to combine all translations and copy them to the correct path. This script is part of the `deploy` task in the fabfile. 

# Deployment

To deploy this application, we use [Fabric](http://docs.fabfile.org) (make sure it is installed via pip, see above: `pip install -r dev-requirements.txt`).
There are a bunch of tasks defined, which can be used to execute certain tasks on the deployment environment:

```
$ fab --list
```

To deploy the current master of the application to the test environment:
```
$ fab test deploy
```

To deploy the last commit to the development environment:
```
$ fab dev deploy:HEAD
```

Make sure to always specify an environment task (`dev`, `test` or `stage`) and check the available helpers:

* `restart` to restart all services
* `restore` to restore the checked-in DB dumps for WP and CKAN

# Testing

## Run tests

1. To run the cucumber tests type `cucumber-js --tags @finished /vagrant/tests/features --require /vagrant/tests/features` in the command line

1. To run unit tests type `bin/phpunit`

## Write tests

The cucumber tests are written in [Gherkin](https://github.com/cucumber/cucumber/wiki/Gherkin) using its German version.
Each test is implemented with cucumber-js using [Zombie.js](http://zombie.js.org/) as a browser (see the [Zombie.js API](http://devres.zoomquiet.io/data/20110811173813/index.html) for specifics).

Unit tests use WordPress-specific PHPUnit test cases, which assume a fresh installation with all the plugins and themes of the original one. The build script already takes care of this.

# Working

## Users

### WordPress Admin-User

URL: http://ogdch.dev/cms/wp-login.php
Username: liip
Password: liip

### WordPress MySQL Database

URL: http://ogdch.dev/adminer/adminer-4.2.2-de.php?username=cms
Username: cms
Password: 123

### CKAN Admin-User

URL: http://ckan.ogdch.dev/user/login
Username: admin
Password: pass

### CKAN PostgreSQL Database

Username: admin
Password: pass

### Piwik Admin-User

URL: http://ogdch.dev/cms/wp-login.php
Username: liip
Password: liip123

### Piwik MySQL Database

URL: http://ogdch.dev/adminer/adminer-4.2.2-de.php?username=piwik
Username: piwik
Password: 123

## Redis
    $ vagrant ssh
    $ redis-cli

to see what is happening:

    $ redis-cli monitor

to clear the cache:

    $ redis-cli
    > flushall

## RabbitMQ deamon handling in Vagrant-Box
Start deamon:

    $ sudo service ogd-rabbitmq-worker start

Stop deamon:

    $ sudo service ogd-rabbitmq-worker stop

Getting status of process:

    $ sudo service ogd-rabbitmq-worker status

## Compile theme resources

    $ cd ogdch.dev/content/themes/ogdch/
    $ gulp sass
    $ gulp scripts

or watch changes

    $ cd ogdch.dev/content/themes/ogdch/
    $ gulp watch

## Create and restore database dumps

There are two script to dump the CKAN and WordPress databases:

    $ /vagrant/scripts/db_dumps.sh

The dumps are saved to the `sql` directory in the root of the project.
To restore the databases, you can use the following script:

    $ /vagrant/scripts/restore_dumps.sh

## Testing URL-Resources of CKAN-Instance

To test the availability of all URLs of all available Packages for the current Host, first fire up a fake mail-server, that logs incoming mails. For that you need to configure the SMTP-Server accordingly, in the ini-File:
	
	smtp.server = localhost
	smtp.host = 1025

Then fire the fake SMTP-Server up like so:

	$ python -m smtpd -n -c DebuggingServer localhost:1025

To run the script, in the Vagrant-Box, run this:

	$ python /vagrant/scripts/resource_test.py -c /var/www/ckan/development.ini 

You can also run the script in dry-mode. This will run the script, except the created tmp-folder (see the path in the log) won't be deleted when finished for debugging. In there you can find a log-file and, if there were any errors accessing the resources, a folder with all e-mails generated. 

The cronjob for this task can be configured in crontab:

	$ crontab -e
	0 7 * * * . /home/vagrant/pyenv/bin/activate && python /vagrant/scripts/resource_test.py -c /var/www/ckan/development.ini 

# Troubleshooting

## Problems with Guest Additions of VirtualBox

In case you run into problems with the guest additions of VirtualBox, run the following command in the box:

    $ sudo /etc/init.d/vboxadd setup

You should always be able to login to the box (`vagrant ssh`) with user vagrant / password vagrant.

## Re-Provisioning an existing Vagrant-Box

You might get the following error when you try to reprovision an exisiting Vagrant-Box:

`Shared folders that Chef requires are missing on the virtual machine. ...`

If this happens just execute the following command:

    $ rm .vagrant/machines/default/virtualbox/synced_folders
    $ vagrant reload --provision

A workaround for this issue has been added to the Vagrantfile. You should now be able to just run `vagrant reload --provision`

## Permission problems with NFS mount

You might get errors with the permissions of the shared folder when using NFS:

```
chown: changing ownership of ‘/var/www’: Operation not permitted
```

This is a [known issues of PuPHPet](https://github.com/puphpet/puphpet/wiki/Shared-Folder:-Permission-Denied) and can be solved by editing the Vagrant file. Add the following to the `config.vm.synced_folder` option:

```
:linux__nfs_options => ["rw","no_root_squash","no_subtree_check"]
```


