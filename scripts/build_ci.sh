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

# make sure GitHub is known to the runner
GITHUB_HOST='github.com'
ssh-keyscan -H $GITHUB_HOST >> ~gitlab_ci_runner/.ssh/known_hosts

git reset --hard HEAD
git submodule init
git submodule foreach --recursive 'git fetch --tags'
git submodule update --recursive

# remove *.pyc files after checking out everything
find $DIR/.. -name "*.pyc" | xargs rm

# install the vagrant plugins
vagrant plugin install vagrant-omnibus
vagrant plugin install vagrant-triggers

# check if there is already a vagrant box
vtext=`vagrant status 2>/dev/null | awk '{$1=""; print $0}' | sed 's/^ //g' | grep virtualbox` 
if [[ $vtext =~ .*(running).* ]]
then
    vagrant reload --provision
elif [[ $vtext =~ .*(poweroff).* ]]
then
    vagrant up --provision
else
    vagrant up
    vagrant halt
    vagrant up || vagrant ssh -c "sudo /etc/init.d/vboxadd setup" && vagrant reload
fi

# Run build script in the vagrant box
vagrant ssh -c /vagrant/scripts/build.sh
