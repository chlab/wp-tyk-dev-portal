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
   $ cd ogdch.dev/
   $ curl -sS https://getcomposer.org/installer | php
   ```

1. Run `php composer.phar install` to install dependencies

1. Install theme dependencies
   ```
   $ cd content/themes/ogdch/
   $ sudo npm install
   ```

1. Start Vagrant-Box
   ```
   $ vagrant up
   ```
    
1. Install RabbitMQ Deamon **in Vagrant-Box**
   ```
   $ vagrant ssh
   $ sudo cp --force /var/www/ogd-rabbitmq-worker.conf /etc/init/ogd-rabbitmq-worker.conf
   ```

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

# Troubleshooting

## Problems with Guest Additions of VirtualBox

In case you run into problems with the guest additions of VirtualBox, run the following command in the box:

    $ sudo ln -s /opt/VBoxGuestAdditions-4.3.10/lib/VBoxGuestAdditions /usr/lib/VBoxGuestAdditions

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


