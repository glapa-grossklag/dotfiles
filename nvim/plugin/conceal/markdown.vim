" ===
" Markdown
" ===

if !has('conceal')
    finish
endif

" Checkboxes
syntax match todoCheckbox "\[\ \]" conceal cchar=☐
syntax match todoCheckbox "\[[xX]\]" conceal cchar=☒

hi def link todoCheckbox Todo

setlocal cole=1
