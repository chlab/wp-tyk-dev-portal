       ___   ____ ____     ____ _   _ 
      / _ \ / ___|  _ \   / ___| | | |
     | | | | |  _| | | | | |   | |_| |
     | |_| | |_| | |_| | | |___|  _  |
      \___/ \____|____/   \____|_| |_|
                                      
                                      
## Installation

1. Clone this repo
2. Run `git submodule init` and `git submodule update`
3. Install omnibus plugin for vagrant: `vagrant plugin install vagrant-omnibus`
4. Run `vagrant up`
5. Copy the `ogdch.dev/wp-local-config.php.dist` to `ogdch.dev/wp-local-config.php` and fill in the DB config values
6.  Add the following entries to your hosts (usually `/etc/hosts`) file:

```
192.168.56.101 ogdch.dev
192.168.56.101 ckan.ogdch.dev
```

7. Open http://ogdch.dev to access the WordPress installation and http://ckan.ogdch.dev to access the CKAN installation


## Working

### DB Admin
Adminer for the CMS: http://ogdch.dev/adminer/adminer-4.2.1-de.php?username=cms

### Redis
    $ vagrant ssh
    $ redis-cli

## Troubleshooting

In case you run into problems with the guest additions of VirtualBox, run the following command in the box:

```bash
sudo ln -s /opt/VBoxGuestAdditions-4.3.10/lib/VBoxGuestAdditions /usr/lib/VBoxGuestAdditions
```

You should always be able to login to the box (`vagrant ssh`) with user vagrant / password vagrant.
