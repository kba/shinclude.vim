" Maintainer:  Konstantin Baierer <konstantin.baierrer@gmail.com>
" URL:         http://github.com/kba/shinclude.vim
" License:     MIT

function! s:run(inline, comment_style)
    let cmd = join([
        \ 'SHLOG_TERM_COLORIZE=false',
        \ 'SHLOG_TERM=info',
        \ 'shinclude',
        \ a:inline,
        \ '-c', a:comment_style,
        \ expand('%')], ' ')
    echo cmd
    verbose exe "normal \:!" . cmd . "\<cr>"
    redraw!
endfunction

function! shinclude#run()
    if &modified
        echo "Please save first"
        return
    endif
    if &filetype == 'markdown'
        call s:run('-i', 'xml')
    elseif &filetype == 'vim'
        call s:run('-i', 'vim')
    else
        echo "Unsupported filetype '" . &filetype . "'"
    endif
endfunction
