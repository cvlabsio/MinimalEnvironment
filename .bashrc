# .bash_profile is executed for login shells
# .bashrc is executed for interactive non-login shells
#  Login Shells = Via Putty or ssh

# Darwin or Linux
MY_OS=`uname -s`

# LS COLORS
if [ $MY_OS = "Darwin" ]; then
    alias ls='ls -GFh'
elif [ $MY_OS = "Linux" ]; then
    alias ls='ls --color=auto'
fi

# PROMPT
export PS1="\[\033[36m\]\u\[\033[m\]@\[\033[32m\]\h \[\033[33;1m\]\w \[\033[36m\] \D{%F %T}\[\033[m\]\n$ "

# COLORS
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

