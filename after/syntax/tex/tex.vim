" default
  " hi def link texSection	PreCondit

  " hi def link texStatement	Statement

  " hi def link texMath		Special
  " hi def link texMathDelim	Statement
  " hi def link texMathOper	Operator

  " hi def link texSection	PreCondit

  " hi def link texSpaceCodeChar	Special
  " hi def link texSpecialChar	SpecialChar

  " hi def link texZone String

  " hi def link texType		Type
  " hi def link texTypeStyle	texType

" custom
" all the normal text in the math context, such as: a, b, c
    hi texMath guifg = #27839E
" such as '\left( \right)'
    hi texMathDelim guifg=#0000ff
" such as +, -, *, ^, _
    " hi texMathOper guifg=#CF00F0
" such as symbol '&' etc.
    hi texDelimiter guifg=#0000FF
" section, list etc.
    " hi link texSection Keyword
" LaTeX 符号 (若链接已存在, 只能用 `link` 而不能用 `def link`)
    hi link texStatement Keyword
" 影响代码段高亮
    hi link texZone String
" 数学字体等
    hi texType guifg=#00A2FF
" 大致可以理解为转义字符 (如 `\\`, `\_`,  等)
    hi texSpecialChar guifg=#FF00FF
" content inside 'matcher' such as `{}`
    " hi texMathMatcher	guifg=#FF00FF

" super script and subscripts
    " hi texSuperscript guifg=#FF00FF
    " hi texSubscript guifg=#FF00FF
    " hi texGreek guifg=#FF00FF

" ######################################################################
" AMS-Math math env
call TexNewMathZone("E","align",1)
call TexNewMathZone("F","alignat",1)
call TexNewMathZone("G","equation",1)
call TexNewMathZone("H","flalign",1)
call TexNewMathZone("I","gather",1)
call TexNewMathZone("J","multline",1)
call TexNewMathZone("K","xalignat",1)
call TexNewMathZone("L","xxalignat",0)


" ######################################################################
" math superscripts & subscripts (copy from default syntax fail only delete `concealends`)
syn cluster texMathZoneGroup		add=userSuperscript,userSubscript
syn cluster texMathMatchGroup		add=userSuperscript,userSubscript
syn region userSuperscript	matchgroup=Delimiter start='\^{'	skip="\\\\\|\\[{}]" end='}'	contained contains=texSpecialChar,texSuperscripts,texStatement,texSubscript,texSuperscript,texMathMatcher
syn region userSubscript	matchgroup=Delimiter start='_{'		skip="\\\\\|\\[{}]" end='}'	contained contains=texSpecialChar,texSubscripts,texStatement,texSubscript,texSuperscript,texMathMatcher
" hi userSuperscript guifg=#FF00FF
hi def link userSuperscript texSpecialChar
hi def link userSubscript userSuperscript

" ######################################################################
" highlight user-defined command
syn region texRefZone		matchgroup=texStatement start="\\v\=sref{"		end="}\|%stopzone\>"	contains=@texRefGroup

" inspired by vimtex/autoload/vimtex/syntax/p/listings.vim
" where `\[]` is used to match command with option like \lstinline[basicstyle=\ttfamily]{test}
syntax match texZone "\\lstinline\s*\(\[.*\]\)\={.\{-}}"

" syntax match texZone "\\[Cc]ode\s*\(\[.*\]\)\={.\{-}}"
" advenced version. syntex `\\\@<![{\\]` ('逆序否定环视') can match inverse-brace without backslash
" i.e., match } but not match \}
syntax match texZone "\\[Cc]ode\s*\(\[.*\]\)\={.\{-}\\\@<!}"

" ======================================================================
" hyperref (copied from vimtex's hyperref.vim)

syntax match texStatement '\\url\ze[^\ta-zA-Z]' nextgroup=texUrlVerb
syntax region texUrlVerb matchgroup=Delimiter
    \ start='\z([^\ta-zA-Z]\)' end='\z1' contained

syntax match texStatement '\\url\ze\s*{' nextgroup=texUrl
syntax region texUrl     matchgroup=Delimiter start='{' end='}' contained

syntax match texStatement '\\href' nextgroup=texHref
syntax region texHref matchgroup=Delimiter start='{' end='}' contained
    \ nextgroup=texMatcher

syntax match texStatement '\\hyperref' nextgroup=texHyperref
syntax region texHyperref matchgroup=Delimiter start='\[' end='\]' contained

highlight link texUrl          Function
highlight link texUrlVerb      texUrl
highlight link texHref         texUrl
highlight link texHyperref     texRefZone


