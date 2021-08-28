" ---------------------------------------------------------------------------- "
"       o                                                                      "
"           _  _  _    ,_    __                                                "
"  |  |_|  / |/ |/ |  /  |  /                                                  "
" o \/  |_/  |  |  |_/   |_/\___/                                              "
" ---------------------------------------------------------------------------- "
" A minimal .vimrc without plugins.                                            "
" ---------------------------------------------------------------------------- "

set nocompatible
syntax on
set mouse=a
set showmatch
set scrolloff=5
set autoread
set encoding=utf-8
set clipboard+=unnamedplus
set noswapfile
set splitright
set splitbelow
set incsearch
set nohlsearch
set ignorecase
set smartcase
set textwidth=80
set nowrap
set linebreak
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set smartindent
set relativenumber
set number
set cursorline
set conceallevel=0

" ---------------------------------------------------------------------------- "
"                                  Cosmetic                                    "
" ---------------------------------------------------------------------------- "

set background=dark

" https://github.com/morhetz/gruvbox
colorscheme gruvbox

" ---------------------------------------------------------------------------- "
"                                   Mappings                                   "
" ---------------------------------------------------------------------------- "

let mapleader = " "

" Exit insert mode easily.
inoremap jj <Esc>
