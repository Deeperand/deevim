" key map
    " open c.vim
        nnoremap <buffer> <F2> <ESC>:e ~/.vim/ftplugin/c.vim<CR>
    " compile single file
        nnoremap <silent><buffer> <localleader>ll :AsyncRun gcc -Wall -O2 "$(VIM_FILEPATH)" -o "$(VIM_FILEDIR)/$(VIM_FILENOEXT)" <CR>
    " excute compiled film
        nnoremap <silent><buffer> <F5> :AsyncRun -raw -cwd=$(VIM_FILEDIR) "$(VIM_FILEDIR)/$(VIM_FILENOEXT)" <CR>
    " 配置 ctags 的参数
        let g:gutentags_ctags_extra_args = ['--fields=+niazS', '--extra=+q']
        let g:gutentags_ctags_extra_args += ['--c++-kinds=+px']
        let g:gutentags_ctags_extra_args += ['--c-kinds=+px']
