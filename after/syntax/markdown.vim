" from
" /opt/homebrew/Cellar/neovim/0.7.2_1/share/nvim/runtime/syntax/markdown.vim
" here \@ is '环视' sytex
" syn region markdownH1 matchgroup=markdownH1Delimiter start="##\@!"      end="#*\s*$" keepend oneline contains=@markdownInline,markdownAutomaticLink contained
" syn region markdownH2 matchgroup=markdownH2Delimiter start="###\@!"     end="#*\s*$" keepend oneline contains=@markdownInline,markdownAutomaticLink contained
" syn region markdownH3 matchgroup=markdownH3Delimiter start="####\@!"    end="#*\s*$" keepend oneline contains=@markdownInline,markdownAutomaticLink contained
" syn region markdownH4 matchgroup=markdownH4Delimiter start="#####\@!"   end="#*\s*$" keepend oneline contains=@markdownInline,markdownAutomaticLink contained
" syn region markdownH5 matchgroup=markdownH5Delimiter start="######\@!"  end="#*\s*$" keepend oneline contains=@markdownInline,markdownAutomaticLink contained
" syn region markdownH6 matchgroup=markdownH6Delimiter start="#######\@!" end="#*\s*$" keepend oneline contains=@markdownInline,markdownAutomaticLink contained
"
" from vim-markdown/syntax/markdown.vim
"HTML headings
" syn region htmlH1       matchgroup=mkdHeading     start="^\s*#"                   end="$" contains=mkdLink,mkdInlineURL,@Spell
" syn region htmlH2       matchgroup=mkdHeading     start="^\s*##"                  end="$" contains=mkdLink,mkdInlineURL,@Spell
" syn region htmlH3       matchgroup=mkdHeading     start="^\s*###"                 end="$" contains=mkdLink,mkdInlineURL,@Spell
" syn region htmlH4       matchgroup=mkdHeading     start="^\s*####"                end="$" contains=mkdLink,mkdInlineURL,@Spell
" syn region htmlH5       matchgroup=mkdHeading     start="^\s*#####"               end="$" contains=mkdLink,mkdInlineURL,@Spell
" syn region htmlH6       matchgroup=mkdHeading     start="^\s*######"              end="$" contains=mkdLink,mkdInlineURL,@Spell
" syn match  htmlH1       /^.\+\n=\+$/ contains=mkdLink,mkdInlineURL,@Spell
" syn match  htmlH2       /^.\+\n-\+$/ contains=mkdLink,mkdInlineURL,@Spell

" test
" syn region markdownH1 matchgroup=markdownH2Delimiter start="###\@!"     end="#*\s*$" keepend oneline contains=@markdownInline,markdownAutomaticLink contained


" syn region htmlH1       matchgroup=mkdHeading     start="^#"                   end="$" contains=mkdLink,mkdInlineURL,@Spell
" syn region htmlH1       matchgroup=mkdHeading     start="^\s*##"                  end="$" contains=mkdLink,mkdInlineURL,@Spell


" hopeful set
" syn region markdownH1 matchgroup=markdownH1Delimiter start="#\s#\@!"      end="#*\s*$" keepend oneline contains=@markdownInline,markdownAutomaticLink contained
" syn match  htmlH1       /^$/ contains=mkdLink,mkdInlineURL,@Spell
"

" remove highlight see https://stackoverflow.com/questions/16737192/vim-remove-highlight-not-search-highlight
" hi clear htmlH1
" hi clear markdownH1

" ######################################################################
" Head
highlight htmlH1 guifg=#CF00F0 gui=bold
highlight htmlH2 guifg=#002BFF gui=bold
highlight htmlH3 guifg=#00A2FF gui=bold
highlight htmlH4 guifg=#FF8700 gui=bold
highlight htmlH5 guifg=#FE728B gui=bold
highlight htmlH6 guifg=#FF6AD2 gui=bold

" Font
" syn match mkdItalicPar "test"
" syn match mkdItalicPar /(.*)/
" syn region mkdTest start="(\*"  end="\*)"
" syn match mkdTest "test"
" highlight mkdTest gui=italic guifg=#ff82b2

syntax region Underline start="<u>" end="</u>"
highlight Underline gui=underline

" color #ff82b2 is from `Things` theme of Obsidian
highlight htmlBold gui=bold guifg=#ff82b2
highlight htmlItalic gui=italic guifg=#ff82b2


" ######################################################################
" LaTeX formula, copy from `./tex/tex.vim`
"
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
    hi def link texGreek texType

" super script and subscripts
    " hi texSuperscript guifg=#FF00FF
    " hi texSubscript guifg=#FF00FF
    " hi texGreek guifg=#FF00FF

" ======================================================================
" math superscripts & subscripts (copy from default syntax fail only delete `concealends`)
syn cluster texMathZoneGroup		add=userSuperscript,userSubscript
syn cluster texMathMatchGroup		add=userSuperscript,userSubscript
syn region userSuperscript	matchgroup=Delimiter start='\^{'	skip="\\\\\|\\[{}]" end='}'	contained contains=texSpecialChar,texSuperscripts,texStatement,texSubscript,texSuperscript,texMathMatcher
syn region userSubscript	matchgroup=Delimiter start='_{'		skip="\\\\\|\\[{}]" end='}'	contained contains=texSpecialChar,texSubscripts,texStatement,texSubscript,texSuperscript,texMathMatcher
" hi userSuperscript guifg=#FF00FF
hi def link userSuperscript texSpecialChar
hi def link userSubscript userSuperscript

" enable highlight wiki link
syntax match mkdLink "\[\[.*\]\]"

" ######################################################################
" in testing
syn clear htmlH1
syn region htmlH1 matchgroup=markdownH1Delimiter start="#\s#\@!"      end="#*\s*$" keepend oneline contains=@markdownInline,markdownAutomaticLink contained
"
" syn region markdowntag start="##\@!"      end="#*\s*$"
" syn match markdowntag /#[^# ][a-z\/A-Z_\-]\+/ contains=mkdLink,mkdInlineURL,@Spell
" syn region mdtag start="##\@!"      end="#*\s*$"
" highlight mdtag guifg=#EEEEEE guibg=#87A8B7 gui=bold

