" general setting
    setlocal shiftwidth=4
    setlocal commentstring=\%%s

    " " Completions in Insert/Replace-mode with <Ctrl-N>
    " setlocal dictionary-=$VIM/syntax/lilypond-words dictionary+=$VIM/syntax/lilypond-words
    " setlocal complete-=k complete+=k
    " setlocal showmatch

    " command excuted will use 'make'
        setlocal makeprg=lilypond

    " soundfont dirctory
        let s:soundfont_dir="$HOME/Documents/soundfont/KawaiUprightPiano-20190703_sf2/KawaiUprightPiano-20190703.sf2"

" function define
    " open midi (assume the midi file wat at the same dirctory of according .ly file)
    function! s:openAccordingMidi() abort
        execute("silent !fluidsynth -i " . s:soundfont_dir . " '" . expand("%:t:r") . ".midi'")
    endfunction

    " open pdf (assume the pdf file wat at the same dirctory of according .ly file)
    function! s:openAccordingPDF() abort
        execute("silent ! open '". expand("%:t:r") . ".pdf'")
    endfunction

" function key shortcut
" <F2> open configure file
    nnoremap <silent> <F2> :vsplit \| call execute("edit ".g:blade_vim_config_dir."/after/ftplugin/".&filetype.".vim")<CR>

" <F3> open with Frescobaldi
    nnoremap <buffer><silent> <F3> :silent ! open -a Frescobaldi "%:p"<CR>

" <F4>  open in VS Code
    nnoremap <buffer><silent> <F4> :silent ! code "%:p"<CR>
"
" <F5>  cd & make & open
    nnoremap <buffer><silent> <F5> :cd %:p:h<CR>:silent make "%"<CR>:call <SID>openAccordingPDF()<CR>:call <SID>openAccordingMidi()<CR>

" <F10> chamge default behaviou 'emenu'
    nnoremap <buffer> <F10> :call asyncrun#quickfix_toggle(10)<CR>

" <F12> delete trailing space (since <F12> is close to <DEL>; default behavior is comment )
    nnoremap <buffer> <F12> :StripWhitespace<CR>
    inoremap <buffer> <F12> <ESC>:StripWhitespace<CR>a

" localleader shortcut
    " cd & make
        nnoremap <silent><buffer> <localleader>ll :cd %:p:h<CR>:silent make "%"<CR>
    " open pdf file
        " nnoremap <silent><buffer> <localleader>lv :cd %:p:h<CR>:execute "silent ! open ". expand("%:t:r") . ".pdf"<CR>
        nnoremap <silent><buffer> <localleader>lv :cd %:p:h<CR>:call <SID>openAccordingPDF()<CR>
    " open midi file
        nnoremap <silent><buffer> <localleader>ls :cd %:p:h<CR>:call <SID>openAccordingMidi()<CR>
