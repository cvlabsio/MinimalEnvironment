"Colors
colorscheme slate
syntax on

"Useful to avoid indentation issues with Python
set expandtab
set tabstop=4
set shiftwidth=4

" Use VIM PLug
call plug#begin('~/.vim/plugged')
" Shorthand notation; fetches https://github.com/pearofducks/ansible-vim
Plug 'pearofducks/ansible-vim'
Plug 'airblade/vim-gitgutter'
