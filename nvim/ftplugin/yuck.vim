
if exists("b:did_ftplugin")
  finish
endif

let b:did_ftplugin = 1

let s:cpo_save = &cpo
set cpo&vim

setlocal expandtab
setlocal shiftwidth=2

setlocal commentstring=;\ %s

let b:undo_ftplugin = 'setl et< ts< sts< sw< com< cms<'

let &cpo = s:cpo_save
unlet! s:cpo_save
