" ===
" Vim
" ===

" ---
" Plugins
" ---

" Install vim-plug if not already installed
if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin("~/.vim/plugged")

" ./plugin/lightline.vim
Plug 'itchyny/lightline.vim'
Plug 'shinchu/lightline-gruvbox.vim'

" ./plugin/fzf.vim
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" ./plugin/goyo.vim
Plug 'junegunn/goyo.vim'

" ./plugin/coc.vim
Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'plasticboy/vim-markdown'

Plug 'tpope/vim-commentary'
Plug 'psliwka/vim-smoothie'
call plug#end()

" ---
" General
" ---

set hidden              " Don't unload buffers
set nocompatible        " Disable vi compatibility
set encoding=utf-8      " Use UTF-8 encoding

" Recognize .md as markdown
autocmd BufNewFile,BufRead *.md set filetype=markdown

" Load ftplugin dir
filetype plugin on

" Use undodir
set undofile
set undodir=~/.vim/undodir

" Store viminfo in .vim folder
" set viminfo+=n~/.vim/viminfo
set viminfo+=n~/.config/nvim/viminfo

" No swap file
set noswapfile

" Indentation
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set smartindent
set nowrap

" Searching
set incsearch
set nohlsearch
set ignorecase
set smartcase

" Mouse
set mouse=a

syntax on                           " Enable syntax highlighting
hi Normal guibg=NONE ctermbg=NONE   " Use terminal colors as background
set rnu                             " Use relative line numbers
set nu
set lazyredraw
set showmatch                       " Show matching bracket/quote/parenthesis when typing
set cursorline                      " Highlight current line
set laststatus=2
set noshowmode                      " Disable normal statusbar
set scrolloff=5                     " Keep cursor five lines away from edge
set autoread

" Colorscheme
let g:gruvbox_contrast_dark="hard"
let g:gruvbox_sign_column="bg0"
let g:gruvbox_transparent_bg=1
let g:gruvbox_invert_selection=0
let g:gruvbox_improved_warnings=1
let g:gruvbox_guisp_fallback='fg'
colorscheme gruvbox


" ---
" Mappings
" ---

let mapleader = " "
inoremap jj <Esc>

" Folds
set foldmethod=syntax
set fcs=fold:\ ,vert:\| " Make folding prettier
nnoremap <leader><leader> za
vnoremap <leader><leader> zf

" Splits
set splitright
set splitbelow

" Add ; to end of line
noremap <silent> <leader>; mzA;<Esc>`z

" Terminal
" noremap <silent> <leader>t :below terminal<CR><C-w>:resize 15%<CR>
" noremap <silent> <leader>T :vertical below terminal<CR>
noremap <silent> <leader>t :split +terminal<CR><C-w>:resize 15%<CR>
noremap <silent> <leader>T :vsplit +terminal<CR>
tnoremap <Esc> <C-\><C-n>

" Use system clipboard
set clipboard+=unnamedplus
