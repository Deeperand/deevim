" run current file (square bracket symbol '[' and ']' should't in the file path)
    nnoremap <silent><buffer> <F5> <ESC>:split \| terminal python3 "%:p"<CR>

" open ftplugin
    nnoremap <buffer> <F2> <ESC>:vsplit \| execute("edit".g:blade_vim_config_dir."/ftplugin/python.vim")<CR>
