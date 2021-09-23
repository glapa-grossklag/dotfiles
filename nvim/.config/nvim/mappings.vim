let mapleader = " "

" -------------------------------------------------------------------------------
" Quality of Life
" -------------------------------------------------------------------------------

inoremap jj <Esc>
nnoremap <leader><leader> zA

" Keep visual mode after indent
vnoremap > >gv
vnoremap < <gv

nnoremap <Enter> gf
nnoremap <Tab>   <C-^>


" -------------------------------------------------------------------------------
" Major
" -------------------------------------------------------------------------------

" LSP
" -- See `:help vim.lsp.*` for documentation on any of the below functions
" buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
" buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
" buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
" buf_set_keymap('n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
" buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
" buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
" buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
nnoremap K <cmd>lua vim.lsp.buf.hover()<cr>
nnoremap gd <cmd>lua vim.lsp.buf.definition()<cr>
nnoremap gr <cmd>lua vim.lsp.buf.references()<cr>
nnoremap rn <cmd>lua vim.lsp.buf.rename()<cr>
nnoremap <leader>ca <cmd>lua vim.lsp.buf.rename()<cr>

" Open
nnoremap <leader>of <cmd>Telescope find_files hidden=true<cr>
nnoremap <leader>oF <cmd>Telescope oldfiles hidden=true<cr>
nnoremap <leader>og <cmd>Telescope live_grep hidden=true<cr>
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
nnoremap <leader>gl <cmd>Git log<cr>
nnoremap <leader>gb <cmd>Telescope git_branches<cr>

" Fix
nnoremap <leader>fs <cmd>Telescope spell_suggest<cr>
nnoremap <leader>ff <cmd>Neoformat<cr>

" Misc.
tnoremap <Esc> <C-\><C-n>
inoremap <silent><M-t> <C-r><C-o>= strftime('%H:%M')<cr>

" autocmd FileType markdown map <buffer> <Enter> <Plug>MDCheckboxToggle
autocmd FileType markdown map <buffer> <Tab>   <Plug>MDNextLink
autocmd FileType markdown map <buffer> <S-Tab> <Plug>MDPrevLink
