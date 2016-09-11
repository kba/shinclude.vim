" Maintainer:  Konstantin Baierer <konstantin.baierrer@gmail.com>
" URL:         http://github.com/kba/shinclude.vim
" License:     MIT

if exists("g:loaded_shinclude") || &cp || v:version < 700
  finish
endif
let g:loaded_shinclude = 1

command! Shinclude call shinclude#run()
