#!/bin/bash

### aws config and credentials template
### update after the MinimalEnvironment is setup

if [ ! -d ~/.aws ]; then
	echo "creating .aws directory..."
	mkdir ~/.aws
fi

if [ ! -f ~/.aws/config ]; then
	echo "populating .aws/config template..."
	cat >~/.aws/config <<EOF_CONFIG
[default]
region = us-east-1
EOF_CONFIG
	chmod 600 ~/.aws/config
fi

if [ ! -f ~/.aws/credentials ]; then
	echo "populating .aws/credentials template..."
	cat >~/.aws/credentials <<EOF_CREDS
[my]
aws_access_key_id = A
aws_secret_access_key = A

[thatorg]
region = us-east-1
role_arn = arn:aws:iam::XXXXXX:role/ThatRole
source_profile = my
EOF_CREDS
	chmod 600 ~/.aws/credentials
fi
