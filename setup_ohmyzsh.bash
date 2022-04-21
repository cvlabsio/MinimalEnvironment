#!/bin/bash

# Install ohmyzsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Update zshrc
cp .zshrc ~/.zshrc

# Add customization for zsh
cat > ~/.oh-my-zsh/custom/network_storage.zsh << EOF_NS
# disable .ds_store over network connections
# http://support.apple.com/kb/ht1629
defaults write com.apple.desktopservices DSDontWriteNetworkStores true
EOF_NS

cat > ~/.oh-my-zsh/custom/aliases.zsh << EOF_AL
alias hd="cd /some/alternative/home/dir "
alias ssh="ssh -i ~/alternative/home/dir/.ssh/id_rsa"
EOF_AL

