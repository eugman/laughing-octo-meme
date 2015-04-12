filetype plugin indent on
set autoindent
set tabstop=4
set shiftwidth=4
set nocompatible
syntax on
set ruler
set background=dark

python from powerline.vim import setup as powerline_setup
python powerline_setup()
python del powerline_setup

set laststatus=2
