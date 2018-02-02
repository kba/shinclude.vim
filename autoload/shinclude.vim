" Maintainer:  Konstantin Baierer <konstantin.baierrer@gmail.com>
" URL:         http://github.com/kba/shinclude.vim
" License:     MIT

function! s:run(comment_style) abort
    let l:cmd = join(
        \ [
        \     'SHLOG_TERM_COLORIZE=false',
        \     'SHLOG_TERM=info',
        \     'shinclude',
        \     '-i',
        \     '-c',
        \     a:comment_style,
        \     expand('%'),
        \ ],
        \ ' ')
    call system(l:cmd)
    exe ':e!%'
endfunction

function! shinclude#run() abort
    if &modified
        echo 'Please save first'
        return
    endif
    if &filetype == 'markdown'
        call s:run('xml')
    elseif &filetype == 'vim'
        call s:run('vim')
    elseif &filetype == 'make'
        call s:run('pound')
    else
        echo "Unsupported filetype '" . &filetype . "'"
    endif
endfunction
