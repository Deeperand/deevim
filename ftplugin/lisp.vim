" ######################################################################
" basic settings

" comment string
setlocal commentstring=;%s

" ######################################################################
" shortcuts

" run current file (square bracket symbol '[' and ']' should't in the file path)
nnoremap <silent><buffer> <F5> <ESC>:split \| terminal ros "%:p"<CR>

" run current file in opened REPL (with the help of plug 'slime')
nnoremap <silent><buffer> <localleader>lv :execute 'SlimeSend1 (load "'.expand("%:p").'")'<CR>

" quick open REPL in terminal
" to keep at current terminal, add <C-w>h to the end like
nnoremap <localleader>tt :vsplit \| terminal cd '%:p:h'; cl-repl<CR><C-w>h
