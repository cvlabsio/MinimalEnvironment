# .bash_profile is executed for login shells
# .bashrc is executed for interactive non-login shells
#  Login Shells = ssh

### FUNCTIONS
# Add git branch name to bash prompt from https://coderwall.com/p/fasnya/add-git-branch-name-to-bash-prompt
parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

# Darwin, Linux or SunOS
MY_OS=`uname -s`

# LS COLORS
# TERMINAL COLORS
if [ $MY_OS = "Darwin" ]; then
    alias ls='ls -GFh'
    export TERM=xterm-256color
    # from  https://hackercodex.com/guide/mac-development-configuration/
    # Ensure user-installed binaries take precedence
    export PATH=/usr/local/bin:/usr/local/sbin:/opt/homebrew/bin:$PATH
    V=`which virtualenvwrapper.sh`
    source ${V}

elif [ $MY_OS = "Linux" ]; then
    alias ls='ls --color=auto'
    alias vi='vim'
    export TERM=linux

    # PIP USER PATH
    export PATH="${HOME}/.local/bin:$PATH"

    # LINUXBREW
    export PATH="/home/linuxbrew/.linuxbrew/bin:/home/linuxbrew/.linuxbrew/sbin:$PATH"
    export MANPATH="/home/linuxbrew/.linuxbrew/share/man:$MANPATH"
    export INFOPATH="/home/linuxbrew/.linuxbrew/share/info:$INFOPATH"

    OS_LINUX_FLAVOR="`cat /etc/os-release | head -1`"
        if [[ ${OS_LINUX_FLAVOR} = *"Ubuntu"* ]]; then
            source /home/linuxbrew/.linuxbrew/bin/virtualenvwrapper.sh
        fi

        if [[ ${OS_LINUX_FLAVOR} = *"CentOS"* ]]; then
            source /usr/local/bin/virtualenvwrapper.sh
        fi

        if [[ ${OS_LINUX_FLAVOR} = *"Hat"* ]]; then
            source ${HOME}/.local/bin/virtualenvwrapper.sh
        fi

    # THINGS WE LIKE FROM STOCK .bashrc FROM UBUNTU
    HISTCONTROL=ignoreboth
    shopt -s histappend
    HISTSIZE=1000
    HISTFILESIZE=2000
    shopt -s checkwinsize
    [ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"
    if [ -x /usr/bin/dircolors ]; then
        test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
        alias ls='ls --color=auto'
        alias grep='grep --color=auto'
        alias fgrep='fgrep --color=auto'
        alias egrep='egrep --color=auto'
    fi
    alias ll='ls -alF'
    alias la='ls -A'
    alias l='ls -CF'
elif [ $MY_OS = "SunOS" ]; then
    alias ls='/usr/gnu/bin/ls --color=auto'
    alias vi='vim'
    export TERM=xtermc
fi

# EDITOR
export EDITOR=vim

# PROMPT
export PS1="\[\033[36m\]\u\[\033[m\]@\[\033[32m\]\h \[\033[33;1m\]\w\[\033[33m\]\$(parse_git_branch)\[\033[36m\] \D{%F %T}\[\033[m\]\n$ "

# COLORS
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

# starship
eval "$(starship init bash)"
