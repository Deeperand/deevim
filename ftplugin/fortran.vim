" set makeprg=gfortran\ %\ -o\ -f\ %:p:h/.out
        nnoremap <silent><buffer> <localleader>ll :AsyncRun gfortran -Wall -O2 "$(VIM_FILEPATH)" -o "$(VIM_FILEDIR)/$(VIM_FILENOEXT).out" <CR>
    " excute compiled film
        nnoremap <silent><buffer> <localleader>lv :split \| terminal cd "%:p:h"; "%:t:r.out" <CR>
    " compile and excute
        nnoremap <silent><buffer> <F5> <ESC>:split \| terminal cd "%:p:h"; gfortran -Wall -O2 "%:t" -o "%:t:r.out"; "%:t:r.out"<CR>
