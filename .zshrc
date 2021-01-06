export ZSH=$HOME/.oh-my-zsh
ZSH_THEME="robbyrussell"

eval "$(starship init zsh)"
eval "$(direnv hook zsh)"

export STARSHIP_CONFIG=~/.starship-config.toml
export WORKON_HOME=$HOME/.virtualenvs
source /usr/local/bin/virtualenvwrapper.sh
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin

