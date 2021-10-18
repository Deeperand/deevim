" run current file
    nnoremap <silent><buffer> <F5> <ESC>:split \| terminal julia --color=yes "%:p"<CR>
" run and open REPL
    nnoremap <silent><buffer> <localleader>ll :split \| terminal julia --color=yes -i "%:p"<CR>
" run current file in opened REPL (with the help of plug 'slime')
    nnoremap <silent><buffer> <localleader>lv :execute 'SlimeSend1 include("'.expand("%:p").'")'<CR>
" open REPL
    nnoremap <silent><buffer> <localleader>lr :split \| terminal julia<CR> :echo "job id: ".b:terminal_job_id<CR>

" commentary string
    setlocal commentstring=#%s

