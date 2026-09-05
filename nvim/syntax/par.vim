if exists('b:current_syntax')
  finish
endif

syn keyword parKeyword
      \ begin box case catch chan choice
      \ dec def do dual either else export
      \ if import is in iterative let
      \ and as module neg or not
      \ loop poll repoll submit
      \ recursive self throw try default
      \ type unfounded external todo

syn match parOperator
      \ /->\|=>\|==\|!=\|<=\|>=\|+=\|-=\|\*=\|\/=\|[+\-*\/%=<>!?&|~^:;,.@{}()[\]]/

" regular strings
syn region parString
      \ start=/"/
      \ end=/"/
      \ skip=/\\./

" template strings
syn region parTemplateString
      \ start=/`/
      \ end=/`/
      \ skip=/\\./
      \ contains=parInterpolation

" string interpolation in template strings, ${...} and #{...}
syn region parInterpolation
      \ matchgroup=parInterpolationDelimiter
      \ start=/\${\|#{/
      \ end=/}/
      \ contained
      \ contains=parKeyword,parOperator,parString,parTemplateString,
      \          parNumber,parType,parInterpolation

" numbers
syn match parNumber /\v<\d+(\.\d*([eE][+-]?\d+)?)?/

" uppercase words
syn match parType
      \ /\<[A-Z][A-Za-z0-9_]*/


" line commments
syn match parComment
      \ /\/\/.*$/

" block comments
syn region parComment
      \ start=/\/\*/
      \ end=/\*\//
      \ contains=parComment
      \ keepend


highlight default link parKeyword @keyword
highlight default link parOperator @operator
highlight default link parString @string
highlight default link parTemplateString @string
highlight default link parInterpolationDelimiter @punctuation.special
highlight default link parNumber @number
highlight default link parType @type
highlight default link parComment @comment

let b:current_syn = 'par'
