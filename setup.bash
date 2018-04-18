#!/bin/bash

### MACOSX
# Install homebrew!
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Install packages via homebrew
PACKAGES="
tree
watch
tmux
python3
python@2
tfenv
"
for package in $PACKAGES
do
brew install ${package}
done

# Install virtualenv
# from https://github.com/registerguard/registerguard.github.io/wiki/Install-python,-virtualenv,-virtualenvwrapper-in-a-brew-environment
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

mkvirtualenv ansible1.9
workon ansible1.9
pip install ansible==1.9.4

mkvirtualenv ansible2.3
workon ansible2.3
pip install ansible==2.3

mkvirtualenv awscli
workon awscli
pip install awscli

# Install tmux plugin manager
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

### Output to todos...
#tmux todo 
echo "install tmux plugins from tmux"
echo "Press prefix + I (capital I, as in Install) to fetch the plugins."


