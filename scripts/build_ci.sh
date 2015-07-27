#!/bin/bash

set -e

function cleanup {
    LAST_ERROR=$?
    vagrant halt
    exit $LAST_ERROR
}

trap "cleanup" EXIT

DIR=`dirname $0`

cd $DIR/..

# Re-create vagrant box
vagrant destroy --force
git submodule init
git submodule foreach --recursive 'git fetch --tags'
git submodule update --recursive

vagrant up

# Run build script in the vagrant box
vagrant ssh -c /vagrant/scripts/build.sh
