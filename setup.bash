#!/bin/bash

###
### Leverage brew - homebrew for mac | linuxbrew for linux
### 

OS="`uname -s`"

if [ $OS = "Darwin" ]; then
	/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

if [ $OS = "Linux" ]; then
        OS_LINUX_FLAVOR="`cat /etc/os-release | head -1`"
       	if [[ ${OS_LINUX_FLAVOR} = *"Ubuntu"* ]]; then
        sudo apt-get -y install linuxbrew-wrapper
		sudo apt-get -y install build-essential 
        brew << EOF
 
EOF
	fi
fi

###
### PACKAGES
###
        
if [ $OS = "Darwin" ]; then
    PACKAGES_BREW="
tree
watch
tmux
python3
python@2
tfenv
"
    for package in $PACKAGES_BREW
    do
    brew install ${package}
    done
fi

if [ $OS = "Linux" ]; then
        OS_LINUX_FLAVOR="`cat /etc/os-release | head -1`"
        if [[ ${OS_LINUX_FLAVOR} = *"Ubuntu"* ]]; then
PACKAGES_APT="
tmux
"
    for package in $PACKAGES_APT
    do
    sudo apt-get -y install tmux
    done

PACKAGES_BREW="
tfenv
"
    for package in $PACKAGES_BREW
    do
    brew install ${package}
    done
        fi
fi

###
### Install virtualenv
### Mac -  from https://github.com/registerguard/registerguard.github.io/wiki/Install-python,-virtualenv,-virtualenvwrapper-in-a-brew-environment
if [ $OS = "Darwin" ]; then
    pip install virtualenv
    pip install virtualenvwrapper

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
            sudo apt-get -y install virtualenv virtualenvwrapper
            source /usr/share/virtualenvwrapper/virtualenvwrapper.sh
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

### ASSUMING EVERYTHING ABOVE INSTALLED CORRECTLY
### BELOW WORKS ON EITHER DARWIN OR LINUX 

mkvirtualenv ansible1.9
workon ansible1.9
pip install ansible==1.9.4


mkvirtualenv ansible2.3
workon ansible2.3
pip install ansible==2.3

mkvirtualenv awscli
workon awscli
pip install awscli
deactivate

# Install tmux plugin manager
if [ ! -d ~/.tmux ]; then
	mkdir ~/.tmux
fi
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

### Output to todos...
#tmux todo 
echo "install tmux plugins from tmux"
echo "Press prefix + I (capital I, as in Install) to fetch the plugins."

# Create ssh_config
if [ ! -d ~/.ssh ]; then
	mkdir ~/.ssh
	chmod 600 ~/.ssh
fi

if [ ! -f ~/.ssh/config ]; then
	cat > ~/.ssh/config << EOF_SSH_CONFIG
Host *
LogLevel=ERROR
StrictHostKeyChecking=no
ConnectTimeout=10
EOF_SSH_CONFIG
	chmod 644 ~/.ssh/config
fi

if [ ! -f ~/.ssh/known_hosts ]; then
	touch ~/.ssh/known_hosts
	chmod 000 ~/.ssh/known_hosts
fi

