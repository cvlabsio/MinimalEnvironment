export ZSH=$HOME/.oh-my-zsh
ZSH_THEME="robbyrussell"
plugins=(git)
source $ZSH/oh-my-zsh.sh

export STARSHIP_CONFIG=~/.starship-config.toml
export WORKON_HOME=$HOME/.virtualenvs
export GOPATH=$HOME/go
export PATH=/opt/homebrew/bin:/home/linuxbrew/.linuxbrew/bin:$PATH:$GOPATH/bin
V=`which virtualenvwrapper.sh`
source ${V}

eval "$(starship init zsh)"
eval "$(direnv hook zsh)"
