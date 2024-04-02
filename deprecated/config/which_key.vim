" to install vim-which-key, use:
" Plug 'liuchengxu/vim-which-key'

" ######################################################################
" vim-which-key
" appearance setting is put at 'after/syntax/which_key.vim')

" let g:mapleader = ","

" time befor pup jump out
set timeoutlen=800


" ==========
" SHORTCUTS
"
" hint key map
nnoremap <silent> <Leader>k :WhichKey '#KeyHint#'<CR>
xnoremap <silent> <Leader>k :WhichKeyVisual '#KeyHint#'<CR>

" ==========
" DICTIONARY
"
" declare dictionary
let g:which_key_map = {}
let g:which_key_map_Leader = {}
let g:which_key_map_Local_Leader = {}
let g:which_key_map_LeftSqureBracket = {}
let g:which_key_map_RightSqureBracket = {}
let g:which_key_map_LeftAngle = {}
let g:which_key_map_RightAngle = {}
let g:which_key_map_Equal = {}
let g:which_key_map_Surround = {}
let g:which_key_map_a = {}
let g:which_key_map_g = {}
let g:which_key_map_i = {}
let g:which_key_map_z = {}
let g:vim_default_textobj = {}

" main page
let g:which_key_map = {
  \ 'l': [':WhichKey "\\"', '{leader}'],
  \ 'a': [':WhichKey "a"', '{text object "a"}'],
  \ 'g': [':WhichKey "g"', '{go to}'],
  \ 'i': [':WhichKey "i"', '{text object "i"}'],
  \ 'z': [':WhichKey "z"', '{fold}'],
  \ 'S': [':WhichKey! g:which_key_map_Surround', '{vim-surround}'],
  \ 'T': [':WhichKey! g:vim_default_textobj', '{default text object}'],
  \ 'H': [':e ~/Documents/my_config/Blade-Vim/syntax/which_key.vim', 'edit vim-which-key highlight'],
  \ '[': [':WhichKey "["', "{set on; jump back}"],
  \ ']': [':WhichKey "]"', "{set off; jump next}"],
  \ '<': [':WhichKey "<"', "{paste; dcrease indent}"],
  \ '>': [':WhichKey ">"', "{paste; increase indent}"],
  \ '=': [':WhichKey "="', "{paste; keep indent}"],
  \ "\<space>": [':WhichKey " "', "{local leader}"],
\ }

" exact hint
let g:vim_default_textobj = {
  \ '(': 'parenthesis',
  \ ')': 'parentheses',
  \ '[': 'square bracket',
  \ ']': 'square bracket',
  \ '{': 'brace',
  \ '}': 'brace',
  \ "'": 'signle quote',
  \ '"': 'double quote',
  \ '`': 'reverse quote',
  \ 't': 'XML tag',
  \ 'w': 'words',
  \ 'W': 'string',
  \ 's': 'sentence',
  \ 'p': 'paregraph',
\ }

" fold
let g:which_key_map_z = {
  \ 'R': [':normal! zR', 'unfold all'],
  \ 'r': [':normal! zr', 'unfold once'],
  \ 'M': [':normal! zM', 'fold all'],
  \ 'm': [':normal! zm', 'fold once'],
\ }

" open link
let g:which_key_map_g.x = 'open link'

" ######################################################################
" GENERAL KEY MAPPINGS

" move
let g:which_key_map_g.j = 'next actual line'
let g:which_key_map_g.k = 'previous actual line'

" add parenthesis/space ('a' means 'add', 'A' will inster extra space at
" both side)
let g:which_key_map_Local_Leader.p = 'add space'
let g:which_key_map_Local_Leader.a = {'name': '{add parenthesis}'}
let g:which_key_map_Local_Leader.a.p = 'add round parenthesis'
let g:which_key_map_Local_Leader.a.s = 'add square parenthesis'
let g:which_key_map_Local_Leader.a.b = 'add brace'

" ==========
" FASTER SUBSTITUTE: 'r' means 'replace'
"
let g:which_key_map_Leader.r = 'replace (with default pattern)'
let g:which_key_map_Leader.R = 'replace (without default pattern)'

" ==========
" OPEN FILE

