" -----------------------------------------------------------------------------
" o          o           o
"     _  _     _|_           _  _  _
" |  / |/ |  |  |   |  |_|  / |/ |/ |
" |_/  |  |_/|_/|_/o \/  |_/  |  |  |_/
" -----------------------------------------------------------------------------

if !has('nvim')
    echoerr 'This is for Neovim!'
endif

function s:Source(filename)
    exec 'source' stdpath('config') . '/' . a:filename
endfunction

call s:Source('plugins.vim')
call s:Source('filetypes.vim')
call s:Source('settings.vim')
call s:Source('lsp.lua')
call s:Source('mappings.vim')
call s:Source('startup.vim')
