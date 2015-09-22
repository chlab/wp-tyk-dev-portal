       ___   ____ ____     ____ _   _ 
      / _ \ / ___|  _ \   / ___| | | |
     | | | | |  _| | | | | |   | |_| |
     | |_| | |_| | |_| | | |___|  _  |
      \___/ \____|____/   \____|_| |_|
                                      
                                      
# Installation

1. Clone this repo
1. Run `git submodule init` and `git submodule update`
1. Install omnibus plugin for vagrant: `vagrant plugin install vagrant-omnibus`
1. Install trigger plugin for vagrant: `vagrant plugin install vagrant-triggers`
1. Run `vagrant up`
1. Copy the `ogdch.dev/wp-local-config.php.dist` to `ogdch.dev/wp-local-config.php` and fill in the DB config values
    ```
    define( 'DB_NAME', 'cms' );
    define( 'DB_USER', 'cms' );
    define( 'DB_PASSWORD', '123' );
    ```

1.  Add the following entries to your hosts (usually `/etc/hosts`) file:
    ```
    192.168.56.101 ogdch.dev
    192.168.56.101 ckan.ogdch.dev
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
   $ cd content/themes/ogdch/
   $ npm install
   ```

1. Start Vagrant-Box
   ```
   $ vagrant up
   ```

1. add wordpress-standard to phpcs: `./bin/phpcs --config-set installed_paths vendor/wp-coding-standards/wpcs`

1. install the `pre-commit.sh` script as a pre-commit hook in your local repositories: `ln -s ../../pre-commit.sh .git/hooks/pre-commit`

# Deployment

To deploy this application, we use [Fabric](http://docs.fabfile.org) (make sure it is installed, see above).
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
* `

# Testing

## Run tests

1. To run the cucumber tests type `cucumber-js --tags @finished test/features --require test/features` in the command line

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

URL: http://ogdch.dev/adminer/adminer-4.2.1-de.php?username=cms
Username: cms
Password: 123

### CKAN Admin-User

URL: http://ckan.ogdch.dev/user/login
Username: admin
Password: pass

### CKAN PostgreSQL Database

Username: admin
Password: pass

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


