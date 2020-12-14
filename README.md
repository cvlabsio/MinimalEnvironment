# Minimal environment files
Set of scripts and configs to get started with a minimal environment. 

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
1. homebrew for mac
1. linuxbrew for linux
1. packages in brew format
1. packages in apt format
1. packages in yum format ( future )
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


### CentOS bootstrap
```
### CentOS bootstrap
sudo dnf install wget unzip gcc make vim -y
mkdir meh
cd meh
wget https://github.com/baldwinsung/MinimalEnvironment/archive/updates.zip
unzip updates.zip
cd MinimalEnvironment-updates/
./update.bash
#mv ~/.bashrc ~/.bashrc_local
logout
ssh #
cd meh/MinimalEnvironment-updates
./setup.bash
logout
ssh #
```

### Ubuntu bootstrap
```
### Ubuntu bootstrap
sudo apt install unzip gcc make -y
mkdir meh
cd meh
wget https://github.com/baldwinsung/MinimalEnvironment/archive/updates.zip
unzip updates.zip
cd MinimalEnvironment-updates/
./update.bash
#mv ~/.bashrc ~/.bashrc_local
logout
ssh #
cd meh/MinimalEnvironment-updates
./setup.bash
logout
ssh #
```
