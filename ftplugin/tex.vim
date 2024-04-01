" general setting
    let g:tex_flavor = 'latex'
    let g:tex_indent_items = 0 " forbid auto-indent of items
    " let g:tex_fold_enabled = 1 " latex fold set
    " setlocal foldmethod=syntax " fold-method
    setlocal commentstring=%%s " commentary string

    setlocal shiftwidth=2

    " disable conceal symble
    let g:tex_conceal=""
    " set conceallevel=0

    " turn off rainbow-parenthesis plugin
    if exists("g:rainbow_active")
        RainbowToggleOff
        let g:flag_tex_rainbow_off = 1 " used to check if this `if` statement is really executed
    end

    syntax sync fromstart
    syntax sync maxlines=1000

" ######################################################################
" specify the path of coc-nvim configure file
    " let b:coc_config_home = expand($XDG_CONFIG_HOME) . "/nvim/tex"

" ######################################################################
" vimtex config
    let g:vimtex_view_method = 'skim'
    let g:vimtex_view_skim_active = 1
    " let g:vimtex_compiler_progname = 'nvim'
    " let g:vimtex_callback_progpath ='/opt/homebrew/bin/nvim'
    " let g:vimtex_view_method = 'sioyek'
    " let g:vimtex_view_syoyek_exe = '/Applications/sioyek.app/Contents/MacOS/sioyek'
    let g:vimtex_quickfix_mode = 0 " didn't show error if you don't use '\le'
    let g:vimtex_indent_enabled = 0
    let g:vimtex_imaps_enabled = 0 " disable the default auto-expand snippet
    let g:vimtex_syntax_conceal_disable=1 " enable/disable syntax conceal like '\item --> ○'
    " let g:vimtex_syntax_enabled=0
    " let g:vimtex_mappings_enabled = 1
    " let g:vimtex_compiler_latexmk = {
    "     \ 'executable' : 'latexmk',
    "     \ 'options' : [
    "     \   '-xelatex',
    "     \   '-file-line-error',
    "     \   '-synctex=1',
    "     \   '-interaction=nonstopmode',
    "     \ ],
    "     \}
    " let g:vimtex_compiler_latexmk_engines = {
    "     \ '_'                : '-pdf',
    "     \ 'pdflatex'         : '-pdf',
    "     \ 'dvipdfex'         : '-pdfdvi',
    "     \ 'lualatex'         : '-lualatex',
    "     \ 'xelatex'          : '-xelatex',
    "     \ 'context (pdftex)' : '-pdf -pdflatex=texexec',
    "     \ 'context (luatex)' : '-pdf -pdflatex=context',
    "     \ 'context (xetex)'  : '-pdf -pdflatex=''texexec --xtx''',
    "     \}

" enable fold (disabled by defult), from `:h vimtex-folding` :
"
" VimTeX can fold documents according to the LaTeX structure (part, chapter,
" section and subsection).  Folding in tex files is turned off by default, but
" can be enabled if desired, either through the option |g:vimtex_fold_enabled|,
" or manually with >vim

"   set foldmethod=expr
"   set foldexpr=vimtex#fold#level(v:lnum)
"   set foldtext=vimtex#fold#text()

" The folding is mainly configured through the dictionary option
" g:vimtex_fold_types.
let g:vimtex_fold_enabled=1

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

" by default `<localleader>ll` is bind to `<plug>(vimtex-compile)`
" (`:VimtexCompile`), which will automatically compile when detected file
" change (assuming use `latexmk` to compile; note `latexmk` is used by
" default), and execute `:VimtexCompile` can toggle the auto-compile mode.
" However, with the practical use, I found it's a bit annoying, so I decide to
" use `<plug>(vimtex-compile-ss)` (`:VimtexCompileSS`), which only compile
" one times at each execution.
nmap <localleader>ll <plug>(vimtex-compile-ss)

" ======================================================================
" text object

" `<plug>(vimtex-ie)` and `<plug>(vimtex-ae)` is used to select content inside
" environment default setting is `ie` and `ae`, but which conflict with
" `kana/vim-textobj-entire`, which use `ie` and `ae` to select entire file
omap <buffer> iE <plug>(vimtex-ie)
omap <buffer> aE <plug>(vimtex-ae)
vmap <buffer> iE <plug>(vimtex-ie)
vmap <buffer> aE <plug>(vimtex-ae)

