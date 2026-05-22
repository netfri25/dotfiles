"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""" LANGUAGE:		LOLCODE
""""" AUTHOR:		ThÃ©ophile BASTIAN, Christine Dodrill
""""" LAST CHANGE:	2013 Nov 14
""""" LICENSE:		GNU GPLv3
""""" SYNTAX HIGHLIGHTING FOR VIM!!1

if exists("b:current_syntax")
	finish
endif

syn region LolMultiComment start=/OBTW/ end=/TLDR/
syn match LolLineComment 'BTW.*$'

" syn match LolKeyword "I IZ"
syn match LolKeyword "ITZ"
syn match LolKeyword "ITZ A"
syn match LolKeyword "ITZ LIEK A"
syn match LolKeyword "IS A"
syn match LolKeyword "IM LIEK"
syn match LolKeyword "CAN HAS"
syn keyword LolKeyword NOW
syn keyword LolKeyword A
syn keyword LolKeyword MAEK
syn keyword LolKeyword PLZ
syn keyword LolKeyword MKAY
syn match LolKeyword "WTF?"
syn match LolKeyword "O RLY?"
syn match LolKeyword "YA RLY"
syn match LolKeyword "NO WAI"
syn match LolKeyword "FOUND YR"
syn match LolKeyword "FOUND UR"
" syn match LolKeyword "HOW DUZ I"
syn match LolKeyword "HOW IZ"
syn match LolKeyword "IF U SAY SO"
syn match LolKeyword "AWSUM THX"
syn match LolKeyword "O NOES"
syn match LolKeyword "O HAI IM"
syn match LolKeyword "KTHX"
syn match LolKeyword "HAI"
syn match LolKeyword "KTHXBYE"
syn match LolKeyword "SKIP DIS"
syn match LolKeyword "HAS A"
syn keyword LolKeyword MEBBE
syn keyword LolKeyword OIC
syn keyword LolKeyword OMG
syn keyword LolKeyword OMGWTF
syn keyword LolKeyword GTFO
syn keyword LolKeyword TIL
syn keyword LolKeyword WILE
syn match LolKeyword "IM IN YR "
syn match LolKeyword "IM OUTTA YR "

syn match LolSpecChar ":)"
syn match LolSpecChar ":>"
syn match LolSpecChar ":\""
syn match LolSpecChar ":o"
syn match LolSpecChar "::"

syn region LolString start=+"+ end=+"+ contains=LolSpecChar

syn keyword LolType
			\ TROOF YARN NUMBR NUMBAR NOOB BUKKIT FUNKSHUN

syn keyword LolBool WIN FAIL

syn match LolNum '\<[0-9]\d*'
" syn match LolNum '[^A-Za-z_][+-]\?\d\+\.\d*'


syn keyword LolBaseFunc
			\ VISIBLE INVISIBLE GIMMEH

syn keyword LolSpecial
            \ I IT ME parent

syn match LolOperator "'Z"

syn keyword LolArith
			\ OF SUM DIFF PRODUKT QUOSHUNT MOD UPPIN NERFIN LOLG POWR SMOOSH BIGGR SMALLR BOTH EITHER WON NOT ALL ANY SAEM DIFFRINT

syn keyword LolComparator
			\ SRS IZ AN MKAY YR R

""" Defining highlighting ---
hi link LolMultiComment Comment
hi link LolLineComment  Comment
hi link LolOperator     Operator
hi link LolKeyword      Keyword
hi link LolSpecChar     SpecialChar
hi link LolBool         Boolean
hi link LolNum          Number
hi link LolString       String
hi link LolBaseFunc     Keyword
hi link LolBlock        Delimiter
hi link LolSpecial      Type
hi link LolOperator     Operator
hi link LolComparator   Special
hi link LolType         Type
hi link LolArith        Type

let b:current_syntax="lolcode"
