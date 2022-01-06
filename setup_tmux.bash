#!/bin/bash

# Install tmux plugin manager
if [ ! -d ~/.tmux ]; then
	mkdir ~/.tmux
	git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
	tmux start-server
	tmux new-session -d
	~/.tmux/plugins/tpm/scripts/install_plugins.sh
	tmux kill-server
fi
