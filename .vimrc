" pathogen
call pathogen#infect()
syntax on
filetype plugin indent on

" solarized
set background=dark
let g:solarized_termtrans = 1
colorscheme solarized

" not vi
set nocompatible

" for security
set modelines=0

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
