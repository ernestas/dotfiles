" pathogen
call pathogen#infect()
syntax on
filetype plugin indent on

" not vi
set nocompatible

" for security
set modelines=0

" solarized
set background=dark
let g:solarized_termtrans = 1
colorscheme solarized

" text
set encoding=utf-8
set autoindent
set undofile

" cli
set wildmenu

" view
set scrolloff=5
set relativenumber
set showmode
set showcmd
set ruler
set cursorline
set laststatus=2
set colorcolumn=80

" speed
set ttyfast

" the glorious
let mapleader=","

" search
nnoremap / /\v
vnoremap / /\v
set ignorecase
set smartcase
set gdefault
set incsearch
set showmatch
set hlsearch
nnoremap <leader><space> :noh<cr>
nnoremap <tab> %
vnoremap <tab> %

" experimental
nnoremap ; :

" tabs
au BufNewFile,BufReadPost *.coffee setl shiftwidth=2 tabstop=2 expandtab
au BufNewFile,BufReadPost *.php setl shiftwidth=4 tabstop=4

" folds
au BufNewFile,BufReadPost *.coffee setl foldmethod=indent nofoldenable
au BufNewfile,BufReadPost *.php setl foldmethod=indent
