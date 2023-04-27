" syn cluster	reduceCommentGroup contains=@Spell
" syn match reduceComment "%.*$" contains=@Spell
" syn match reduceComment "%.*$" contains=@reduceCommentGroup
syn match reduceComment "%.*$"
hi def link myComment Comment
hi def link reduceComment myComment
