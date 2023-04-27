" run current file (square bracket symbol '[' and ']' should't in the file path)
    nnoremap <silent><buffer> <F5> <ESC>:split \| terminal sbcl --script "%:p"<CR>
