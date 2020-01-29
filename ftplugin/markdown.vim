" vim-markdown
    let g:vim_markdown_folding_disabled = 1 " control if folding by the plugin 'vim-markdown'. Disable it to use 'fastfold' to increase the speed.
    let g:vim_markdown_folding_level = 0
    let g:vim_markdown_toc_autofit = 1 " Allow for the TOC window to auto-fit when it's possible for it to shrin
    let g:vim_markdown_conceal = 0 " To disable conceal regardless of conceallevel setting

    " To disable math conceal with LaTeX math syntax enabled
        let g:tex_conceal = ""
        let g:vim_markdown_math = 1 " Used as $x^2$, $$x^2$$, escapable as \$x\$ and \$\$x\$\$.

    let g:vim_markdown_new_list_item_indent = 0 " solve the problem that auto-indent in list
    let g:vim_markdown_conceal_code_blocks = 0 " Disabling conceal for code fences
    let g:vim_markdown_auto_insert_bullets = 1 " Automatically inserting bulletpoints can lead to problems when wrapping text (see issue #232 for details), so it can be disabled
    let g:vim_markdown_fenced_languages = ['c++=cpp', 'viml=vim', 'bash=sh', 'ini=dosini','LaTeX=tex']

" markdown-preview.nvim
    nmap <buffer> <Localleader>ll <Plug>MarkdownPreview
    nmap <buffer> <Localleader>ls <Plug>MarkdownPreviewStop
    nmap <buffer> <Localleader>lt <ESC>:Toc<CR>
    let g:mkdp_auto_close = 0 " don't auto-close the window
    let g:mkdp_browser = '/Applications/Google Chrome.app/Contents/MacOS/Google Chrome' " set browser as Chrome

" other plug or setting
    " unlet g:tex_fold_enabled
        let g:markdown_folding = 1 " let markdown fold
    " set foldmethod=manual " fold-method
        let b:delimitMate_quotes = "\" '" " conceal the auto-complete of `
    " open ftplugin
        nnoremap <buffer> <F2> <ESC>:e ~/.vim/ftplugin/markdown.vim<CR>
    " open syntax
        nnoremap <buffer> <F3> <ESC>:e ~/.vim/after/syntax/markdown.vim<CR>
    " let change line easier
        inoremap <buffer> <S-CR> <Space><Space><CR>
