#!/bin/bash

# Install ohmyzsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Update zshrc
cp .zshrc ~/.zshrc
