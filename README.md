# Minimal environment files
Set of scripts and configs to get started with a minimal environment. 

Most recently verified on Ubuntu 20.04, Apple Monterey on both Intel and Apple Silicon. 

## Files
### .ansible.cfg
simple ansible configuration file

### .bash_profile
make sure we source .bashrc
> .bash_profile is executed for login shells
>  
> .bashrc is executed for interactive non-login shells

### .bashrc
magic happens here

### .tmux.conf
useful tmux plugins

### .vimrc
color syntax highlighting and tab settings

### setup.bash
Installs the following
>
1. homebrew for mac or linux
1. install packages via brew
1. virtualenv
1. tmux plugin manager
1. ssh config
1. ssh known_hosts

### update.bash
compares files with the files in your home directory. 

## Instructions

1. Run ./update.bash
1. Logout and log back in to your shell
1. Run ./setup.bash



## Reference

### Mac bootstrap
```
### Mac bootstrap
chsh -s /bin/bash
mkdir meh
cd meh
curl -LO https://github.com/baldwinsung/MinimalEnvironment/archive/master.zip
unzip master.zip
cd MinimalEnvironment-master/
./update.bash
#mv ~/.bashrc ~/.bashrc_local
logout
# open new shell
cd meh/MinimalEnvironment-master
./setup.bash
logout
# open new shell
```

### CentOS bootstrap
```
### CentOS bootstrap
sudo dnf install wget unzip gcc make vim -y
mkdir meh
cd meh
wget https://github.com/baldwinsung/MinimalEnvironment/archive/master.zip
unzip master.zip
cd MinimalEnvironment-master/
./update.bash
#mv ~/.bashrc ~/.bashrc_local
logout
# open new shell
cd meh/MinimalEnvironment-master
./setup.bash
logout
# open new shell
```

### Ubuntu bootstrap
```
### Ubuntu bootstrap
sudo apt install unzip gcc make vim curl git zsh -y
mkdir meh
cd meh
wget https://github.com/baldwinsung/MinimalEnvironment/archive/master.zip
unzip master.zip
cd MinimalEnvironment-master/
./update.bash
#mv ~/.bashrc ~/.bashrc_local
logout
# open new shell
cd meh/MinimalEnvironment-master
./setup.bash
logout
# open new shell
```

### Migrating Apple Terminal Settings
copy com.apple.Terminal.plist to ~/Library/Preferences/com.apple.Terminal.plist via Finder
