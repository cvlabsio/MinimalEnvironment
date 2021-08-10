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
       	if [[ ${OS_LINUX_FLAVOR} = *"Ubuntu"* ]] || [[ ${OS_LINUX_FLAVOR} = *"CentOS"* ]] ; then
            /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
	fi
fi

###
### PACKAGES
###
        
PACKAGES_BREW="
apr
apr-util
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
oniguruma
openssl
ranger
perl
postgresql
pstree
pwgen
python
python3
readline
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

for package in $PACKAGES_BREW
do
echo "${package}"
brew install ${package}
done
