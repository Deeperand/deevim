" key map
    " compile
        nnoremap <silent><buffer> <localleader>ll :AsyncRun gcc -Wall -O2 "$(VIM_FILEPATH)" -o "$(VIM_FILEDIR)/$(VIM_FILENOEXT).bin" <CR>
    " excute compiled film
        nnoremap <silent><buffer> <localleader>lv :split \| terminal cd "%:p:h"; "%:t:r.bin" <CR>
    " compile and excute
        nnoremap <silent><buffer> <F5> <ESC>:split \| terminal cd "%:p:h"; gcc -Wall -O2 "%:t" -o "%:t:r.bin"; "%:t:r.bin"<CR>

    " 配置 ctags 的参数
        let b:gutentags_ctags_extra_args = ['--fields=+niazS', '--extra=+q']
        let b:gutentags_ctags_extra_args += ['--c++-kinds=+px']
        let b:gutentags_ctags_extra_args += ['--c-kinds=+px']

    " commentary string
    setlocal commentstring=//%s
