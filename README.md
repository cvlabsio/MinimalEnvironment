# Minimal environment files
Set of scripts and configs to get started with a minimal environment. 

## Instructions

### Mac bootstrap
Verified with Monterey on both Intel and Apple Silicon

```
### Mac bootstrap
chsh -s /bin/bash
mkdir meh
cd meh
curl -LO https://github.com/baldwinsung/MinimalEnvironment/archive/master.zip
unzip master.zip
cd MinimalEnvironment-master/
./update.bash
#mv ~/.bashrc ~/.bashrc_local
logout
# open new shell
cd meh/MinimalEnvironment-master
./setup.bash
logout
# open new shell
```

### CentOS bootstrap
CentOS 7

```
### CentOS bootstrap
sudo dnf install wget unzip gcc make vim -y
mkdir meh
cd meh
wget https://github.com/baldwinsung/MinimalEnvironment/archive/master.zip
unzip master.zip
cd MinimalEnvironment-master/
./update.bash
#mv ~/.bashrc ~/.bashrc_local
logout
# open new shell
cd meh/MinimalEnvironment-master
./setup.bash
logout
# open new shell
```

### Ubuntu bootstrap
Verified with Ubuntu 20.04

```
### Ubuntu bootstrap
sudo apt install unzip gcc make vim curl git zsh -y
mkdir meh
cd meh
wget https://github.com/baldwinsung/MinimalEnvironment/archive/master.zip
unzip master.zip
cd MinimalEnvironment-master/
./update.bash
#mv ~/.bashrc ~/.bashrc_local
logout
# open new shell
cd meh/MinimalEnvironment-master
./setup.bash
logout
# open new shell
```

### Migrating Apple Terminal Settings
copy com.apple.Terminal.plist to ~/Library/Preferences/com.apple.Terminal.plist via Finder
