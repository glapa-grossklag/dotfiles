setlocal textwidth=79  " Wrap at col. 79

" Convert file to PDF using pandoc
noremap <leader>r :execute "!pandoc --highlight-style=tango -o " . expand("%:p:r") . ".pdf " . "%:p"<CR>"

" View PDF using mupdf
map <leader>R :silent execute "!mupdf " . expand("%:p:r") . ".pdf &" <CR>

" Make link
command! -range Link '<,'>s/\%V.*/[&]()

" Checkboxes
command! -range Check '<,'>s/\([*-+]\)\ \[\ \]/\1\ \[X\]/g
command! -range Uncheck '<,'>s/\([*-+]\)\ \[[xX]\]/\1\ \[\ \]/g

" Todo
command! Todo grep -E "[*-+] \[ \]" -r *.md

" Use HTML comments
setlocal commentstring=<!--\ %s\ -->

" Concealing
set conceallevel=2
