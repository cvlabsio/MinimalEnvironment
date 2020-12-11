# Minimal environment files
Set of scripts and configs to get started with a minimal environment. 

.bash_profile:  Make sure we source .bashrc

.bash_rc:       Magic happens here

.vimrc:         Color syntax highlighting and tab settings

.tmux.conf:     Useful tmux plugins
=======
## update.bash
Copies over some minimal files

### .bash_profile  
> Make sure we source .bashrc


Instructions
============
1 - Run update.bash to copy over some minimal environment files.

2 - Logout and log back in to your shell

3 - Run setup.bash to install brew ( homebrew for mac / linuxbrew for linux ), packages in brew and or apt or yum ( future ), virtualenv, create some virtualenvs for ansible & aws, tmux plugin manager, ssh config and ssh known_hosts
=======
### .bash_rc
> Magic happens here

### .vimrc         
> Color syntax highlighting and tab settings

### .tmux.conf    
> Useful tmux plugins


## setup.bash
Installs the following
>
1. homebrew for mac
1. linuxbrew for linux
1. packages in brew format
1. packages in apt format
1. packings in yum format ( future )
1. virtualenv
1. tmux plugin manager
1. ssh config
1. ssh known_hosts

Creates virtualenvs for ansible & aws


## Instructions

1. Run ./update.bash
1. Logout and log back in to your shell
1. Run ./setup.bash


