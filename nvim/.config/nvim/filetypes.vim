" *
function s:RemoveTrailingWhitespace()
    let l:pos = getpos('.')
    %s/\s\+$//e
    call setpos('.', l:pos)
endfunction
autocmd BufWritePre * call <SID>RemoveTrailingWhitespace()

" C
autocmd FileType c setlocal commentstring=//\ %s

" Make
autocmd FileType make setlocal noexpandtab " Makefiles must use tabs, not spaces

" Markdown
autocmd BufNewFile,BufRead *.md set filetype=markdown
setlocal spell
setlocal conceallevel=2
