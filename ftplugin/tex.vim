let g:tex_flavor = 'latex'
let g:tex_indent_items=0 " forbid auto-indent of items
let g:vimtex_view_method = 'skim'
let g:vimtex_quickfix_mode = 0 " didn't show error if you don't use '\le'
let g:vimtex_view_use_temp_files = 1 " if compile failed, don't change the pdf files compiled at the last times
let g:tex_conceal = ""
let vimtex_indent_enabled = 0
let b:delimitMate_quotes = "\" '" " conceal the auto-complete of `
let g:vimtex_imaps_enabled = 0 " disable the default auto-expand snippet

set foldmethod=syntax " fold-method
let g:tex_fold_enabled = 1 " latex fold set

" key map
" special setting of the type of the file
    nnoremap <buffer> <F2> <ESC>:e ~/.vim/ftplugin/tex.vim<CR>
" change line
    inoremap <buffer> <M-CR> \\<CR>
" close the enviroment
    imap <F2> <plug>(vimtex-delim-close)
" only cancel the code, the inverse search of LaTeX with MacVim can work well
    if empty(v:servername) && exists('*remote_startserver')
        call remote_startserver('VIM')
    endif
" only cancel the code, the inverse search of LaTeX with MacVim can work well
" if empty(v:servername) && exists('*remote_startserver')
"     call remote_startserver('VIM')
" endif
    

function! EditFigure(name) abort
    silent !mkdir '%:p:h/Figure'
    let l:filename = expand('%:p:h') . '/Figure/' . a:name . '.svg'
    if empty(glob(l:filename))
        execute 'silent !cp -n /Users/he/Documents/LaTeX/empty.svg ' . "'" . l:filename . "'"
    endif
    execute 'silent !source /Users/he/.bash_profile; inkscape ' . "'" . l:filename . "' &"
endfunction

function! DeleteFigure(name) abort
    let l:files = glob(expand('%:p:h').'/Figure/'.a:name.'*', 0, 1)
    if !empty(l:files)
        for l:file in l:files
            execute 'silent !mv '. "'" . l:file . "'" . ' ~/.Trash'
        endfor
    endif
endfunction

function! CompileFigure() abort
    let l:svgfiles = glob(expand('%:p:h').'/Figure/*.svg', 0, 1)
    if !empty(l:svgfiles)
        for l:svgfile in l:svgfiles
            let l:pdffile = l:svgfile[:-5] . '.pdf'
            execute "silent !source /Users/he/.bash_profile; inkscape -D -z --file=" . "'" . l:svgfile . "'" . " --export-pdf=" . "'" . l:pdffile . "'" . " --export-latex &"
        endfor
    endif
endfunction

command! -nargs=1 Efig call EditFigure(<f-args>)
command! -nargs=1 Dfig call DeleteFigure(<f-args>)
command! Cfig call CompileFigure()

" store the selected at a register first, then input it into function
vnoremap <buffer> <F3>e "zy<ESC>:call<SPACE>EditFigure(@z)<CR>
vnoremap <buffer> <F3>d "zy<ESC>:call<SPACE>DeleteFigure(@z)<CR>
nnoremap <buffer> <F3>c <ESC>:Cfig<CR>

" used to test input or output
function! Print(string) abort
    echo a:string
endfunction

vnoremap <buffer> <F3>t "zy<ESC>:call<SPACE>Print(@z)<CR>

command! -nargs=1 Print call Print(<q-args>)

