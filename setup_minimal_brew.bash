#!/bin/bash

###
### Leverage brew - homebrew for mac and linux
###

OS="$(uname -s)"

if [ $OS = "Darwin" ]; then
	echo "Darwin"

	echo "Checking if brew is already installed..."
	which brew &>/dev/null
	if [ $? -eq 1 ]; then
		echo >&2 "brew is not installed. installing brew..."
		/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
	else
		echo "brew is already installed!"
	fi
fi

if [ $OS = "Linux" ]; then

    if [ -d /home/linuxbrew/.linuxbrew/var/homebrew ]; then
        sudo chown -R $(whoami) /home/linuxbrew/.linuxbrew/var/homebrew
    fi

    OS_LINUX_FLAVOR="$(cat /etc/os-release | head -1)"
    if [[ ${OS_LINUX_FLAVOR} = *"Ubuntu"* ]]; then
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
    fi
     
    if [[ ${OS_LINUX_FLAVOR} = *"CentOS"* ]]; then
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
    fi

    if [[ ${OS_LINUX_FLAVOR} = *"Hat"* ]]; then
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
    fi
fi

### check if brew was actually installed
if ! command -v brew &>/dev/null; then
	echo "brew could not be found."
	exit
fi

### Setup paths for go
mkdir -p $HOME/go/{bin,src}

###
### PACKAGES
###

PACKAGES_BREW="
direnv
starship
"

printf "\ninstalling packages via brew...\n"
for package in $PACKAGES_BREW; do
	echo "${package}"
	brew install ${package}
done
