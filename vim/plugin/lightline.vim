"""
" Configuration for the lightline plugin
"""

let g:lightline = {
    \ 'colorscheme': 'gruvbox',
    \ 'active': {
    \   'left': [ [ 'mode', 'paste' ],
    \             [ 'coc_info', 'coc_hints', 'coc_errors', 'coc_warnings', 'coc_ok' ],
    \             [ 'coc_status' ],
    \             [ 'readonly', 'filename', 'modified' ]]
    \ }
\ }

call lightline#coc#register()
