#!/bin/bash

# FILES
FILES=" 
.bash_profile
.bashrc
.vimrc
.tmux.conf
.ansible.cfg
.zshrc
.starship-config.toml
.gitconfig
"

for file in $FILES
do
printf "comparing $file - "
cmp --silent $file ~/$file
if [ $? = "1" ]; then
    diff $file ~/$file
    printf "files are NOT the same. copy $file over to ~/ manually \n"
    printf "\ncp $file ~/$file \n"
else
    printf "files are the same. copying $file over to ~/ for you \n"
    cp $file ~/$file
fi
done