" quick access vimrc and help doc
let g:which_key_map_Leader.C = 'open vimrc'

" close the current file in buffer (which means 'buffer wipe out')
let g:which_key_map_Leader.q = 'wipe current buffer'

" quit Vim (which means 'quit all')
let g:which_key_map_Leader.Q = 'quit vim'

" close current tab
let g:which_key_map_Leader.w = 'close split window'

" close current split window
let g:which_key_map_Leader.W = 'close tab'

" ==========
" QUICK SET

" declare directory
let g:which_key_map_Local_Leader.s = {'name': '{set option}'}

" set syntax
let g:which_key_map_Local_Leader.s.s = 'set syntax'

" set file type
let g:which_key_map_Local_Leader.s.t = 'set filetype'

" set indent length
let g:which_key_map_Local_Leader.s.i = {'name': '{set indent}'}
let g:which_key_map_Local_Leader.s.i.2 = '2 spaces as indent'
let g:which_key_map_Local_Leader.s.i.4 = '4 spaces as indent'

" set cancel level
let g:which_key_map_Local_Leader.s.c = 'conceallevel'

" choose fold method
let g:which_key_map_Local_Leader.s.f = {'name': '{set fold method}', }
let g:which_key_map_Local_Leader.s.f.d = 'diff'
let g:which_key_map_Local_Leader.s.f.e = 'expr'
let g:which_key_map_Local_Leader.s.f.i = 'indent'
let g:which_key_map_Local_Leader.s.f.k = 'marker'
let g:which_key_map_Local_Leader.s.f.m = 'manual'
let g:which_key_map_Local_Leader.s.f.s = 'syntax'

" ==========
" TERMINAL

" run command in terminal at current file path with a split window
let g:which_key_map_Local_Leader.t = 'run at terminal'

" ######################################################################
" SET FOR OTHER PLUGINS

" ======================================================================
" * vim-plug

let g:which_key_map_Leader.p = {
  \ 'name': '{plug manage}',
  \ 'i': 'install plugs',
  \ 'I': 'uninstall plugs',
  \ 'u': 'update plugs',
  \ 'U': 'update vim-plug itself',
  \ 's': 'check status',
\ }

" ======================================================================
" ale

let g:which_key_map_LeftSqureBracket.g = 'ale: previous diagnostic'
let g:which_key_map_RightSqureBracket.g = 'ale: next diagnostic'
let g:which_key_map_Leader.e = {
  \ 'name': '{ALE}',
  \ 't': 'toggle',
  \ 'd': 'detail',
\ }

" ======================================================================
" asyncrun

let g:which_key_map_Leader.a = {
  \ 'name' : '{asyncrun}',
  \ 'r' : ':AsyncRun',
  \ 'R' : ':AsyncRun!',
  \ 's' : ':AsyncStop',
  \ 'c' : 'AsyncRun at current dir',
\ }

" ======================================================================
" coc.nvim

" declare dictionary used by coc.nvim
let g:which_key_map_coc = {'name': '{coc.nvim}'}

" ----------
" LSP

" function text object, requires document symbols feature of languageserver.
let g:which_key_map_a.f = 'function'
let g:which_key_map_i.f = 'function'

" various goto-commands
let g:which_key_map_coc_goto = {
  \ 'd': 'definition',
  \ 'y': 'type definition',
  \ 'i': 'implementation',
  \ 'r': 'references',
\ }
let g:which_key_map_g['name'] = 'go to'
call extend(g:which_key_map_g, g:which_key_map_coc_goto)

" ----------
" MULTICURSOR

