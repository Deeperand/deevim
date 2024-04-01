if !exists("g:deevim_load_defx") || g:deevim_load_defx == 0
  finish
endif

" ==========
" APPEARANCE

" solve the white space highting issue
autocmd FileType defx match ExtraWhitespace /^^/

" enable use icon?
let g:defx_icons_enable_syntax_highlight = 1

call defx#custom#column('icon', {
\ 'directory_icon': ' ▸',
\ 'opened_icon': ' ▾',
\ 'root_icon': ' ',
\ })

call defx#custom#column('filename', {
\ 'min_width': 35,
\ 'max_width': 90,
\ })

call defx#custom#column('mark', {
\ 'readonly_icon': '✗',
\ 'selected_icon': '✓',
\ })

" git status symbol
let g:defx_git#indicators = {
\ 'Modified'  : '✹',
\ 'Staged'    : '✚',
\ 'Untracked' : '✭',
\ 'Renamed'   : '➜',
\ 'Unmerged'  : '═',
\ 'Ignored'   : '☒',
\ 'Deleted'   : '✖',
\ 'Unknown'   : '?'
\ }

" test position of indent
" call defx#custom#column('indent', {
"     \ 'indent': '✗',
"     \ })

" ==========
" DEFAULT OPTIONS
"
" - `'new': 1`: Create new defx buffer, which will allow open several defx at
" different window at same time (simulate behavior of `netrw`)
call defx#custom#option('_', {
\ 'winwidth':40,
\ 'split': 'vertical',
\ 'direction': 'topleft',
\ 'show_ignored_files': 1,
\ 'buffer_name': 'FileTree',
\ 'toggle': 1,
\ 'new': 1,
\ 'resume': 1,
\ 'columns': 'indent:git:icon:icons:space:filename'
\ })

" ==========
" SHORTCUTS

function CurrentPath() abort
return fnameescape(expand('%:p:h'))
endfunction

function CurrentFile() abort
return fnameescape(expand('%:p'))
endfunction

" use no-split Defx to replace built-in `:Explore` (netrw)
command! E execute 'Defx -split=no ' . CurrentPath()

" shortcuts in file tree buffer
autocmd FileType defx call s:defx_my_settings()
function! s:defx_my_settings() abort
  nnoremap <silent><buffer><expr> <CR> defx#do_action('open')
  nnoremap <silent><buffer><expr> c defx#do_action('copy')
  nnoremap <silent><buffer><expr> m defx#do_action('move')
  nnoremap <silent><buffer><expr> p defx#do_action('paste')
  nnoremap <silent><buffer><expr> E defx#do_action('open', 'vsplit')
  nnoremap <silent><buffer><expr> P defx#do_action('open', 'pedit')
  nnoremap <silent><buffer><expr> o defx#do_action('open_or_close_tree')
  nnoremap <silent><buffer><expr> K defx#do_action('new_directory')
  nnoremap <silent><buffer><expr> N defx#do_action('new_file')
  nnoremap <silent><buffer><expr> M defx#do_action('new_multiple_files')
  nnoremap <silent><buffer><expr> C defx#do_action('toggle_columns',
                                  \ 'mark:indent:icon:filename:type:size:time')
  nnoremap <silent><buffer><expr> S defx#do_action('toggle_sort', 'time')

  " use upper case `D` can avoid conflict with `vim-surround`'s
  " `nmap ds <plug>Dsurround`, and also agree with convention used
  " by `netrw`
  nnoremap <silent><buffer><expr> D defx#do_action('remove_trash')

  nnoremap <silent><buffer><expr> r defx#do_action('rename')
  nnoremap <silent><buffer><expr> ! defx#do_action('execute_command')
  nnoremap <silent><buffer><expr> x defx#do_action('execute_system')
  nnoremap <silent><buffer><expr> yy defx#do_action('yank_path')
  nnoremap <silent><buffer><expr> . defx#do_action('toggle_ignored_files')
  nnoremap <silent><buffer><expr> ; defx#do_action('repeat')

  " follow convention used by `netrw`
  nnoremap <silent><buffer><expr> - defx#do_action('cd', ['..']) " jump to parent dir

  nnoremap <silent><buffer><expr> ~ defx#do_action('cd') " jump to home dir
  nnoremap <silent><buffer><expr> q defx#do_action('quit')
  nnoremap <silent><buffer><expr> <space><space> defx#do_action('toggle_select')
  nnoremap <silent><buffer><expr> * defx#do_action('toggle_select_all')
  nnoremap <silent><buffer><expr> j line('.') == line('$') ? 'gg' : 'j'
  nnoremap <silent><buffer><expr> k line('.') == 1 ? 'G' : 'k'
  nnoremap <silent><buffer><expr> <C-l> defx#do_action('redraw')
  nnoremap <silent><buffer><expr> <C-g> defx#do_action('print')
  nnoremap <silent><buffer><expr> cd defx#do_action('change_vim_cwd')
endfunction

