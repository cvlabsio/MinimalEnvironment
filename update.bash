#!/bin/bash

# FILES
FILES=" 
.bash_profile
.bashrc
.vimrc
.tmux.conf
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

# SSH
mkdir ~/.ssh
chmod 600 ~/.ssh
cat > ~/.ssh/config << EOF_SSH_CONFIG
Host *
    LogLevel=ERROR
    StrictHostKeyChecking=no
    ConnectTimeout=10
EOF_SSH_CONFIG
chmod 644 ~/.ssh/config
touch ~/.ssh/known_hosts
chmod 000 ~/.ssh/known_hosts



