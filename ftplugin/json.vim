" ######################################################################
" basic settings

" SET INDENT
"
" the indent level 4 spaces is too large. When meet nested structure it make
" code hard to read
"
setlocal shiftwidth=2
setlocal softtabstop=2

" DISABLE CONCEAL STRING
"
" disable auto conceal string in json file
let g:vim_json_conceal = 0 " disable for vim-built in
