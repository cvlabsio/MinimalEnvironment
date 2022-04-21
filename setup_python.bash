#!/bin/bash

OS="$(uname -s)"

###
### Install virtualenv
### Mac -  from https://github.com/registerguard/registerguard.github.io/wiki/Install-python,-virtualenv,-virtualenvwrapper-in-a-brew-environment
if [ $OS = "Darwin" ]; then

	if [ -f ~/Library/Application\ Support/pip/pip.conf ]; then
		rm ~/Library/Application\ Support/pip/pip.conf
	fi

	SW_VERS="$(sw_vers -productVersion | cut -d. -f1-2)"
	# Mojave, Catalina, Big Sur or Monterey use pip3
	echo $SW_VERS
	if [ $SW_VERS = "10.14" ] || [ $SW_VERS = "10.15" ] || [[ $SW_VERS = 11.* ]] || [[ $SW_VERS = 12.* ]]; then
		echo "pip3"
		pip3 install virtualenv
		pip3 install virtualenvwrapper

		# use python3
		V=$(which virtualenvwrapper.sh)
		sed -i '' 's/which python)/which python3)/' ${V}
		source ${V}

	else
		# Left this here to allow compatability prior to Mojave
		echo "pip"
		pip install virtualenv
		pip install virtualenvwrapper
	fi

	# from https://hackercodex.com/guide/python-development-environment-on-mac-osx/
	mkdir -p ~/Library/Application\ Support/pip
	cat >~/Library/Application\ Support/pip/pip.conf <<EOF_PIP_CONF
[install]
require-virtualenv = true

[uninstall] 
require-virtualenv = true
EOF_PIP_CONF
fi

### Linux
if [ $OS = "Linux" ]; then
	OS_LINUX_FLAVOR="$(cat /etc/os-release | head -1)"
		pip3 install virtualenvwrapper

		# use python3
		V="$(which virtualenvwrapper.sh)"
		sed -i 's/which python)/which python3)/' ${V}
		source ${V}

	if [ ! -d $HOME/.config ]; then
		mkdir $HOME/.config
	fi

	if [ ! -d $HOME/.config/pip ]; then
		mkdir $HOME/.config/pip
	fi

	if [ ! -f $HOME/.config/pip/pip.conf ]; then
		cat >$HOME/.config/pip/pip.conf <<EOF_PIP_CONF
[install]
require-virtualenv = true

[uninstall] 
require-virtualenv = true
EOF_PIP_CONF
	fi
fi

### create frequently used virtualenv
mkvirtualenv ansible2.6
workon ansible2.6
pip install ansible==2.6
deactivate

mkvirtualenv awscli
workon awscli
pip install awscli
deactivate
