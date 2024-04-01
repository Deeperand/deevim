" ######################################################################
" basic settings

" commentary string
setlocal commentstring=//%s

" ######################################################################
" ctags settings

let b:gutentags_ctags_extra_args = ['--fields=+niazS', '--extra=+q']
let b:gutentags_ctags_extra_args += ['--c++-kinds=+px']
let b:gutentags_ctags_extra_args += ['--c-kinds=+px']

" ######################################################################
" key map

" compile
nnoremap <silent><buffer> <localleader>ll :AsyncRun gcc -Wall -O2 "$(VIM_FILEPATH)" -g -o "$(VIM_FILEDIR)/$(VIM_FILENOEXT).out" <CR>

" excute compiled film
nnoremap <silent><buffer> <localleader>lv :split \| terminal cd "%:p:h"; "%:t:r.out" <CR>

" compile and excute
nnoremap <silent><buffer> <F5> <ESC>:split \| terminal cd "%:p:h"; gcc "%:t" -g -o "%:t:r.out"; "%:t:r.out"<CR>

" debug
nnoremap <silent><buffer> <localleader>ld :split \| terminal cd "%:p:h"; gdb "%:t:r.out" <CR>

" make and run
nnoremap <silent><buffer> <localleader>lm :split \| terminal cd "%:p:h"; make; program.o<CR>
