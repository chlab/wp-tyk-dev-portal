       ___   ____ ____     ____ _   _ 
      / _ \ / ___|  _ \   / ___| | | |
     | | | | |  _| | | | | |   | |_| |
     | |_| | |_| | |_| | | |___|  _  |
      \___/ \____|____/   \____|_| |_|
                                      
                                      
## Installation

1. Clone this repo
2. Run `git submodule init` and `git submodule update`
3. Switch to ogdch.dev/ folder `cd ogdch.dev/`
4. Install composer if it isn't installed system wide:

    $ curl -sS https://getcomposer.org/installer | php
    
5. Run `php composer.phar install` to install dependencies
6. Install RabbitMQ Deamon in Vagrant-Box

    $ sudo cp --force /var/www/ogd-rabbitmq-worker.conf /etc/init/ogd-rabbitmq-worker.conf


## Working

### DB Admin
Adminer for the CMS: http://ogdch.dev/adminer/adminer-4.2.1-de.php?username=cms

### Redis
    $ vagrant ssh
    $ redis-cli
    
to see what Redis is doing type:
    $ vagrant ssh
    $ redis-cli monitor

### RabbitMQ deamon handling in Vagrant-Box
Start deamon:
    $ sudo service ogd-rabbitmq-worker start
Stop deamon:
    $ sudo service ogd-rabbitmq-worker stop
Getting status of process:
    $ sudo service ogd-rabbitmq-worker status