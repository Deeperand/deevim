" commentary string
setlocal commentstring=%%s

" convert to pdf and open it
nnoremap <silent><buffer> <localleader>ll <ESC>:execute "!ps2pdf " . expand("%:p") . "&& open " . expand("%:p:r") . ".pdf"<CR>

" convert to pdf and open it;
" page size automatically fit graph size (didn't realize yet);
nnoremap <silent><buffer> <localleader>lv <ESC>:execute "!ps2pdf -dEPSCrop " . expand("%:p") . "&& open " . expand("%:p:r") . ".pdf"<CR>
