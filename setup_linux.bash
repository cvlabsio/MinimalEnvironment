#!/bin/bash

OS="$(uname -s)"
if [ $OS = "Linux" ]; then
	OS_LINUX_FLAVOR="$(cat /etc/os-release | head -1)"
	if [[ ${OS_LINUX_FLAVOR} = *"Ubuntu"* ]]; then
		# install chrome
		wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
		sudo apt install ./google-chrome-stable_current_amd64.deb

		# AWS VPN Client for 20.04
		wget -q -O - https://d20adtppz83p9s.cloudfront.net/GTK/latest/debian-repo/awsvpnclient_public_key.asc | sudo apt-key add -
		echo "deb [arch=amd64] https://d20adtppz83p9s.cloudfront.net/GTK/latest/debian-repo ubuntu-20.04 main" | sudo tee /etc/apt/sources.list.d/aws-vpn-client.list
		sudo apt-get update
		sudo apt-get install awsvpnclient

		# Slack Beta
		sudo snap install slack --classic

	fi

fi
