" Vim syntax file
" Language:		Nunchaku
" Filename extensions:	*.nun
" Maintainer:		Simon Cruanes (heavily inspired from progress.vim file)
" For version 5.x: Clear all syntax items
" For version 6.x: Quit when a syntax file was already loaded
if version < 600
	syntax clear
"elseif exists("b:current_syntax")
"	finish
endif

if version >= 600
  setlocal iskeyword=@,48-57,_,-,!,#,$,%
else
  set iskeyword=@,48-57,_,-,!,#,$,%
endif

" tabs = evil
set expandtab

syn case match

syn keyword     nunRole        val axiom goal spec rec

syn match       nunBuiltin     "\<type\>"
syn match       nunBuiltin     "\<prop\>"
syn match       nunBuiltin     "\<true\>"
syn match       nunBuiltin     "\<false\>"
syn match       nunBuiltin     "\<pi\>"

syn match       nunConnective  "\."
syn match       nunConnective  ":"
syn match       nunConnective  ":="
syn match       nunConnective  "->"
syn match       nunConnective  "=>"
syn match       nunConnective  "<=>"
syn match       nunConnective  "fun"
syn match       nunConnective  "let"
syn match       nunConnective  "&"
syn match       nunConnective  "|"
syn match       nunConnective  "\~"
syn match       nunConnective  "!"
syn match       nunConnective  "?"

syn match       nunVar         "\<\u\w*\>"

" delimiters

syn region      nunParen       matchgroup=nunDelim start="("  end=")" contains=ALLBUT,nunParenError keepend contained

syn keyword	nunTodo	contained TODO BUG FIX FIXME NOTE

syn match       nunComment     +#.*+ contains=nunTodo

" Define the default highlighting.
" For version 5.7 and earlier: only when not done already
" For version 5.8 and later: only when an item doesn't have highlighting yet
if version >= 508 || !exists("did_nun_syntax_inits")
  if version < 508
    let did_nun_syntax_inits = 1
    command -nargs=+ HiLink hi link <args>
  else
    command -nargs=+ HiLink hi def link <args>
  endif

  HiLink nunTodo               Todo

  HiLink nunComment		Comment
  HiLink nunComment		Comment

  HiLink nunRole               Keyword
  HiLink nunLogic              Keyword
  HiLink nunConnective         Keyword
  HiLink nunDelim              Delimiter

  HiLink nunBuiltin            Special

  HiLink nunDollar             String
  HiLink nunDollarDollar       String
  HiLink nunQuote              String
  HiLink nunDoubleQuote        String

  HiLink nunVar                Constant

  HiLink nunNum                Number

  HiLink nunBraceError         Error
  HiLink nunParenError         Error

  delcommand HiLink
end

let b:current_syntax = "nun"

" vim: ts=8 sw=8
