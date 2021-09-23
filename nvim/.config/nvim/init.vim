" -----------------------------------------------------------------------------
" o          o           o
"     _  _     _|_           _  _  _
" |  / |/ |  |  |   |  |_|  / |/ |/ |
" |_/  |  |_/|_/|_/o \/  |_/  |  |  |_/
" -----------------------------------------------------------------------------

if !has('nvim-0.5.0')
    echoerr 'Missing: nvim-0.5.0'
endif

function Source(filename)
    exec 'source' stdpath('config') . '/' . a:filename
endfunction

call Source('lib.vim')
call Source('plugins.vim')
call Source('filetypes.vim')
call Source('settings.vim')
call Source('lsp.lua')
call Source('mappings.vim')
" call s:Source('startup.vim')

" If we open without any file in mind and there's a session available, let's load it.
if !(argc() || line2byte('$') != -1 || v:progname !~? '^[-gmnq]\=vim\=x\=\%[\.exe]$' || &insertmode)
    if filereadable('Session.vim')
        source Session.vim
    endif
endif
