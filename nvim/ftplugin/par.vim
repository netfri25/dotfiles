if exists('b:did_ftplugin')
  finish
endif

let b:did_ftplugin = 1

let s:cpo_save = &cpo
set cpo&vim

" Indentation: 2 spaces, no tabs
setlocal expandtab
setlocal tabstop=2
setlocal softtabstop=2
setlocal shiftwidth=2

" Comments
setlocal comments=s1:/*,mb:*,ex:*/,://
setlocal commentstring=//\ %s

let b:undo_ftplugin = 'setl et< ts< sts< sw< com< cms<'

let &cpo = s:cpo_save
unlet! s:cpo_save
