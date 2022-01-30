# .bash_profile is executed for login shells
# .bashrc is executed for interactive non-login shells
#  Login Shells = ssh
if [ -f ~/.bashrc ]; then
    . ~/.bashrc
fi

# local customizations go into .bashrc_local
if [ -f ~/.bashrc_local ]; then
    . ~/.bashrc_local
fi


