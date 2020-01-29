let SessionLoad = 1
let s:so_save = &so | let s:siso_save = &siso | set so=0 siso=0
let v:this_session=expand("<sfile>:p")
silent only
cd ~/
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
set shortmess=aoO
badd +464 Library/Mobile\ Documents/iCloud~com~coderforart~iOS~MWeb/Documents/Courses\ (Markdown)/\[第4学期]\ Other/Private/alknxvdse/Diary\ 2020.md
badd +1 Library/Mobile\ Documents/iCloud~com~coderforart~iOS~MWeb/Documents/Courses\ (Markdown)/\[第4学期]\ Other/Private/alknxvdse/Log\ 2020.md
badd +15 .vim/.gitignore
badd +2 .vim/coc-settings.json
badd +1 .vim/set
argglobal
%argdel
edit Library/Mobile\ Documents/iCloud~com~coderforart~iOS~MWeb/Documents/Courses\ (Markdown)/\[第4学期]\ Other/Private/alknxvdse/Log\ 2020.md
set splitbelow splitright
wincmd t
set winminheight=0
set winheight=1
set winminwidth=0
set winwidth=1
argglobal
let s:l = 22 - ((21 * winheight(0) + 29) / 58)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
22
normal! 05|
tabnext 1
if exists('s:wipebuf') && getbufvar(s:wipebuf, '&buftype') isnot# 'terminal'
  silent exe 'bwipe ' . s:wipebuf
endif
unlet! s:wipebuf
set winheight=1 winwidth=20 winminheight=1 winminwidth=1 shortmess=filnxtToOFc
let s:sx = expand("<sfile>:p:r")."x.vim"
if file_readable(s:sx)
  exe "source " . fnameescape(s:sx)
endif
let &so = s:so_save | let &siso = s:siso_save
doautoall SessionLoadPost
unlet SessionLoad
" vim: set ft=vim :
