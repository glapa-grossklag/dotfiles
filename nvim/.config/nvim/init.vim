" ---------------------------------------------------------------------------- "
" o          o           o                                                     "
"     _  _     _|_           _  _  _                                           "
" |  / |/ |  |  |   |  |_|  / |/ |/ |                                          "
" |_/  |  |_/|_/|_/o \/  |_/  |  |  |_/                                        "
" ---------------------------------------------------------------------------- "

if !has('nvim')
    echoerr 'This is for Neovim!'
endif

" ---------------------------------------------------------------------------- "
"                                  Plugins                                     "
" ---------------------------------------------------------------------------- "

" Install vim-plug if it's missing.
let data_dir = stdpath('data') . '/site'
if empty(glob(data_dir . '/autoload/plug.vim'))
    silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin(stdpath('data') . '/vim-plug')

" LSP
Plug 'neovim/nvim-lspconfig'
Plug 'simrat39/symbols-outline.nvim'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'

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

" ---------------------------------------------------------------------------- "
"                                   Options                                    "
" ---------------------------------------------------------------------------- "

set nocompatible
filetype plugin on
syntax on
set mouse=a
set lazyredraw
set showmatch
set scrolloff=5
set autoread
set undofile
set undodir=~/.config/nvim/undodir
set hidden
set encoding=utf-8
set clipboard+=unnamedplus
set noswapfile
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
set incsearch
set nohlsearch
set ignorecase
set smartcase
set shortmess+=c
set relativenumber
set number
set cursorline
set conceallevel=0
set noshowmode
set laststatus=2
set signcolumn=yes
set foldmethod=indent
set fillchars=fold:\ ,vert:\|

" ---------------------------------------------------------------------------- "
"                           Language Server Protocol                           "
" ---------------------------------------------------------------------------- "

" Use Neovim's LSP and enable the following language servers:

lua << EOF
    nvim_lsp = require('lspconfig')
    nvim_lsp.pyright.setup{}
    nvim_lsp.clangd.setup{}
EOF

" Enable autocomplete.

lua << EOF
    local cmp = require('cmp')
    cmp.setup {
        mapping = {
            ['<C-p>'] = cmp.mapping.select_prev_item(),
            ['<C-n>'] = cmp.mapping.select_next_item(),
            ['<C-d>'] = cmp.mapping.scroll_docs(-4),
            ['<C-f>'] = cmp.mapping.scroll_docs(4),
            ['<C-Space>'] = cmp.mapping.complete(),
            ['<C-e>'] = cmp.mapping.close(),
            ['<CR>'] = cmp.mapping.confirm({
                behavior = cmp.ConfirmBehavior.Insert,
                select = true,
            }),
            ['<Tab>'] = function(fallback)
                if vim.fn.pumvisible() == 1 then
                  vim.fn.feedkeys(vim.api.nvim_replace_termcodes('<C-n>', true, true, true), 'n')
                else
                  fallback()
                end
            end
        },

        sources = {
            { name = 'nvim_lsp' },
            { name = 'buffer' },
            { name = 'path' }
        },
    }
EOF

" ---------------------------------------------------------------------------- "
"                                  Cosmetic                                    "
" ---------------------------------------------------------------------------- "

if has('termguicolors')
    set termguicolors
endif

" Colorscheme
let g:gruvbox_sign_column="bg0"
let g:gruvbox_italic=1
let g:gruvbox_invert_selection=0
let g:gruvbox_improved_warnings=1
let g:gruvbox_guisp_fallback='fg'
set background=dark
colorscheme gruvbox

let g:lightline = { 'colorscheme': 'gruvbox' }

" ---------------------------------------------------------------------------- "
"                           Plugin-Specific Options                            "
" ---------------------------------------------------------------------------- "

let g:vim_markdown_new_list_item_indent = 0

let g:GPGDefaultRecipients=["Miles Glapa-Grossklag"]

" ---------------------------------------------------------------------------- "
"                                   Mappings                                   "
" ---------------------------------------------------------------------------- "

let mapleader = " "

" Exit insert mode.
inoremap jj <Esc>

" Toggle folds.
nnoremap <leader><leader> zA

" LSP
" -- See `:help vim.lsp.*` for documentation on any of the below functions
" buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
" buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
" buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
" buf_set_keymap('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
" buf_set_keymap('n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
" buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
" buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
" buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
nnoremap K <cmd>lua vim.lsp.buf.hover()<cr>
nnoremap gd <cmd>lua vim.lsp.buf.definition()<cr>
nnoremap gr <cmd>lua vim.lsp.buf.references()<cr>
nnoremap rn <cmd>lua vim.lsp.buf.rename()<cr>

" Open
nnoremap <leader>of <cmd>Telescope find_files<cr>
nnoremap <leader>og <cmd>Telescope live_grep<cr>
nnoremap <leader>ob <cmd>Telescope buffers<cr>
nnoremap <leader>oh <cmd>Telescope help_tags<cr>
nnoremap <leader>om <cmd>Telescope man_pages sections={"ALL"}<cr>
nnoremap <leader>oe <cmd>Telescope file_browser dir_icon=><cr>
nnoremap <leader>ot <cmd>split +terminal<cr><C-w>:resize 15%<cr>
nnoremap <leader>oT <cmd>Telescope tags<cr>
nnoremap <leader>oo <cmd>SymbolsOutlineOpen<cr>
nnoremap <leader>os <cmd>edit $MYVIMRC<cr>
nnoremap <leader>on <cmd>tabnew<cr>

" Git
nnoremap <leader>gg <cmd>Git<cr>
nnoremap <leader>gs <cmd>Git status<cr>
nnoremap <leader>gb <cmd>Telescope git_branches<cr>

" Fix
nnoremap <leader>fs <cmd>Telescope spell_suggest<cr>
nnoremap <leader>ff <cmd>lua vim.lsp.buf.formatting()<cr>

" Misc.
tnoremap <Esc> <C-\><C-n>

" ---------------------------------------------------------------------------- "
"                                   Commands                                   "
" ---------------------------------------------------------------------------- "

command WhereIsThis echo expand('%:p:h')

" Remove trailing whitespace, without moving the cursor.
function s:RemoveTrailingWhitespace()
    let l:pos = getpos('.')
    %s/\s\+$//e
    call setpos('.', l:pos)
endfunction
autocmd BufWritePre * call <SID>RemoveTrailingWhitespace()
