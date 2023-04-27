" key map
if has('nvim')
    " compile
        nnoremap <silent><buffer> <localleader>ll :split \| terminal cd "%:p:h"; javac "%:t" <CR>
    " excute compiled film
        nnoremap <silent><buffer> <localleader>lv :split \| terminal cd "%:p:h"; java -classpath \. "%:t" <CR>
    " compile and excute
        nnoremap <silent><buffer> <F5> <ESC>:split \| terminal cd "%:p:h"; javac "%:t"; java -classpath \. "%:t:r"<CR>
endif


