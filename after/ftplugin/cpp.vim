" compile single file
    " open cpp.vim
        nnoremap <buffer> <F2> <ESC>:vsplit \| execute("edit".g:blade_vim_config_dir."/after/ftplugin/cpp.vim")<CR>
    " compile
        nnoremap <silent><buffer> <localleader>ll :AsyncRun g++ -Wall -O2 "$(VIM_FILEPATH)" -o "$(VIM_FILEDIR)/$(VIM_FILENOEXT).bin" <CR>
    " excute compiled film
        nnoremap <silent><buffer> <localleader>lv :split \| terminal cd "%:p:h"; %:t:r.bin" <CR>
    " compile and excute
        nnoremap <silent><buffer> <F5> <ESC>:split \| terminal cd "%:p:h"; g++ -Wall -O2 "%:t" -o "%:t:r.bin"; "%:t:r.bin"<CR>
