#!/bin/bash

### ssh config
echo "creating ssh config"
if [ ! -d ~/.ssh ]; then
	mkdir ~/.ssh
fi
chmod 700 ~/.ssh

if [ -f ~/.ssh/config ]; then
	rm ~/.ssh/config
fi

cat >~/.ssh/config <<EOF_SSH_CONFIG
Host *
    LogLevel=ERROR
    StrictHostKeyChecking=no
    UserKnownHostsFile=/dev/null
    ConnectTimeout=10
    IdentityFile ~/some/other/key
EOF_SSH_CONFIG
chmod 644 ~/.ssh/config

if [ -f ~/.ssh/known_hosts ]; then
	rm -f ~/.ssh/known_hosts
fi
