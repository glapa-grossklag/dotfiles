let s:penguins =<< trim EOF
           (o_
 (o_  (o_  //\
 (/)_ (/)_ V_/_
━━━━━━━━━━━━━━━━
EOF

function! Startup(contents)
    " Don't run if:
    " - there were any command-line arguments;
    " - the buffer isn't empty;
    " - vim wasn't invoked as a standalone-editor;
    " - we're in insert mode.
    if argc() || line2byte('$') != -1 || v:progname !~? '^[-gmnq]\=vim\=x\=\%[\.exe]$' || &insertmode
        return
    endif

    " Prepare the buffer.
    enew
    setlocal
        \ bufhidden=wipe
        \ buftype=nofile
        \ nobuflisted
        \ nocursorcolumn
        \ nocursorline
        \ nolist
        \ nonumber
        \ norelativenumber
        \ noswapfile
        \ foldnestmax=0

    for line in a:contents
        call append('$', l:line)
    endfor

    " Center everything.
    exec "setlocal textwidth=" . winwidth(0)
    g/.*/center
    0

    " No modifications to this buffer
    setlocal nomodifiable nomodified

    " When we go to insert mode start a new buffer, and start insert
    nnoremap <buffer><silent> i :enew <bar> startinsert<CR>
endfunction

" TODO:
" Move `box.py` to Vimscript
let s:contents = ["", "", ""] + s:penguins + split(system('fortune -s'), '\n')
autocmd VimEnter * call Startup(s:contents)
