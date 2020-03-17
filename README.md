# Minimal environment files
Set of scripts and configs to get started with a minimal environment. 

## update.bash
Copies over some minimal files

### .bash_profile  
> Make sure we source .bashrc

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

