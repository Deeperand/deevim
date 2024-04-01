" ######################################################################
" basic settings

" format of comment string
setlocal commentstring=//%s

" white spaces used in each indent level
setlocal shiftwidth=2

" turn on auto indent feature
setlocal smartindent

" ######################################################################
" shortcuts

" render current `file.dot` file to `file.dot.pdf`  (didn't use `:slient !`
" because wish to see error messages)
nnoremap <silent><buffer> <F5> :! dot -Tpdf -O "%:p"<CR>

" open generated file
nnoremap <silent><buffer> <localleader>lv :execute "silent !open " . expand("%:p") . ".pdf"<CR>

" render and open (since use `:slient`, one cannot check the error message.
" But one can check if compile success by checking if the output file is
" automatically open)
nnoremap <silent><buffer> <localleader>ll :execute
    \ "silent !dot -Tpdf -O " . fnameescape(expand("%:p")) . " && "
    \ . "open " . fnameescape(expand("%:p")) . ".pdf"<CR>
