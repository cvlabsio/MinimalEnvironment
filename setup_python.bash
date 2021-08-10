#!/bin/bash

###
### Install virtualenv
### Mac -  from https://github.com/registerguard/registerguard.github.io/wiki/Install-python,-virtualenv,-virtualenvwrapper-in-a-brew-environment
if [ $OS = "Darwin" ]; then

    if [ -f ~/Library/Application\ Support/pip/pip.conf ]; then
        rm ~/Library/Application\ Support/pip/pip.conf 
    fi
    
    SW_VERS="`sw_vers -productVersion | cut -d. -f1-2`"
    # Mojave or Catalina... use pip3
    if [ $SW_VERS = "10.14" ] || [ $SW_VERS = "10.15" ]; then
        pip3 install virtualenv
        pip3 install virtualenvwrapper
    else
    # Left this here to allow compatability prior to Mojave
        pip install virtualenv
        pip install virtualenvwrapper
    fi
       
# use python3 
sed -i '' 's/which python/which python3/' /usr/local/bin/virtualenvwrapper.sh
source /usr/local/bin/virtualenvwrapper.sh
	
# from https://hackercodex.com/guide/python-development-environment-on-mac-osx/
mkdir -p ~/Library/Application\ Support/pip
cat > ~/Library/Application\ Support/pip/pip.conf << EOF_PIP_CONF
[install]
require-virtualenv = true

[uninstall] 
require-virtualenv = true
EOF_PIP_CONF
fi 

if [ $OS = "Linux" ]; then
        OS_LINUX_FLAVOR="`cat /etc/os-release | head -1`"
        if [[ ${OS_LINUX_FLAVOR} = *"Ubuntu"* ]]; then
            sudo apt-get -y install virtualenvwrapper
            source /usr/share/virtualenvwrapper/virtualenvwrapper.sh
        fi

        if [[ ${OS_LINUX_FLAVOR} = *"CentOS"* ]]; then
            pip3 install virtualenvwrapper
            sudo sed -i 's/which python/which python3/' /usr/local/bin/virtualenvwrapper.sh
            source /usr/local/bin/virtualenvwrapper.sh
        fi

    if [ ! -d $HOME/.config ]; then
        mkdir $HOME/.config
    fi

    if [ ! -d $HOME/.config/pip ]; then
        mkdir $HOME/.config/pip
    fi

    if [ ! -f $HOME/.config/pip/pip.conf ]; then
        cat > $HOME/.config/pip/pip.conf << EOF_PIP_CONF
[install]
require-virtualenv = true

[uninstall] 
require-virtualenv = true
EOF_PIP_CONF
    fi
fi

### FIX

mkvirtualenv ansible2.6
workon ansible2.6
pip install ansible==2.6

mkvirtualenv awscli
workon awscli
pip install awscli
deactivate
