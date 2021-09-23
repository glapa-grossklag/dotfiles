function! References(...)
    let filename = a:0 >= 1 ? a:1 : expand('%:t')
    " \C -- force case sensitivity
    " \V -- disable magic mode
    " j  -- don't jump
    exec 'vimgrep' '/\C\V' . filename . '/j' "./**/*"
endfunction
command! References call References()

function! RemoveTrailingWhitespace()
    let l:pos = getpos('.')
    %s/\s\+$//e
    call setpos('.', l:pos)
endfunction

" function! BreakLine(char)
"     " let comment = split(&commentstring, '%s') " if len(comment) == 1
"     "      call add(comment, '')
"     " endif
"     let comment = split(&commentstring, '%s')
"     let left = comment[0]
"     let right = len(comment) > 1 ? comment[1] : ''
"     let count = &tw - len(left) - len(right)
"     let line = repeat(a:char, count)
"     return left . line . right
" endfunction
" command BreakLine normal i<C-R>=BreakLine('-')<C-M>

" Parameters:
"     root -- the root directory from which to search
function! Backlinks(root)
    let current_filename = expand('%:p')
    let locations = []
    let files = split(globpath(a:root, '**/*'), '\n')

    for source_file in files

        for line in readfile(source_file)
            " let lnum += 1

            let link_count = 1
            while 1
                let col = match(line, rx_link, 0, link_count)+1
                let link_text = matchstr(line, rx_link, 0, link_count)
                if link_text ==? ''
                    break
                endif
                let link_count += 1
                let target = vimwiki#base#resolve_link(link_text, a:wikifile)
                if target.filename !=? '' && target.scheme =~# '\mwiki\d\+\|diary\|file\|local'
                    call add(links, [target.filename, target.anchor, lnum, col])
                endif
            endwhile
        endfor


        let links = s:get_links(source_file, idx)
        for [target_file, _, lnum, col] in links
            " don't include links from the current file to itself
            if vimwiki#path#is_equal(target_file, current_filename) &&
                        \ !vimwiki#path#is_equal(target_file, source_file)
                call add(locations, {'filename':source_file, 'lnum':lnum, 'col':col})
            endif
        endfor
    endfor

    if empty(locations)
        echomsg 'Vimwiki: No other file links to this file'
    else
        call setloclist(0, locations, 'r')
        lopen
    endif
endfunction

" Replace the contents of the current buffer with the contents of `file`. Does
" **not** write to disk.
function! ReplaceBufferWith(file)
    %delete
    call append(0, readfile(a:file))
    $delete
    0
endfunction

function! ReplaceBufferWithTemplate(name)
    let name = a:name != '' ? a:name : 'template'
    const dir = stdpath('config') . '/templates'
    let template = dir . '/' . name . '.' . expand('%:e')

    if filereadable(template)
        call ReplaceBufferWith(template)
    endif
endfunction
command! -nargs=? Template call ReplaceBufferWithTemplate(<q-args>)
autocmd BufNewFile * Template
