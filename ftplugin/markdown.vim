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

    " remap how to go to current header to avoid the conflict with 'fugitive' and 'signify'
        nmap <buffer> gh <Plug>Markdown_MoveToCurHeader
        let g:which_key_map_g.h = 'T [md] goto current header'
    " remap how to go to upper header
        nmap <buffer> gu <Plug>Markdown_MoveToParentHeader
        let g:which_key_map_g.u = 'T [md] goto upper header'
    " let '[c' work with `fugitive`
        nmap <buffer> [c <plug>(signify-prev-hunk)

" markdown-preview.nvim
    " start preview
        nmap <buffer> <localleader>ll <Plug>MarkdownPreview
    " stop preview
        nmap <buffer> <localleader>ls <Plug>MarkdownPreviewStop
    " open toc
        nmap <buffer> <localleader>lt <ESC>:Toc<CR>
    " switch if enable sync scroll
        function g:Switch_option(x)
            if a:x==1
                return 0
            elseif a:x==0
                return 1
            endif
        endfunction
        nnoremap <buffer><expr> <localleader>lc execute('let g:mkdp_preview_options["disable_sync_scroll"] = g:Switch_option(g:mkdp_preview_options["disable_sync_scroll"])')
    " table format
        nnoremap <buffer> <localleader>la <ESC>:TableFormat<CR><ESC>

    " shortcut manage ('T' means 'type specific')
        let g:which_key_map_Local_Leader.l = {'name' : '{for specific type}',}
        let g:which_key_map_Local_Leader.l.a = 'T [md] table format'
        let g:which_key_map_Local_Leader.l.c = 'T [md] switch sync scroll state'
        let g:which_key_map_Local_Leader.l.l = 'T [md] preview markdown file'
        let g:which_key_map_Local_Leader.l.s = 'T [md] stop preview markdown file'
        let g:which_key_map_Local_Leader.l.t = 'T [md] open markdown TOC'

    let g:mkdp_auto_close = 0 " don't auto-close the window
    let g:mkdp_browser = '/Applications/Google Chrome.app/Contents/MacOS/Google Chrome' " set browser as Chrome

" other plug or setting
    " unlet g:tex_fold_enabled
        let g:markdown_folding = 1 " let markdown fold
    " set foldmethod=manual " fold-method
        let b:delimitMate_quotes = "\" '" " conceal the auto-complete of `
    " open syntax
        nnoremap <buffer> <F3> <ESC>:vsplit \| execute("edit".g:blade_vim_config_dir."/after/syntax/markdown.vim")<CR>
    " let change line easier
        inoremap <buffer> <M-CR> <Space><Space><CR>
    " open a temporary tex file to input equation ('m' meas 'mathematics')
        nnoremap <buffer> <localleader>lm <C-w><C-s>:edit ~/.vim/.temptex<CR>