" add current character cursor to multi-cursors
let g:which_key_map_Leader['\'] = 'add multicursor'

" add current words ('m' means 'multi')
let g:which_key_map_Leader.m = 'add current words to multicursor'


" add and jump to next same words (since the behavior like normal command 'n',
let g:which_key_map_Leader.n = 'add word to multicursor and jump next'

" add and jump to previous same words
let g:which_key_map_Leader.N = 'add word to multicursor and jump previous'

" add all the same words ('a' mean 'all')
let g:which_key_map_Leader.M = {'name': '{multicursor}',}
let g:which_key_map_Leader.M.a = 'add all same words to multicursor'

" use operator for add range to cursors. Use normal command like `<leader>xi(`
" ('t' means 'text object')
let g:which_key_map_Leader.M.t = 'add textobj to multicursor'

" ----------
" COC LIST

let g:which_key_map_Leader.S = {
  \ 'name': '{search with CocList}',
  \ 'b': 'buffer',
  \ 'c': 'history command',
  \ 'e': 'extensions',
  \ 'f': 'file',
  \ 'g': 'grep',
  \ 'h': 'help file',
  \ 'k': 'marks',
  \ 'l': 'line',
  \ 'm': 'maps',
  \ 'o': 'outline',
  \ 'p': 'output',
  \ 'q': 'quickfix',
  \ 'r': 'mru',
  \ 's': 'language servers',
  \ 't': 'tags',
  \ 'v': 'vim commands',
\ }

" ----------
" MISC
" run `:CocCommand`
let g:which_key_map_coc.m = 'coc command'

" pick color ('c' means 'coc'; the second 'c' means 'color')
let g:which_key_map_coc.c = 'pick color'

" open configure .json file ('j' means 'json')
let g:which_key_map_coc.j = 'edit json file'

" check diagnostic ('d' means 'diagnostic')
let g:which_key_map_coc.d = 'coc diagnostic'

" extension manage ('e' means 'extension')
let g:which_key_map_coc.e = {
  \ 'l': 'list extensions',
  \ 'i': 'install extensions',
  \ 'u': 'uninstall extensions',
\ }

" ----------
" MERGER

" add dic `g:which_key_map_coc` to `dic g:which_key_map_Leader.c`
let g:which_key_map_Leader.c = {'name': '{coc.nvim}', }
call extend(g:which_key_map_Leader.c, g:which_key_map_coc)

" ======================================================================
" git related

" declare dictionary for git shortcut
let g:which_key_map_Leader.g = {'name' : '{git}',}

" use terminal to display log graph
let g:which_key_map_Leader.g.l = 'git log graph (term)'

" compare with last commit of current file ('d' means diff)
let g:which_key_map_Leader.g.d = 'compare with last commit'

" add current file to stage
let g:which_key_map_Leader.g.a = 'add current file to stage'

" check git log with parameter '--graph' in a brief way ('g' means 'log') (加上右移 'h' 是因为有时会需要键入命令才能打开 log 窗口, 加入一个无害的指令可以避免手动进行此步)
let g:which_key_map_Leader.g.g = 'git log graph (brief)'

" check git status via `signify`
let g:which_key_map_Leader.g.s = ':Gstatus'

" fold unchanged content ('f' means 'fold' or 'diff')
let g:which_key_map_Leader.g.f = 'fold unchang in new tab'

" highlight diff
let g:which_key_map_Leader.g.h = 'toggle highlight change'

" hunk text object ('ic' operates on all lines of the current hunk. 'ac' does the same, but also removes all trailing empty lines.)
let g:which_key_map_i.c = 'change hunk'
let g:which_key_map_a.c = 'change hunk'

" key map
let g:which_key_map_LeftSqureBracket.c = 'previous change'
let g:which_key_map_RightSqureBracket.c = 'next change'
let g:which_key_map_LeftSqureBracket.C = 'first change'
let g:which_key_map_RightSqureBracket.C = 'last change'

" ======================================================================
" LeaderF

let g:which_key_map_LeaderF = {
  \ 'c': 'history command',
  \ 'f': 'file',
  \ 'F': 'all file',
  \ 'h': 'help document',
  \ 'm': 'function',
  \ 'M': 'function all',
  \ 'r': 'Mru (current Cwd)',
  \ 'R': 'Mru (all)',
  \ 's': 'history search',
  \ 't': 'tag (current buffer)',
  \ 'T': 'tag (all)',
\ }
let g:which_key_map_Leader.s = {'name': '{search with LeaderF}'}
call extend(g:which_key_map_Leader.s, g:which_key_map_LeaderF)

" ======================================================================
" godlygeek/tabular

let g:which_key_map_Leader.t = {
  \ 'name': '{tabular}',
  \ '&': 'segment by &',
  \ '|': 'segment by |',
  \ '#': 'segment by #',
  \ '=': 'segment by =',
  \ '\': 'segment by \\',
  \ '%': 'segment by %',
  \ ':': 'segment by :',
  \ ',': 'segment by ,',
  \ '"': 'segment by "',
  \ 'a': 'input pattern',
\ }

let g:which_key_map_Leader.T = {
  \ 'name': '{tabular center}',
  \ '&': 'segment by &',
  \ '|': 'segment by |',
  \ '#': 'segment by #',
  \ '=': 'segment by =',
  \ '\': 'segment by \\',
  \ '%': 'segment by %',
  \ ':': 'segment by :',
  \ ',': 'segment by ,',
  \ '"': 'segment by "',
  \ 'A': 'use last trim cmd',
\ }

" ======================================================================
" text object related (only list the text object provided by third-party
" plugins)

" textogj-entire
let which_key_map_a['e'] = 'entire file'
let which_key_map_i['e'] = 'entire file (no empty line)'

" textogj-fold
let which_key_map_a['z'] = 'fold (no count trailing line)'
let which_key_map_i['z'] = 'fold (count triling line)'

" textogj-indent
let which_key_map_a['i'] = 'current indent'
let which_key_map_i['i'] = 'current indent (no empty line)'
let which_key_map_a['I'] = 'current indent (adjacent)'
let which_key_map_i['I'] = 'current indent (adjacent, no empty line)'

" textogj-line
" the spaces in the start will be ignored
let which_key_map_a['l'] = 'current line (no leading char)'
" break line symbol '\n' won't be selected
let which_key_map_i['l'] = 'current line (no end char)'

" textobj-syntax
let which_key_map_a['y'] = 'syntax highlighted item'
let which_key_map_i['y'] = 'syntax highlighted item (whith space)'

" ======================================================================
" vim-surround (only record the cmd that wasn't included at the default text
" object)

let g:which_key_map_Surround = {
\ 'd': {'name': '{delete surround}',
    \ 's': {'name': '{delete surround (special cmd)}', },
    \ },
\ 'c': {'name': '{change surround (special cmd)}',
    \ 's': {'name': '{change surround (special cmd)}', },
    \ 'S': {'name': '{change surround to new line (special cmd)}'}
    \ },
\ 'y': {'name': '{your surround}',
    \ 's': {'name': '{your surround (special cmd)}', },
    \ 'S': {'name': '{your surround to new line (special cmd)}', },
    \ },
\ }

let g:vim_surround_delete = {
  \ '<': ['ds<', 'angle bracket'],
  \ '>': ['ds>', 'angle bracket'],
  \ 'notation': ["\<ESC>", "other symbol isn't in the default text object was also supported"],
\ }

let g:vim_surround_change = {
  \ '<': ['cs<', 'angle bracket'],
  \ '>': ['cs>', 'angle bracket'],
  \ 'obj+f': ['csf', 'function'],
  \ 'obj+F': ['csF', 'function (with spaces)'],
  \ "obj+<C-f>": ["\<ESC>", 'function (all surrounded by parentheses)'],
  \ 'other': ["\<ESC>", "other symbol"],
\ }

let g:vim_surround_y = {
  \ '<': ['ys<', 'angle bracket'],
  \ '>': ['ys>', 'angle bracket'],
  \ 'obj+f': ["\<ESC>", 'function'],
  \ 'obj+F': ["\<ESC>", 'function (with spaces)'],
  \ "obj+<C-f>": ["\<ESC>", 'function (all surrounded by parentheses)'],
  \ 'other': ["\<ESC>", "other symbol"],
\ }

call extend(g:which_key_map_Surround.d.s, g:vim_surround_delete)
call extend(g:which_key_map_Surround.c.s, g:vim_surround_change)
call extend(g:which_key_map_Surround.c.S, g:vim_surround_change)
call extend(g:which_key_map_Surround.y.s, g:vim_surround_y)
call extend(g:which_key_map_Surround.y.S, g:vim_surround_y)

" ======================================================================
" vim-unimpaired

" ==========
" left square bracket

" ----------
" EX-COMMAND
" (If a count is given, it becomes an argument to the command)

" file
let g:which_key_map_LeftSqureBracket['a'] = ':previous'  " edit [count] previous file
let g:which_key_map_LeftSqureBracket['A'] = ':first'     " start editing the first file in the argumet list

" buffer
let g:which_key_map_LeftSqureBracket['b'] = ':bprevious' " go to [N]th (default 1) previous buffer in buffer list
let g:which_key_map_LeftSqureBracket['B'] = ':bfirst'    " go to first buffer in buffer list

" error list
let g:which_key_map_LeftSqureBracket['l'] = ':lprevious'  " display the [count] previous error in the list
let g:which_key_map_LeftSqureBracket['L'] = ':lfirst'     " diaplay error [nr]. if [nr] omitted, the first error is diaplayed
let g:which_key_map_LeftSqureBracket['<C-L>'] = ':lpfile' " display the last error in the [count] previous file in the list that includes a file name.
let g:which_key_map_LeftSqureBracket['q'] = ':cprevious'  " 'q' means 'quickfix', similar to ':lprevious'
let g:which_key_map_LeftSqureBracket['Q'] = ':cfirst'     " 'q' means 'quickfix', similar to ':lfirst'
let g:which_key_map_LeftSqureBracket['<C-Q>'] = ':cpfile' " 'q' means 'quickfix', similar to ':lpfile'

" tag
let g:which_key_map_LeftSqureBracket['t'] = ':tprevious'      " tag previous
let g:which_key_map_LeftSqureBracket['T'] = ':tfirst'         " tag first
let g:which_key_map_LeftSqureBracket['<C-T>'] = ':ptprevious' " similar to 'tprevious', but in window

" ----------
" NON-EX-COMMAND

" paste above
let g:which_key_map_LeftSqureBracket['p'] = 'paste above'
let g:which_key_map_LeftSqureBracket['P'] = 'paste above'

" encode
let g:which_key_map_LeftSqureBracket['x'] = '[motion] XML encode'
let g:which_key_map_LeftSqureBracket['xx'] = 'XML encode (current)'
let g:which_key_map_LeftSqureBracket['u'] = '[motion] URL encode'
let g:which_key_map_LeftSqureBracket['uu'] = 'URL encode (current)'
let g:which_key_map_LeftSqureBracket['y'] = '[motion] C String encode'
let g:which_key_map_LeftSqureBracket['yy'] = 'C String encode (current)'

" other useful key map
let g:which_key_map_LeftSqureBracket[' '] = 'add line above'
let g:which_key_map_LeftSqureBracket['e'] = 'exchange above'
let g:which_key_map_LeftSqureBracket['f'] = 'preceding file'
let g:which_key_map_LeftSqureBracket['n'] = 'previous SCM conflict'

" switch option
let g:which_key_map_LeftSqureBracket.o = {
  \ 'name': '{option on}',
  \ 'b': 'light background',
  \ 'c': 'cursor line on',
  \ 'd': 'diff on',
  \ 'h': 'highlight search on',
  \ 'i': 'ignore cases on',
  \ 'l': 'list on',
  \ 'n': 'line number on',
  \ 'r': 'relativenumber on',
  \ 's': 'spell check on',
  \ 'u': 'cursor column on',
  \ 'v': 'virtual edit on',
  \ 'w': 'warp on',
  \ 'x': 'cursorline and cursorcolumn on',
\ }

" ==========
" right square bracket

" ----------
" EX-COMMAND
" (if a count is given, it becomes an argument to the command)

" file
let g:which_key_map_RightSqureBracket['a'] = ':next' " edit [count] next file
let g:which_key_map_RightSqureBracket['A'] = ':last' " start editing the last file in the argumet list

" buffer
let g:which_key_map_RightSqureBracket['b'] = ':bnext' " go to [N]th (default 1) next buffer in buffer list
let g:which_key_map_RightSqureBracket['B'] = ':blast' " go to last buffer in buffer list

" error list
let g:which_key_map_RightSqureBracket['l'] = ':lnext'      " display the [count] next error in the list
let g:which_key_map_RightSqureBracket['L'] = ':llast'      " diaplay error [nr]. if [nr] omitted, the last error is diaplayed
let g:which_key_map_RightSqureBracket['<C-L>'] = ':lnfile' " display the first error in the [count] next file in the list that includes a file name.
let g:which_key_map_RightSqureBracket['q'] = ':cnext'      " 'q' means 'quickfix', similar to ':lnext'
let g:which_key_map_RightSqureBracket['Q'] = ':clast'      " 'q' means 'quickfix', similar to ':llast'
let g:which_key_map_RightSqureBracket['<C-Q>'] = ':cnfile' " 'q' means 'quickfix', similar to ':lnfile'

" tag
let g:which_key_map_RightSqureBracket['t'] = ':tnext'      " tag previous
let g:which_key_map_RightSqureBracket['T'] = ':tlast'      " tag first
let g:which_key_map_RightSqureBracket['<C-T>'] = ':ptnext' " similar to 'tprevious', but in window

" ----------
" NON-EX-COMMAND

" paste
let g:which_key_map_RightSqureBracket['p'] = 'paste below'      " tag first
let g:which_key_map_RightSqureBracket['P'] = 'paste below'      " tag first

" decode
let g:which_key_map_RightSqureBracket['x'] = '[motion] XML decode'
let g:which_key_map_RightSqureBracket['xx'] = 'XML decode (current)'
let g:which_key_map_RightSqureBracket['u'] = '[motion] URL decode'
let g:which_key_map_RightSqureBracket['uu'] = 'URL decode (current)'
let g:which_key_map_RightSqureBracket['y'] = '[motion] C String decode'
let g:which_key_map_RightSqureBracket['y'] = 'C String decode (current)'

" other useful key map
let g:which_key_map_RightSqureBracket[' '] = 'add line below'
let g:which_key_map_RightSqureBracket['e'] = 'exchange above'
let g:which_key_map_RightSqureBracket['f'] = 'succeding file'
let g:which_key_map_RightSqureBracket['n'] = 'next SCM conflict'

" switch option
let g:which_key_map_RightSqureBracket.o = {
\ 'name': '{option off}',
\ 'b': 'dark background',
\ 'c': 'cursor line off',
\ 'd': 'diff off',
\ 'h': 'highlight search off',
\ 'i': 'ignore cases off',
\ 'l': 'list off',
\ 'n': 'line number off',
\ 'r': 'relativenumber off',
\ 's': 'spell check off',
\ 'u': 'cursor column off',
\ 'v': 'virtual edit off',
\ 'w': 'warp off',
\ 'x': 'cursorline and cursorcolumn off',
\ }

" ==========
" OTHER SYMBOLS

" left angle
let which_key_map_LeftAngle['p'] = 'paste after & increase indent'
let which_key_map_LeftAngle['P'] = 'paste before & increase indent'

" right angle
let which_key_map_RightAngle['p'] = 'paste after & increase indent'
let which_key_map_RightAngle['P'] = 'paste before & increase indent'

" equal
let which_key_map_Equal['p'] = 'paste after & re-indent'
let which_key_map_Equal['P'] = 'paster before & re-indent'

" ######################################################################
" FTPLUGINS

" ======================================================================
" Markdown

" ==========
" BASIC SETTINGS

" declare dictionary
let g:which_key_map_Local_Leader.l = {'name' : '{for specific type}',}

" open a temporary tex file to input equation ('m' meas 'mathematics')
let g:which_key_map_Local_Leader.l.m = "input LaTeX equation"

" open with MWeb
let g:which_key_map_Local_Leader.l.v = 'T [md] open with MWeb'

" ==========
" vim-markdown

" remap how to go to current header to avoid the conflict with 'fugitive' and 'signify'
let g:which_key_map_g.h = 'T [md] goto current header'

" remap how to go to upper header
let g:which_key_map_g.u = 'T [md] goto upper header'

" ==========
" markdown-preview.nvim

" start preview
let g:which_key_map_Local_Leader.l.l = 'T [md] preview markdown file'

" end preview
let g:which_key_map_Local_Leader.l.s = 'T [md] stop preview markdown file'

" open toc
let g:which_key_map_Local_Leader.l.t = 'T [md] open markdown TOC'

" switch if enable sync scroll
let g:which_key_map_Local_Leader.l.c = 'T [md] switch sync scroll state'

" table format
let g:which_key_map_Local_Leader.l.a = 'T [md] table format'
