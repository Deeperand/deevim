" ######################################################################
" basic settings

" SET COMMENT STRING
setlocal commentstring=//%s

" SET INDENT
"
" the indent level 4 spaces is too large. When meet nested structure it make
" code hard to read
"
setlocal shiftwidth=2
setlocal softtabstop=2

" CINKEYS SETTINGS
"
" Remove `0#` and `:` item from default value, which can simultaneously solve
" the two problems respectively (note each -= can only remove one item at once):
" 1. auto conceal indent when input `#` char, and in this case cannot indent
" line with `>>` in normal mode;
" 2. auto conceal indent when input `std:`;
"
" although I use `-=` at following, explicitly set is also possible:
" setlocal cinkeys=0{,0},0),0],:,!^F,o,O,e
"
" NOTE: there NO double quotation marker around setting value. i.e.
" setlocal cinkeys="0{,0},0),0],:,!^F,o,O,e"
" is INVALID, which will lead the actual value of `&cinkeys` become empty
"
" NOTE: the default value is `0{,0},0),0],:,0#,!^F,o,O,e`
"
setlocal cinkeys-=0#
setlocal cinkeys-=:

" ######################################################################
" coc.nvim

" show or hide symbol outline of current buffer
nnoremap <localleader>lt :call CocAction('showOutline')<CR>
nnoremap <localleader>lT :call CocAction('hideOutline')<CR>

" ======================================================================
" coc-clangd

" switch between .h and .cpp
command Head CocCommand clangd.switchSourceHeader
nnoremap <localleader>lh :CocCommand clangd.switchSourceHeader<CR>

" check symbol info
command Info CocCommand clangd.symbolInfo

" ######################################################################
" shortcuts

" open `after/ftplugin/cpp.vim` instead of `ftplugin/c.vim`
nnoremap <buffer> <F2> <ESC>:vsplit \| execute("edit".g:blade_vim_config_dir."/after/ftplugin/cpp.vim")<CR>

" compile and excute
nnoremap <silent><buffer> <F5> <ESC>:split \| terminal cd "%:p:h"
  \ && clang++ -g -std=c++20 -Wall -O0
  \ -isystem/opt/homebrew/Cellar/boost/1.83.0/include
  \ -isystem/opt/homebrew/Cellar/eigen/3.4.0_1/include/eigen3
  \ "%:t" -o "%:t:r.bin"
  \ && "%:p:r.bin"<CR>

