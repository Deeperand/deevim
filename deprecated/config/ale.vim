" to install ale, use:
" Plug 'dense-analysis/ale', {'for': ' '}

" ######################################################################

" ==========
" COHERENT WITH AIRLINE

" enable/disable ale integration
let g:airline#extensions#ale#enabled = 1

" ale error_symbol
let airline#extensions#ale#error_symbol = 'E:'

" ale warning
let airline#extensions#ale#warning_symbol = 'W:'

" ale show_line_numbers
let airline#extensions#ale#show_line_numbers = 1

" ale open_lnum_symbol
let airline#extensions#ale#open_lnum_symbol = '(L'

" ale close_lnum_symbol
let airline#extensions#ale#close_lnum_symbol = ')'

" Set this. Airline will handle the rest.
let g:airline#extensions#ale#enabled = 1 " let airline work well with ALE
let g:ale_sign_column_always = 1 "始终开启标志列
let g:ale_change_sign_column_color = 1 " set different highlights for the sign column itself
let g:ale_sign_highlight_linenrs = 1 " allowed highlight of line number
let g:ale_lint_on_text_changed = 'normal' " 'normal' check buffers if text changed (both normal and insert)
let g:ale_hover_to_preview = 1

" ==========
" ERROR, WARNING AND INFO
"
let ale_sign_error = '✗'
highlight ALEError gui=undercurl guisp=#ff0000 guibg=#87d7ff
highlight ALEErrorSign guifg=#ff0000

" seems useless for vim, but the help said noevim was supported
let ale_sign_warning = '⚡'
highlight ALEWarning gui=undercurl guisp=#5f87ff guibg=#ffd787
highlight ALEWarningSign guifg=#ff8700

" seems useless for vim, but the help said noevim was supported
let ale_sign_info = '?'
highlight ALEInfo gui=bold guifg=#00d700
highlight ALEInfoSign gui=undercurl guisp=#ff8700 guibg=#5fff5f

" highlight of column ralated column number (seems useless for vim, but the help said noevim was supported)
highlight ALEErrorSignLineNr guifg=#ff0000
highlight ALEWarningSignLineNr guibg=#ffaf00
highlight ALEInfoSignLineNr guifg=#00d700

" ==========
" KEY MAP
" nevigate between diagnostic
nmap <silent> <M-p> <Plug>(ale_previous_wrap)
nmap <silent> <M-n> <Plug>(ale_next_wrap)
" toggle and detail
nnoremap <Leader>et :ALEToggle<CR>
nnoremap <Leader>ed :ALEDetail<CR>

" ==========
" LINTER CHOOSE
  let g:ale_linters = {
  \ 'cpp': [''],
  \ 'c': [''],
  \ 'python': [''],
  \ 'tex' : [''],
  \}
