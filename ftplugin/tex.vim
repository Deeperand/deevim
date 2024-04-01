" ######################################################################
" basic settings

" detect `.tex` file as `latex`
let g:tex_flavor = 'latex'

 " forbid auto-indent of items
let g:tex_indent_items = 0

" commentary string
setlocal commentstring=%%s

" disable conceal symble
let g:tex_conceal=""

" ==========
" FOLD

" enable latex syntax fold (?)
" let g:tex_fold_enabled = 1

" fold-method set
" setlocal foldmethod=syntax

" ==========
" SYNTAX HIGHLIGHT RENDER

" `:h :syn-sync-first`: The file will be parsed from the start.  This makes
" syntax highlighting accurate, but can be slow for long files.
syntax sync fromstart

" `:h syn-sync-maxlines`: "If the "maxlines={N}" argument is given, the number
" of lines that are searched for a comment or syncing pattern is restricted to
" N lines backwards (after adding "minlines")."
syntax sync maxlines=1000

" ######################################################################
" delimitMate

" disable the auto-complete of `
let b:delimitMate_quotes = "\" '"

" ######################################################################
" rainbow-parenthesis

" turn off rainbow-parenthesis plugin
if exists("g:rainbow_active")
  RainbowToggleOff
  let g:flag_tex_rainbow_off = 1 " used to check if this `if` statement is really executed
end

" ######################################################################
" vimtex config

" viewer software settings
let g:vimtex_view_method = 'skim'
let g:vimtex_view_skim_active = 1

" didn't show error if you don't use '\le'
let g:vimtex_quickfix_mode = 0

" indent control (?)
let g:vimtex_indent_enabled = 0

" disable the default auto-expand snippet
let g:vimtex_imaps_enabled = 0

 " enable/disable syntax conceal like '\item --> ○'
let g:vimtex_syntax_conceal_disable=1

" if use syntax highlight provided by `vimtex`
" let g:vimtex_syntax_enabled=0

" VIMTEX FOLD
"
" Here I enabled fold (disabled by defult), from `:h vimtex-folding` :
"
" VimTeX can fold documents according to the LaTeX structure (part, chapter,
" section and subsection).  Folding in tex files is turned off by default, but
" can be enabled if desired, either through the option |g:vimtex_fold_enabled|,
" or manually with >vim
"
"   set foldmethod=expr
"   set foldexpr=vimtex#fold#level(v:lnum)
"   set foldtext=vimtex#fold#text()

" The folding is mainly configured through the dictionary option
" g:vimtex_fold_types.
let g:vimtex_fold_enabled=1

" TEMP FILE
"
" ``When enabled, this option specifies to copy the `.pdf` and `.synctex.gz`
" files after successful compilation.''
"
" ``The viewer will use the copies, which helps to avoid issues such that as the
" pdf becoming unavailable during compilation.''
"
" ``The copies are named similar to the original files with a `_`
" prefix.''
"
" (?) Due to the viewer use `_` file, it will meet ``double flick'' rather
" than ``singel flick''. I suspect the first flick is due to compile, the
" second flick is due to copy. If only wish to see the double flick, use
" system viewer to open no-underscore version .pdf file
let g:vimtex_view_use_temp_files = 1

" ==========
" MAPPINGS

" COMPILE SHORTCUT
"
" if use `vimtex` default mappings
" let g:vimtex_mappings_enabled = 1

" by default `<localleader>ll` is bind to `<plug>(vimtex-compile)`
" (`:VimtexCompile`), which will automatically compile when detected file
" change (assuming use `latexmk` to compile; note `latexmk` is used by
" default), and execute `:VimtexCompile` can toggle the auto-compile mode.
" However, with the practical use, I found it's a bit annoying, so I decide to
" use `<plug>(vimtex-compile-ss)` (`:VimtexCompileSS`), which only compile
" one times at each execution.
nmap <localleader>ll <plug>(vimtex-compile-ss)


" TEXT OBJECT
"
" `<plug>(vimtex-ie)` and `<plug>(vimtex-ae)` is used to select content inside
" environment default setting is `ie` and `ae`, but which conflict with
" `kana/vim-textobj-entire`, which use `ie` and `ae` to select entire file
omap <buffer> iE <plug>(vimtex-ie)
omap <buffer> aE <plug>(vimtex-ae)
vmap <buffer> iE <plug>(vimtex-ie)
vmap <buffer> aE <plug>(vimtex-ae)
"
" `<plug>(vimtex-ic)` and `<plug>(vimtex-ac)` is used to select content inside
" commands. default setting is `ie` and `ae`, but looks it is occupied by
" `<Plug>(signify-motion-inner-pending)` in my vim, so I use capital `C`
" instead
omap <buffer> iC <plug>(vimtex-ic)
omap <buffer> aC <plug>(vimtex-ac)
vmap <buffer> iC <plug>(vimtex-ic)
vmap <buffer> aC <plug>(vimtex-ac)

" ==========
" LATEXMK

" let g:vimtex_compiler_latexmk = {
"   \ 'executable' : 'latexmk',
"   \ 'options' : [
"   \   '-xelatex',
"   \   '-file-line-error',
"   \   '-synctex=1',
"   \   '-interaction=nonstopmode',
"   \ ],
" \}

" let g:vimtex_compiler_latexmk_engines = {
"   \ '_'                : '-pdf',
"   \ 'pdflatex'         : '-pdf',
"   \ 'dvipdfex'         : '-pdfdvi',
"   \ 'lualatex'         : '-lualatex',
"   \ 'xelatex'          : '-xelatex',
"   \ 'context (pdftex)' : '-pdf -pdflatex=texexec',
"   \ 'context (luatex)' : '-pdf -pdflatex=context',
"   \ 'context (xetex)'  : '-pdf -pdflatex=''texexec --xtx''',
" \}

" ==========
" AIRLINE SUPPORT

" enable/disable vimtex integration (set 1` to enable)
let g:airline#extensions#vimtex#enabled = 1

" left and right delimiters (shown only when status string is not empty) >
let g:airline#extensions#vimtex#left = "{"
let g:airline#extensions#vimtex#right = "}"

" the current tex file is the main project file (nothing is shown by default) >
let g:airline#extensions#vimtex#main = ""

" the current tex file is a subfile of the project and the compilation is set for the main file
let g:airline#extensions#vimtex#sub_main = "m"

" the current tex file is a subfile of the project and the compilation is set for this subfile
let g:airline#extensions#vimtex#sub_local = "l"

" single compilation is running
let g:airline#extensions#vimtex#compiled = "c₁"

" continuous compilation is running
let g:airline#extensions#vimtex#continuous = "c"

" viewer is opened
let g:airline#extensions#vimtex#viewer = "v"


" ######################################################################
" CUSTOM COMMAND AND MAPPINGS

" change line
inoremap <buffer> <M-CR> \\<CR>

" open with TexPad
nnoremap <buffer><silent> <F3> :silent ! open -a Texpad "%:p"<CR>

" open a temporary tex file to draft equation ('m' meas 'mathematics')
let b:draft_tex_dir = '~/Documents/LaTeX/formula_draft/formula_draft.tex'
nnoremap <buffer><silent> <localleader>lm :execute
      \ 'silent ! open -a Texpad ' . b:draft_tex_dir<CR>
      \ <C-w><C-s>:execute 'edit' . b:draft_tex_dir<CR>
      \ zR/{equation}<CR>j^

" delete private info (TODO)
command! -range=% TexDeletePrivate silent!
      \ <line1>,<line2>substitute/\v\s*\\code\{(canvas|DB\d).{-1,}\}\s*(and)?//g
