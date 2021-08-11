#!/bin/bash

### ssh config
echo "creating ssh config"
if [ ! -d ~/.ssh ]; then
	mkdir ~/.ssh
fi
chmod 700 ~/.ssh

if [ ! -f ~/.ssh/config ]; then
	cat > ~/.ssh/config << EOF_SSH_CONFIG
Host *
LogLevel=ERROR
StrictHostKeyChecking=no
ConnectTimeout=10
EOF_SSH_CONFIG
fi
chmod 644 ~/.ssh/config

### ssh known_hosts
echo "do not allow writes to known_hosts"
if [ ! -f ~/.ssh/known_hosts ]; then
	touch ~/.ssh/known_hosts
else
    rm -f ~/.ssh/known_hosts
	touch ~/.ssh/known_hosts
fi
chmod 000 ~/.ssh/known_hosts

