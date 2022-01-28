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
	OS_LINUX_FLAVOR="$(cat /etc/os-release | head -1)"
	if [[ ${OS_LINUX_FLAVOR} = *"Ubuntu"* ]] || [[ ${OS_LINUX_FLAVOR} = *"CentOS"* ]]; then
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
apr
apr-util
autopep8
awscli
cdpr
direnv
dos2unix
fing
fontconfig
fping
freetype
gd
gdbm
gettext
gh
git
gmp
go
graphviz
htop
icu4c
ifstat
instalooter
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
nmap
oniguruma
openssl
ranger
packer
perl
postgresql
pstree
pwgen
python
python3
readline
shfmt
sqlite
starship
stoken
subversion
terraform
terragrunt
tfenv
tmux
tree
vault
vnstat
watch
webp
whatmask
xz
youtube-dl
"

printf "\ninstalling packages via brew...\n"
for package in $PACKAGES_BREW; do
	echo "${package}"
	brew install ${package}
done
