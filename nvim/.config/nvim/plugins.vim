" Install vim-plug if it's missing.
let data_dir = stdpath('data') . '/site'
if empty(glob(data_dir . '/autoload/plug.vim'))
    silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Load plugins.
call plug#begin(stdpath('data') . '/vim-plug')

" LSP
Plug 'neovim/nvim-lspconfig'
Plug 'simrat39/symbols-outline.nvim'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'cohama/lexima.vim'

" Cosmetic
Plug 'itchyny/lightline.vim'
Plug 'karb94/neoscroll.nvim'
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'morhetz/gruvbox'

" Git
Plug 'tpope/vim-fugitive'

" Utilities
Plug 'glapa-grossklag/vim-md-md'
Plug 'godlygeek/tabular'
Plug 'jamessan/vim-gnupg'
Plug 'ludovicchabant/vim-gutentags'
Plug 'matze/vim-move'
Plug 'plasticboy/vim-markdown'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-eunuch'

" Telescope
Plug 'nvim-telescope/telescope.nvim'

" Generic
Plug 'nvim-lua/plenary.nvim'
Plug 'tpope/vim-repeat'

call plug#end()

lua << EOF
    require('neoscroll').setup()
EOF
