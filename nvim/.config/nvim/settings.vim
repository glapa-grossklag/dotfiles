set nocompatible
set mouse=a
set showmatch
set scrolloff=5
set autoread
set undofile
set undodir=~/.config/nvim/undodir
set encoding=utf-8
set clipboard+=unnamedplus
set splitright
set splitbelow
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set smartindent
set textwidth=80
set nowrap
set linebreak

" Open a local `.vimrc` if one is found.
set exrc

" Searching
set incsearch
set nohlsearch
set ignorecase
set smartcase

" Behind the scenes
set lazyredraw
set hidden
set noswapfile

" Line numbers
set relativenumber
set number
set shortmess+=c

set cursorline
set conceallevel=0
set noshowmode
set laststatus=2
set signcolumn=yes

" Folding
set foldmethod=indent
set fillchars=fold:\ ,vert:\|
set foldtext=MyFoldText()
function MyFoldText()
    let indent = repeat(repeat(' ', &shiftwidth), v:foldlevel)
    return indent . '...'
endfunction

" Spelling
set spelllang=en_us
set nospell

if has('termguicolors')
    set termguicolors
endif

" Colorscheme
syntax on
let g:gruvbox_sign_column="bg0"
let g:gruvbox_italic=1
let g:gruvbox_invert_selection=0
let g:gruvbox_improved_warnings=1
let g:gruvbox_guisp_fallback='fg'
set background=dark
colorscheme gruvbox

" Plugin-Specific
let g:lightline                         = { 'colorscheme': 'gruvbox' }

let g:vim_markdown_new_list_item_indent = 0
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_conceal_code_blocks = 0

let g:GPGDefaultRecipients              = ["Miles Glapa-Grossklag"]

let g:jrnlr_dir                         = '~/notes/daily'
let g:jrnlr_extension                   = '.md'
let g:jrnlr_template                    = '~/notes/daily/template.md'
