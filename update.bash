#!/bin/bash

# FILES
FILES=" 
.bash_profile
.bashrc
.vimrc
.tmux.conf
.ansible.cfg
"

for file in $FILES
do
printf "comparing $file - "
cmp --silent $file ~/$file
if [ $? = "1" ]; then
    printf "files are NOT the same. copy $file over to ~/ manually \n"
    printf "cp $file ~/$file \n"
else
    printf "files are the same. copying $file over to ~/ for you \n"
    cp $file ~/$file
fi
done

