#!/bin/bash

###
### Leverage brew - homebrew for mac and linux
### 

OS="`uname -s`"

if [ $OS = "Darwin" ]; then
    echo "Darwin"
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
fi

if [ $OS = "Linux" ]; then
        OS_LINUX_FLAVOR="`cat /etc/os-release | head -1`"
       	if [[ ${OS_LINUX_FLAVOR} = *"Ubuntu"* ]]; then
            /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
	fi
fi

###
### PACKAGES
###
        
if [ $OS = "Darwin" ]; then
    PACKAGES_BREW="
apr
apr-util
awscli
dos2unix
fontconfig
freetype
gd
gdbm
gettext
gmp
go
graphviz
htop
icu4c
ifstat
iperf
jpeg
jq
libevent
libpng
libtiff
libtool
lynx
mtr
ncdu
netcat
nettle
oniguruma
openssl
perl
postgresql
pstree
pwgen
python
python3
readline
sqlite
stoken
subversion
terraform
tfenv
tmux
tree
vault
vnstat
watch
webp
xz
"
    for package in $PACKAGES_BREW
    do
    echo "${package}"
    #####brew install ${package}
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

mkvirtualenv ansible2.6
workon ansible2.6
pip install ansible==2.6

mkvirtualenv awscli
workon awscli
pip install awscli
deactivate

# Install tmux plugin manager
if [ ! -d ~/.tmux ]; then
	mkdir ~/.tmux
fi
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# Install vim pluging manager
# https://github.com/junegunn/vim-plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim --insecure

echo "Run vim +PlugInstall"

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

