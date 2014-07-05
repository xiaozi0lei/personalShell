#!/bin/bash

# initial the environment variables
log=init.log

# create feature directory
if [ ! -d ~/feature ]
then
    echo "create ~/feature/apps"
    mkdir -p ~/feature/apps
    if [ $? -eq 0 ]
    then
        echo "mkdir ~/feature failed"
        exit 1
    fi
fi

# git clone the tools repo to the new account

# create the github directory
if [ ! -d ~/github ]
then 
    mkdir ~/github
    if [ $? -eq 0 ]
    then
        echo "mkdir ~/github failed"
        exit 1
    fi
fi

cd ~/github
logerr "cd" "dir"

# git clone the tools repo
git clone ###~/gitRepo/tools.git
logerr "git" "clone"

# import the common functions
source ~/github/tools/lib/handle.sh

cd ~/github/tools

export SUN_TOOL_HOME=`pwd`

# ln the bashrc to ~/.bashrc
if [ -f ~/.bashrc ]
then
    mv ~/.bashrc ~/.bashrcbak
    ln -s  $SUN_TOOL_HOME/config/bashrc ~/.bashrc
else
    ln -s  $SUN_TOOL_HOME/config/bashrc ~/.bashrc
fi
logerr "create" "bashrc"

# cp the sshkey, config file to ~/.ssh
if [ -d ~/.ssh ]
then
    if [ -d ~/.ssh/bak ]
    then
        cp $SUN_TOOL_HOME/bak/sshkey/id_xiaozi0lei* ~/.ssh/bak
    else
        mkdir ~/.ssh/bak
        cp $SUN_TOOL_HOME/bak/sshkey/id_xiaozi0lei* ~/.ssh/bak
    fi
    if [ -f ~/.ssh/config ]
    then
        cat $SUN_TOOL_HOME/config/config >> ~/.ssh/config
    else
        cp $SUN_TOOL_HOME/config/config ~/.ssh
    fi
else
    mkdir -p ~/.ssh/bak
    chmod 700 ~/.ssh
    cp $SUN_TOOL_HOME/config/config ~/.ssh
    cp $SUN_TOOL_HOME/bak/sshkey/id_xiaozi0lei* ~/.ssh/bak
fi

logerr "cp" "sshkey,config"

cd $SUN_TOOL_HOME

git remote remove origin
logerr "git remote remove" "origin"
git remote add origin ###~/gitRepo/tools.git
logerr "git remote add" "origin"

exit 0

