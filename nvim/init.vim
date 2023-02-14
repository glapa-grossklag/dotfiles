" Plugins {{{

let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
	silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
	autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()

" Misc.
Plug 'tpope/vim-sensible'
Plug 'nvim-lua/plenary.nvim'
Plug 'tpope/vim-repeat'

" Cosmetic
Plug 'catppuccin/nvim', { 'as': 'catppuccin' }
Plug 'nvim-lualine/lualine.nvim'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'rebelot/kanagawa.nvim'

" Utilities
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-unimpaired'
Plug 'echasnovski/mini.completion'

call plug#end()

lua require("indent_blankline").setup()
lua require("mini.completion").setup()

" }}}

" Settings {{{

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
set textwidth=0
set nowrap
set linebreak
set tabstop=4
set shiftwidth=4
set softtabstop=4
set noexpandtab
set smartindent
set relativenumber
set number
set cursorline
set conceallevel=0
set background=dark
set laststatus=2
set signcolumn=yes
set wrap

colorscheme kanagawa

lua << EOF
	local function get_word_count()
		return tostring(vim.fn.wordcount().words) .. ' words'
	end


	require('lualine').setup {
		options = {
			icons_enabled = false,
			component_separators = '|',
			section_separators = ''
		},
		sections = {
			lualine_a = {'mode'},
			lualine_b = {'branch', 'diff', 'diagnostics'},
			lualine_c = {'filename'},
			lualine_x = {'filetype', get_word_count, 'filesize'},
			lualine_y = {'progress'},
			lualine_z = {'location'}
		},
	}
EOF

" Use full-line comments in C
autocmd FileType c setlocal commentstring=//\ %s

" Makefiles must use tabs, not spaces
autocmd FileType make setlocal noexpandtab

" Enable spell-check in Markdown files
autocmd FileType markdown setlocal spell

" }}}

" Mappings {{{

let mapleader = " "

inoremap jj <Esc>

nnoremap <silent> <leader><leader> za
nnoremap <silent> <leader>p <cmd>Files<cr>
nnoremap <silent> <leader>f <cmd>Rg<cr>
nnoremap <silent> <leader>g <cmd>Git<cr>
nnoremap <silent> <leader>n <cmd>tabnew<cr>
nnoremap <leader>r :%s/\<<c-r><c-w>\>/<c-r><c-w>/gc<left><left><left>

noremap <silent> <leader>t :split +terminal<CR><C-w>:resize 15%<CR>
noremap <silent> <leader>T :vsplit +terminal<CR>
tnoremap <Esc> <C-\><C-n>

" }}}

" Commands {{{

command! Settings edit $MYVIMRC

" }}}

" Abbreviations {{{

iabbrev :time: <C-r><C-o>= strftime('%H:%M')<cr>
iabbrev :date: <C-r><C-o>= strftime('%F')<cr>

" }}}

" vim: foldmethod=marker
