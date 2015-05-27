       ___   ____ ____     ____ _   _ 
      / _ \ / ___|  _ \   / ___| | | |
     | | | | |  _| | | | | |   | |_| |
     | |_| | |_| | |_| | | |___|  _  |
      \___/ \____|____/   \____|_| |_|
                                      
                                      
## Installation

1. Clone this repo
2. Run `git submodule init` and `git submodule update`
3. Install composer if it isn't installed system wide:
    ```shell
    $ cd ogdch.dev/
    $ curl -sS https://getcomposer.org/installer | php
    ```
5. Run `php composer.phar install` to install dependencies
6. Install RabbitMQ Deamon in Vagrant-Box
    ```shell
    $ sudo cp --force /var/www/ogd-rabbitmq-worker.conf /etc/init/ogd-rabbitmq-worker.conf
    ```
7. Install theme dependencies
    ```shell
    $ cd ogdch.dev/content/themes/ogdch/
    $ sudo npm install
    ```

## Working

### DB Admin
Adminer for the CMS: http://ogdch.dev/adminer/adminer-4.2.1-de.php?username=cms

### Redis
```shell
$ vagrant ssh
$ redis-cli
```
to see what Redis is doing type:
```shell
$ vagrant ssh
$ redis-cli monitor
```

### RabbitMQ deamon handling in Vagrant-Box
Start deamon:
```shell
$ sudo service ogd-rabbitmq-worker start
```shell
Stop deamon:
```shell
$ sudo service ogd-rabbitmq-worker stop
```
Getting status of process:
```shell
$ sudo service ogd-rabbitmq-worker status
```

### Compile theme resources
```shell
$ cd ogdch.dev/content/themes/ogdch/
$ gulp sass
$ gulp scripts
```
or watch changes
```shell
$ cd ogdch.dev/content/themes/ogdch/
$ gulp watch
```