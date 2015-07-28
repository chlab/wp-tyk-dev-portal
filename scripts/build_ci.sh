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

# make sure Gitlab is known to the runner
GITLAB_HOST='gitlab.liip.ch'
ssh-keyscan -H $GITLAB_HOST >> ~gitlab_ci_runner/.ssh/known_hosts

git submodule init
git submodule foreach --recursive 'git fetch --tags'
git submodule update --recursive

vagrant up

# Run build script in the vagrant box
vagrant ssh -c /vagrant/scripts/build.sh
