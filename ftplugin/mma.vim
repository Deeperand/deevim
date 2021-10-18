setlocal commentstring=(*%s*)

" run file
    nnoremap <silent><buffer> <F5> :split \| terminal chmod +x "%:p"; "%:p"<CR>
    " nnoremap <silent><buffer> <F5> :split \| terminal wolframscript "%:p"<CR>
