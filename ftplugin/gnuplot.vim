" commentary string
setlocal commentstring=#%s

" run current file (square bracket symbol '[' and ']' should't in the file path)
nnoremap <silent><buffer> <F5> :execute "split | terminal gnuplot " . fnameescape("%:p")<CR>
