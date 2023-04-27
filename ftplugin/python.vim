" run current file (square bracket symbol '[' and ']' should't in the file path)
    nnoremap <silent><buffer> <F5> <ESC>:split \| terminal python3 "%:p"<CR>

" split window to run REPL
    nnoremap <localleader>tt :vsplit \| terminal cd '%:p:h'; ipython<CR><C-w>h
