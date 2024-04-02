" ######################################################################
" BASIC SETTINGS
" other plug or setting

    " unlet g:tex_fold_enabled
        let g:markdown_folding = 1 " let markdown fold

    " set foldmethod=manual " fold-method
        let b:delimitMate_quotes = "\" '" " conceal the auto-complete of `

    " open syntax
        " nnoremap <buffer> <F3> <ESC>:vsplit \| execute("edit".g:blade_vim_config_dir."/after/syntax/markdown.vim")<CR>

    " let change line easier
        inoremap <buffer> <M-CR> </br><CR>

    " open a temporary tex file to input equation ('m' meas 'mathematics')
        nnoremap <buffer> <localleader>lm <C-w><C-s>:edit ~/.vim/.temptex<CR>

    " open with MWeb
        nnoremap <buffer><silent> <localleader>lv :silent ! open -a MWeb\ Pro "%:p"<CR>
        " nnoremap <buffer><silent> <localleader>lv :! open -a MWeb Pro "%:p"<CR>

" ######################################################################
" vim-markdown

    " control if folding by the plugin 'vim-markdown'. Disable it to use 'fastfold' to increase the speed.
        let g:vim_markdown_folding_disabled = 1

    " Allow for the TOC window to auto-fit when it's possible for it to shrin
        let g:vim_markdown_toc_autofit = 1

    " To disable conceal regardless of conceallevel setting
        let g:vim_markdown_conceal = 0

    " To disable math conceal with LaTeX math syntax enabled
        let g:vim_markdown_math = 1 " Used as $x^2$, $$x^2$$, escapable as \$x\$ and \$\$x\$\$.
        let g:tex_conceal = "" " disable syntax conceal for LaTeX formula (for vim built-in syntax highlight)
        let g:vimtex_syntax_conceal_disable = 1 " disable syntax conceal for LaTeX formula (for vimtex's syntax highlight)

    " solve the problem that auto-indent in list
        let g:vim_markdown_new_list_item_indent = 0

    " Disabling conceal for code fences
        let g:vim_markdown_conceal_code_blocks = 0

    " Automatically inserting bulletpoints can lead to problems when wrapping text (see issue #232 for details), so it can be disabled
        let g:vim_markdown_auto_insert_bullets = 1

    " other setting
        let g:vim_markdown_fenced_languages = ['c++=cpp', 'viml=vim', 'bash=sh', 'ini=dosini','LaTeX=tex']
        let g:vim_markdown_folding_level = 0

    " remap how to go to current header to avoid the conflict with 'fugitive' and 'signify'
        nmap <buffer> gh <Plug>Markdown_MoveToCurHeader

    " remap how to go to upper header
        nmap <buffer> gu <Plug>Markdown_MoveToParentHeader

    " let '[c' work with `fugitive`
        nmap <buffer> [c <plug>(signify-prev-hunk)

"  vim-markdown
" disable syntax concealing
    let g:vim_markdown_conceal = 0

" ######################################################################
" markdown-preview.nvim

    " use a well-defined port to avoid restart diffcult
        let g:mkdp_port = ''

    " style of markdown preview ('p' means 'appearance')
        let g:markdown_css_dir = expand('~/Documents/my_config/Blade-markdown')
        let g:markdown_preview_style = "github_like"
        let g:mkdp_markdown_css = g:markdown_css_dir."/".g:markdown_preview_style.".css"

        command! -complete=custom,s:selectMarkdownSytle -nargs=1 MarkdownStyle call <SID>setMarkdownSytle(<f-args>)

        function! s:selectMarkdownSytle(A, L, P)
            return "github\ngithub_like\nMWeb"
        endfunction

        function! s:setMarkdownSytle(style)
            let g:markdown_preview_style = a:style
            let g:mkdp_markdown_css = g:markdown_css_dir."/".g:markdown_preview_style.".css"
        endfunction

        nnoremap <buffer> <localleader>lp :MarkdownStyle<space>

    " start preview
        nmap <buffer> <localleader>ll <Plug>MarkdownPreview

    " end preview
        nmap <buffer> <localleader>ls <Plug>MarkdownPreviewStop

    " open toc
        nmap <buffer> <localleader>lt <ESC>:Toc<CR>

    " switch if enable sync scroll
        nnoremap <buffer><expr> <localleader>lc execute('let g:mkdp_preview_options["disable_sync_scroll"] = <SID>switch_option(g:mkdp_preview_options["disable_sync_scroll"])')

        function s:switch_option(x)
            if a:x==1
                return 0
            elseif a:x==0
                return 1
            endif
        endfunction


    " table format
        nnoremap <buffer> <localleader>la <ESC>:TableFormat<CR><ESC>

    " browse setting
        let g:mkdp_auto_close = 0 " don't auto-close the window
        let g:mkdp_browser = '/Applications/Google Chrome.app/Contents/MacOS/Google Chrome' " set browser as Chrome
