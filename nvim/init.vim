" ===
" Vim
" ===

" ---
" Plugins
" ---

call plug#begin("~/.config/nvim/vim-plug")
" ./plugin/lightline.vim
Plug 'itchyny/lightline.vim'

" ./plugin/fzf.vim
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" ./plugin/goyo.vim
Plug 'junegunn/goyo.vim'

" ./plugin/coc.vim
Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'plasticboy/vim-markdown'
Plug 'vimwiki/vimwiki'

Plug 'tpope/vim-commentary'
Plug 'psliwka/vim-smoothie'
Plug 'morhetz/gruvbox'
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
set undodir=~/.config/nvim/undodir
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
" let g:gruvbox_contrast_dark="hard"
let g:gruvbox_sign_column="bg0"
let g:gruvbox_transparent_bg=1
let g:gruvbox_invert_selection=0
let g:gruvbox_improved_warnings=1
let g:gruvbox_guisp_fallback='fg'
colorscheme gruvbox
highlight Normal ctermbg=none
highlight NonText ctermbg=none

" ---
" Mappings
" ---

let mapleader = " "
inoremap jj <Esc>

" Folds
" set foldmethod=syntax
set fcs=fold:\ ,vert:\| " Make folding prettier
nnoremap <leader><leader> za
vnoremap <leader><leader> zf

" Splits
set splitright
set splitbelow

" Add ; to end of line
noremap <silent> <leader>; mzA;<Esc>`z

" Terminal
noremap <silent> <leader>t :split +terminal<CR><C-w>:resize 15%<CR>
noremap <silent> <leader>T :vsplit +terminal<CR>
tnoremap <Esc> <C-\><C-n>

" Use system clipboard
set clipboard+=unnamedplus

" Create new line without entering insert mode
nnoremap <leader>o o<ESC>
nnoremap <leader>O O<ESC>
