#!/bin/bash

# Install vim plugin manager
# https://github.com/junegunn/vim-plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
	https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim --insecure
vim +PlugInstall +qa
