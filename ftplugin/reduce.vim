" commentary string (provided by tpope/vim-commentary)
setlocal commentstring=%%s

" quick open REPL in terminal
" to keep at current terminal, add <C-w>h to the end like
nnoremap <localleader>tt :vsplit \| terminal cd '%:p:h'; redcsl -w<CR><C-w>h
