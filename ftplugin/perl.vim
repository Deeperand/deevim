" run perl program
nnoremap <buffer><silent> <F5> <ESC>:split \| terminal source ~/.bashrc; perl "%:p"<CR>
