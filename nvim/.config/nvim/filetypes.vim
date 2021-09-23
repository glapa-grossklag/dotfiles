call Source('lib.vim')

" *
autocmd BufWritePre * call RemoveTrailingWhitespace()

" C
autocmd FileType c setlocal commentstring=//\ %s

" Make
autocmd FileType make setlocal noexpandtab " Makefiles must use tabs, not spaces

" Markdown
autocmd BufNewFile,BufRead *.md set filetype=markdown
autocmd FileType markdown setlocal spell
autocmd FileType markdown setlocal conceallevel=2
