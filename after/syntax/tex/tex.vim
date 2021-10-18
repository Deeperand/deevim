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
