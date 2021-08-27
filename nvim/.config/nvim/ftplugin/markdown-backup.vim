" Concealing
setlocal conceallevel=2

" Find next/previous link
command -buffer NextLink norm /\[.*\]\(.*\)<CR>
command -buffer PrevLink norm ?\[.*\]\(.*\)<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                  Checkboxes                                  "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let s:checkbox_empty = '\v^\s*[-*+]\ \[\ \]'
let s:checkbox_full = '\v^\s*[-*+]\ \[[xX]\]'

command -buffer Check s/\v^(\s*[-*+])\ \[\ \]/\1\ \[X\]/
command -buffer Uncheck s/\v^(\s*[-*+])\ \[[xX]\]/\1\ \[\ \]/
command -buffer MakeCheck s/\v^(\s*[-*+])\ /\1\ \[\ \]\ /

" Toggle a markdown checkbox on the current line.
function! s:CheckToggle()
    let l:pos = getpos('.')
    let l:line = getline('.')
    
    if l:line =~ s:checkbox_empty
        Check
    elseif l:line =~ s:checkbox_full
        Uncheck
    endif

    call setpos('.', l:pos)
endfunction
command -buffer CheckToggle call s:CheckToggle()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                   Mappings                                   "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

noremap <silent> <buffer> <Enter> :CheckToggle<CR>
noremap <silent> <buffer> <Tab> :NextLink<CR>
noremap <silent> <buffer> <S-Tab> :PrevLink<CR>
