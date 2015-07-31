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
if  [ "$DESTROY_BOX" = true ] ; then
    vagrant destroy --force
fi

# make sure Gitlab is known to the runner
GITLAB_HOST='gitlab.liip.ch'
ssh-keyscan -H $GITLAB_HOST >> ~gitlab_ci_runner/.ssh/known_hosts

git submodule init
git submodule foreach --recursive 'git fetch --tags'
git submodule update --recursive

# install the vagrant plugins
vagrant plugin install vagrant-omnibus
vagrant plugin install vagrant-triggers

# check if there is already a vagrant box
vtext=`vagrant status 2>/dev/null | awk '{$1=""; print $0}' | sed 's/^ //g' | grep virtualbox` 
if [[ $vtext =~ .*(running|poweroff).* ]]
then
    vagrant reload --provision
else
    vagrant up
fi

# Run build script in the vagrant box
vagrant ssh -c /vagrant/scripts/build.sh
