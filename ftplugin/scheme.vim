" run current file (square bracket symbol '[' and ']' should't in the file path)
nnoremap <silent><buffer> <F5> <ESC>:split \| terminal racket -f "%:p"<CR>

" quick open REPL in terminal
nnoremap <localleader>tt :vsplit \| terminal cd '%:p:h'; racket<CR><C-w>h
