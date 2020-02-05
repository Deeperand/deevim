" compile single file
    nnoremap <silent><buffer> <localleader>ll :AsyncRun g++ -Wall -O2 "$(VIM_FILEPATH)" -o "$(VIM_FILEDIR)/$(VIM_FILENOEXT).exe" <CR>
