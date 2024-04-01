" solve conflict of tab key raised by `slimv` but keep its completion feature
if !exists("g:slimv_unmap_tab") || g:slimv_unmap_tab != 0
    inoremap <silent><buffer> <s-Tab> <C-R>=SlimvHandleTab()<CR>
endif
