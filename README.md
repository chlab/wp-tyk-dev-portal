       ___   ____ ____     ____ _   _ 
      / _ \ / ___|  _ \   / ___| | | |
     | | | | |  _| | | | | |   | |_| |
     | |_| | |_| | |_| | | |___|  _  |
      \___/ \____|____/   \____|_| |_|
                                      
                                      
# Installation

1. Clone this repo
2. Run `git submodule init` and `git submodule update`
3. Install omnibus plugin for vagrant: `vagrant plugin install vagrant-omnibus`
4. Run `vagrant up`
5. Copy the `ogdch.dev/wp-local-config.php.dist` to `ogdch.dev/wp-local-config.php` and fill in the DB config values
    ```
    define( 'DB_NAME', 'cms' );
    define( 'DB_USER', 'cms' );
    define( 'DB_PASSWORD', '123' );
    ```
6.  Add the following entries to your hosts (usually `/etc/hosts`) file:
    ```
    192.168.56.101 ogdch.dev
    192.168.56.101 ckan.ogdch.dev
    ```
    
7. Open http://ogdch.dev to access the WordPress installation and http://ckan.ogdch.dev to access the CKAN installation

8. Install composer if it isn't installed system wide:
    ```
    $ cd ogdch.dev/
    $ curl -sS https://getcomposer.org/installer | php
    ```
    
9. Run `php composer.phar install` to install dependencies

10. Install theme dependencies
    ```
    $ cd content/themes/ogdch/
    $ sudo npm install
    ```
    
11. Start Vagrant-Box
    ```
    $ vagrant up
    ```
    
12. Install RabbitMQ Deamon **in Vagrant-Box**
    ```
    $ vagrant ssh
    $ sudo cp --force /var/www/ogd-rabbitmq-worker.conf /etc/init/ogd-rabbitmq-worker.conf
    ```
    

# Working

## DB Admin
Adminer for the CMS (PW: 123): http://ogdch.dev/adminer/adminer-4.2.1-de.php?username=cms

## Redis
    $ vagrant ssh
    $ redis-cli

to see what is happening:

    $ redis-cli monitor

# Troubleshooting

In case you run into problems with the guest additions of VirtualBox, run the following command in the box:

    bash
    sudo ln -s /opt/VBoxGuestAdditions-4.3.10/lib/VBoxGuestAdditions /usr/lib/VBoxGuestAdditions

You should always be able to login to the box (`vagrant ssh`) with user vagrant / password vagrant.


### RabbitMQ deamon handling in Vagrant-Box
Start deamon:

    $ sudo service ogd-rabbitmq-worker start
    
Stop deamon:

    $ sudo service ogd-rabbitmq-worker stop
    
Getting status of process:

    $ sudo service ogd-rabbitmq-worker status
    
### Compile theme resources
    $ cd ogdch.dev/content/themes/ogdch/
    $ gulp sass
    $ gulp scripts
    
or watch changes

    $ cd ogdch.dev/content/themes/ogdch/
    $ gulp watch
    
