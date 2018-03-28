# .bash_profile is executed for login shells
# .bashrc is executed for interactive non-login shells
#  Login Shells = Via Putty or ssh

### FUNCTIONS
# Add git branch name to bash prompt from https://coderwall.com/p/fasnya/add-git-branch-name-to-bash-prompt
parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

# Darwin or Linux
MY_OS=`uname -s`

# LS COLORS
# TERMINAL COLORS
if [ $MY_OS = "Darwin" ]; then
    alias ls='ls -GFh'
    export TERM=xterm-256color
elif [ $MY_OS = "Linux" ]; then
    alias ls='ls --color=auto'
    alias vi='vim'
    export TERM=linux
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

# CUSTOM

