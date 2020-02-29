" inherit basic setting from tex file
setlocal filetype=tex
setlocal nofoldenable

" edit this file
    nnoremap <buffer> <F2> <ESC>:vsplit \| execute("edit".g:blade_vim_config_dir."/ftplugin/temptex.vim")<CR>

" quit and save file content, and copy the entire file except the first and the last line to '"' register
    nnoremap <buffer> gq :2,$-1yank "<CR>:bwipeout<CR>