" `<plug>(vimtex-ic)` and `<plug>(vimtex-ac)` is used to select content inside
" commands. default setting is `ie` and `ae`, but looks it is occupied by
" `<Plug>(signify-motion-inner-pending)` in my vim, so I use capital `C`
" instead
omap <buffer> iC <plug>(vimtex-ic)
omap <buffer> aC <plug>(vimtex-ac)
vmap <buffer> iC <plug>(vimtex-ic)
vmap <buffer> aC <plug>(vimtex-ac)


" ######################################################################
" airline config
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

" delimitMate
    let b:delimitMate_quotes = "\" '" " conceal the auto-complete of `


" ######################################################################
" custom command

" keymap
" change line
    inoremap <buffer> <M-CR> \\<CR>

" close the enviroment
    imap <buffer> <M-e> <plug>(vimtex-delim-close)

" open with TexPad
    nnoremap <buffer><silent> <F3> :silent ! open -a Texpad "%:p"<CR>

" open a temporary tex file to draft equation ('m' meas 'mathematics')
    let b:draft_tex_dir = '~/Documents/LaTeX/formula_draft/formula_draft.tex'
    nnoremap <buffer><silent> <localleader>lm :execute 'silent ! open -a Texpad ' . b:draft_tex_dir<CR> <C-w><C-s>:execute 'edit' . b:draft_tex_dir<CR> zR/{equation}<CR>j^

" delete private info (TODO)
command! -range=% TexDeletePrivate silent! <line1>,<line2>substitute/\v\s*\\code\{(canvas|DB\d).{-1,}\}\s*(and)?//g

" ======================================================================
" inkscape related
" only cancel the code, the inverse search of LaTeX with MacVim can work well
    " if empty(v:servername) && exists('*remote_startserver')
    "     call remote_startserver('VIM')
    " endif

function! EditFigure(name) abort
    silent !mkdir '%:p:h/figure'
    let l:filename = expand('%:p:h') . '/figure/' . a:name . '.svg'
    if empty(glob(l:filename))
        execute 'silent !cp -n $HOME/Documents/LaTeX/empty.svg ' . "'" . l:filename . "'"
    endif
    execute 'silent !source $HOME/.bashrc; inkscape ' . "'" . l:filename . "' &"
endfunction

function! DeleteFigure(name) abort
    let l:files = glob(expand('%:p:h').'/figure/'.a:name.'*', 0, 1)
    if !empty(l:files)
        for l:file in l:files
            execute 'silent !mv '. "'" . l:file . "'" . ' ~/.Trash'
        endfor
    endif
endfunction

function! CompileFigure() abort
    let l:svgfiles = glob(expand('%:p:h').'/figure/*.svg', 0, 1)
    if !empty(l:svgfiles)
        for l:svgfile in l:svgfiles
            let l:pdffile = l:svgfile[:-5] . '.pdf'
            execute "silent !source $HOME/.bashrc; inkscape -D -z --file=" . "'" . l:svgfile . "'" . " --export-pdf=" . "'" . l:pdffile . "'" . " --export-latex &"
        endfor
    endif
endfunction

" command! -nargs=1 Efig call EditFigure(<f-args>)
" command! -nargs=1 Dfig call DeleteFigure(<f-args>)
" command! Cfig call CompileFigure()

" store the selected at a register first, then input it into function
" vnoremap <buffer> <F3>e "zy<ESC>:call<SPACE>EditFigure(@z)<CR>
" vnoremap <buffer> <F3>d "zy<ESC>:call<SPACE>DeleteFigure(@z)<CR>
" nnoremap <buffer> <F3>c <ESC>:Cfig<CR>

" used to test input or output
function! Print(string) abort
    echo a:string
endfunction

" vnoremap <buffer> <F3>t "zy<ESC>:call<SPACE>Print(@z)<CR>

command! -nargs=1 Print call Print(<q-args>)

" decrease level

" ======================================================================
" try to action backward research
" 1
" function! s:write_server_name() abort
"   let nvim_server_file = (has('win32') ? $TEMP : '/tmp') . '/vimtexserver.txt'
"   call writefile([v:servername], nvim_server_file)
" endfunction

" augroup vimtex_common
"   autocmd!
"   autocmd FileType tex call s:write_server_name()
" augroup END
"
" 2
" function! SetServerName()
"   if has('win32')
"     let nvim_server_file = $TEMP . "/curnvimserver.txt"
"   else
"     let nvim_server_file = "/tmp/curnvimserver.txt"
"   endif
"   let cmd = printf("echo %s > %s", v:servername, nvim_server_file)
"   call system(cmd)
" endfunction

" augroup vimtex_common
"     autocmd!
"     autocmd FileType tex call SetServerName()
" augroup END
