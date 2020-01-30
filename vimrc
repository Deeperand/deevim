" normal setting
    " most simple setting
        filetype plugin indent on       " Load plugins accroding to detected filetype.
        syntax on                       " Enable syntax highlighting

    " indent
        set autoindent                  " Indent according to previous line
        set smartindent
        set shiftround                  " indents to next multiple of 'shiftwidth'
        set expandtab                   " Use spaces instead of tebs.
        set shiftwidth=4
        set tabstop=4
        set softtabstop=4               " Tab key indents by 4 spaces.

    set backspace =indent,eol,start " Make backspace work as you would expect
    set hidden                      " Switch between buffers without having to sove first
    set laststatus=2                " Alwayse show statusline.
    set display =lastline           " Show as much as possible of the last line.

    " show
        set showmode                    " Show current mode in command-line
        set showcmd                     " Show already typed keys when more are expected

    " highlight set
        set incsearch                   " Hightlight while searching with / or ?.
        set nohlsearch                    " disable matches highlightes by default
        set synmaxcol=2000             " Only hightlight the limited column

    " edrawing
        set ttyfast                     " Faster redrawing.
        set lazyredraw                  " Only redraw when necessary

    " split
        set splitbelow                  " Open new windows below the current window
        set splitright                  " Open new windows right of the current window

    " use gui color
        set termguicolors

    set number     " let line number visuable
    set cursorline " Finde the current line quickly.
    set wrapscan   " Searches warp around end-if-file
    set report=0   " Alwayse report changed lines.

    " font (for gui)
    " 中文测试
        set guifont=Hack_Nerd_Font_Mono:h12,DroidSansMono_Nerd_Font_Mono:h12

    " coding
        set encoding=utf-8
        set termencoding=utf-8
        set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1

    set textwidth=0 " forbid auto change line

    " only cancel the code, the inverse search of LaTeX with MacVim can work well
    " if empty(v:servername) && exists('*remote_startserver')
    "     call remote_startserver('VIM')
    " endif

" --------------------------------------------------------------------------------

" for macvim
    if has('gui')
        set macmeta " let meta key works well
    endif

" ================================================================================ (80 个 '-')

" vim-plug
    " plug manage
        call plug#begin('~/.vim/plugged')
            " should be loaded earlier
                " auto align
                    Plug 'godlygeek/tabular'

            " language specific
                " LaTeX
                    Plug 'lervag/vimtex', {'for':'tex'}
                " markdown
                    Plug 'plasticboy/vim-markdown', {'for':'markdown'}
                    Plug 'iamcco/mathjax-support-for-mkdp', {'for':'markdown'}
                    Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install', 'for': ['markdown', 'vim-plug'] }
                " fortran
                    Plug 'rudrab/vimf90', {'for':'fortran'}
                " c/c++
                    " enhanced highlight
                        Plug 'octol/vim-cpp-enhanced-highlight', {'for':'c'}

            " used generally
                " file tree browse
                    " main plugin
                        if has('nvim')
                            Plug 'Shougo/defx.nvim', { 'do': ':UpdateRemotePlugins' }
                            Plug 'roxma/nvim-yarp'
                            Plug 'roxma/vim-hug-neovim-rpc'
                        else
                            Plug 'Shougo/defx.nvim'
                            Plug 'roxma/nvim-yarp'
                            Plug 'roxma/vim-hug-neovim-rpc'
                        endif
                    " icon supoort
                        Plug 'ryanoasis/vim-devicons'
                        Plug 'kristijanhusak/defx-icons'
                    " git support
                        Plug 'kristijanhusak/defx-git'
                " shortcut management
                    Plug 'liuchengxu/vim-which-key'
                " search
                    Plug 'Yggdroot/LeaderF', { 'do': '.\install.sh' }
                " power status line
                    Plug 'vim-airline/vim-airline'
                    Plug 'vim-airline/vim-airline-themes'
                " rainbow parentheses
                    Plug 'luochen1990/rainbow'
                " indent line
                    Plug 'Yggdroot/indentLine'
                " mark trailing whitespace
                    Plug 'ntpeters/vim-better-whitespace'
                " autocomplete
                    Plug 'neoclide/coc.nvim', {'branch': 'release'}
                " snippet
                    Plug 'sirver/ultisnips'
                " autocomplete parenthesis
                    Plug 'Raimondi/delimitMate'
                " multiple-cursors
                    Plug 'mg979/vim-visual-multi',{'for':''}
                " syntax check
                    Plug 'dense-analysis/ale'
                " faster notation
                    Plug 'tpope/vim-commentary'
                " surround
                    Plug 'tpope/vim-surround'
                " faster fold
                    Plug 'Konfekt/FastFold'
                " auto-save
                    Plug '907th/vim-auto-save'
                " auto-update tags
                    Plug 'ludovicchabant/vim-gutentags'
                " run shell commands in background
                    Plug 'skywind3000/asyncrun.vim'
                " git wrapper
                    Plug 'tpope/vim-fugitive'
                " Show a diff using Vim its sign column
                    Plug 'mhinz/vim-signify'
                " text object
                    " create your own
                        Plug 'kana/vim-textobj-user'
                    " some pre-defined text object
                        Plug 'kana/vim-textobj-entire'
                        Plug 'kana/vim-textobj-fold'
                        Plug 'kana/vim-textobj-function',{'for':''}
                        Plug 'kana/vim-textobj-indent'
                        Plug 'kana/vim-textobj-line'
                        Plug 'kana/vim-textobj-syntax'
                " some useful key map of vim
                    Plug 'tpope/vim-unimpaired'
                " switch the input way (for MacOS)
                    if has('mac')
                        Plug 'lyokha/vim-xkbswitch',{'for':''}
                    endif

            " Theme
                Plug 'rakr/vim-one'
                Plug 'hzchirs/vim-material'
                Plug 'ayu-theme/ayu-vim'
                Plug 'kaicataldo/material.vim', {'for':''}
                Plug 'sainnhe/lightline_foobar.vim',{'for':''}
                Plug 'itchyny/lightline.vim',{'for':''}
        call plug#end()

    " key map ('p' means 'plug')
        " clean plug
            nnoremap <Leader>pc <ESC>:PlugClean<CR>
        " install and uninstall plug
            nnoremap <Leader>pi <ESC>:PlugInstall<CR>
        " update plug
            nnoremap <Leader>pu <ESC>:PlugUpdate<Space>
        " update vim-plug itself
            nnoremap <Leader>pU <ESC>:PlugUpgrade<CR>
        " check status of plug
            nnoremap <Leader>ps <ESC>:PlugStatus<CR>

" theme related (this should be put at the first, otherwise some fine tuning of other plugin shouldn't word)
    " set theme
        set background=light
        colorscheme one
        let g:airline_theme = 'one'
        " set termguicolors
        " let ayucolor='light'
        " colorscheme ayu
        " colorscheme vim-material
        " let g:material_terminal_italics = 1
        " let g:material_theme_style = 'lighter'
        " colorscheme material
        " let g:airline_theme='material'
    " some fine tuning
        " background of current line
            highlight CursorLine guibg=#eeeeee
        " color of search highlight
            highlight Search guibg=#afffaf guifg=#00af5f gui=bold
            highlight IncSearch guibg=#FFDBB0 guifg=#ff5f00 gui=bold
        " text color of pup menu
            highlight Pmenu guibg=#e0eef7 guifg=#686e72
            highlight PmenuSel guibg=#b9c7d2 guifg=#5d6172 gui=bold 
        " color of pup namu's scroll bar and thumb
            highlight PmenuSbar guibg=#dae3f6
            highlight PmenuThumb guibg=#6c727b
    " for nvim
        " if has('nvim')
        "     highlight NormalNC guibg = '#dddddd'
        "     highlight MsgArea guibg = '#c8c1a1'
        " endif

" --------------------------------------------------------------------------------

" which key map
    " let g:mapleader = ","
    " appearance (set the appearance at '~/.vim/syntax/which_key.vim')
    " time befor pup jump out
        set timeoutlen=800
    " hint key map
        nnoremap <silent> <Leader>k :WhichKey '#KeyHint#'<CR>
        xnoremap <silent> <Leader>k :WhichKeyVisual '#KeyHint#'<CR>

    " build dictionary
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


    " basic dic define (use '{}' to represent a group)
        " main page
            let g:which_key_map = {
                \ 'l': [':WhichKey "\\"', '{leader}'],
                \ 'a': [':WhichKey "a"', '{text object V1}'],
                \ 'g': [':WhichKey "g"', '{go to}'],
                \ 'i': [':WhichKey "i"', '{text object V2}'],
                \ 'z': [':WhichKey "z"', '{fold}'],
                \ 'S': [':WhichKey! g:which_key_map_Surround', '{vim-surround}'],
                \ 'T': [':WhichKey! g:vim_default_textobj', '{default text object}'],
                \ 'H': [':e ~/.vim/syntax/which_key.vim', 'edit vim-which-key highlight'],
                \ '[': [':WhichKey "["', "{set on; jump back}"],
                \ ']': [':WhichKey "]"', "{set off; jump next}"],
                \ '<': [':WhichKey "<"', "{paste; dcrease indent}"],
                \ '>': [':WhichKey ">"', "{paste; increase indent}"],
                \ '=': [':WhichKey "="', "{paste; keep indent}"],
                \ ',': [':WhichKey ","', "{local leader}"],
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

            let g:which_key_map_z = {
                \ 'R': [':normal! zR', 'unfold all'],
                \ 'r': [':normal! zr', 'unfold once'],
                \ 'M': [':normal! zM', 'fold all'],
                \ 'm': [':normal! zm', 'fold once'],
                \ }

            let g:which_key_map_g.x = 'open link'

        " key hint for vim-plug
            let g:which_key_map_Leader.p = {
                \ 'name': '{plug manage}',
                \ 'i': 'install plugs',
                \ 'I': 'uninstall plugs',
                \ 'u': 'update plugs',
                \ 'U': 'update vim-plug itself',
                \ 's': 'check status',
                \ }

" --------------------------------------------------------------------------------

" fugitive
    nnoremap <leader>gs <ESC>:Gstatus<CR>
    let g:which_key_map_Leader.g = {'name' : '{git}',}
    let g:which_key_map_Leader.g.s = ':Gstatus'

" asyncrun
    nnoremap <leader>ar <ESC>:AsyncRun<space>
    nnoremap <leader>aR <ESC>:AsyncRun!<space>
    nnoremap <leader>as <ESC>:AsyncStop<CR>
    let g:which_key_map_Leader.a = {
        \ 'name' : '{asyncrun}',
        \ 'r' : ':AsyncRun',
        \ 'R' : ':AsyncRun!',
        \ 's' : ':AsyncStop',
        \ }

" --------------------------------------------------------------------------------

" text object related (just list the text object which weren't included in the default text object)
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
        let which_key_map_a['l'] = 'current line (no leading char)' " which means the spaces in the start will be ignored
        let which_key_map_i['l'] = 'current line (no end char)' " which means the change line symbol '\n' won't be selected
    " textobj-syntax
        let which_key_map_a['y'] = 'syntax highlighted item'
        let which_key_map_i['y'] = 'syntax highlighted item (whith space)'

" --------------------------------------------------------------------------------

" vim-surround (just record the cmd that wasn't included at the default text object)
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

" --------------------------------------------------------------------------------

" vim-unimpaired
    " left square bracket
        " ex-command. if a count is given, it becomes an argument to the command
            " file related
                let g:which_key_map_LeftSqureBracket['a'] = ':previous'  " edit [count] previous file
                let g:which_key_map_LeftSqureBracket['A'] = ':first'     " start editing the first file in the argumet list
            " buffer related
                let g:which_key_map_LeftSqureBracket['b'] = ':bprevious' " go to [N]th (default 1) previous buffer in buffer list
                let g:which_key_map_LeftSqureBracket['B'] = ':bfirst'    " go to first buffer in buffer list
            " error list related
                let g:which_key_map_LeftSqureBracket['l'] = ':lprevious'  " display the [count] previous error in the list
                let g:which_key_map_LeftSqureBracket['L'] = ':lfirst'     " diaplay error [nr]. if [nr] omitted, the first error is diaplayed
                let g:which_key_map_LeftSqureBracket['<C-L>'] = ':lpfile' " display the last error in the [count] previous file in the list that includes a file name.
                let g:which_key_map_LeftSqureBracket['q'] = ':cprevious'  " 'q' means 'quickfix', similar to ':lprevious'
                let g:which_key_map_LeftSqureBracket['Q'] = ':cfirst'     " 'q' means 'quickfix', similar to ':lfirst'
                let g:which_key_map_LeftSqureBracket['<C-Q>'] = ':cpfile' " 'q' means 'quickfix', similar to ':lpfile'
            " tag related
                let g:which_key_map_LeftSqureBracket['t'] = ':tprevious'      " tag previous
                let g:which_key_map_LeftSqureBracket['T'] = ':tfirst'         " tag first
                let g:which_key_map_LeftSqureBracket['<C-T>'] = ':ptprevious' " similar to 'tprevious', but in window
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

    " right square bracket
        " ex-command. if a count is given, it becomes an argument to the command
            " file related
                let g:which_key_map_RightSqureBracket['a'] = ':next' " edit [count] next file
                let g:which_key_map_RightSqureBracket['A'] = ':last' " start editing the last file in the argumet list
            " buffer related
                let g:which_key_map_RightSqureBracket['b'] = ':bnext' " go to [N]th (default 1) next buffer in buffer list
                let g:which_key_map_RightSqureBracket['B'] = ':blast' " go to last buffer in buffer list
            " error list related
                let g:which_key_map_RightSqureBracket['l'] = ':lnext'      " display the [count] next error in the list
                let g:which_key_map_RightSqureBracket['L'] = ':llast'      " diaplay error [nr]. if [nr] omitted, the last error is diaplayed
                let g:which_key_map_RightSqureBracket['<C-L>'] = ':lnfile' " display the first error in the [count] next file in the list that includes a file name.
                let g:which_key_map_RightSqureBracket['q'] = ':cnext'      " 'q' means 'quickfix', similar to ':lnext'
                let g:which_key_map_RightSqureBracket['Q'] = ':clast'      " 'q' means 'quickfix', similar to ':llast'
                let g:which_key_map_RightSqureBracket['<C-Q>'] = ':cnfile' " 'q' means 'quickfix', similar to ':lnfile'
            " tag related
                let g:which_key_map_RightSqureBracket['t'] = ':tnext'      " tag previous
                let g:which_key_map_RightSqureBracket['T'] = ':tlast'      " tag first
                let g:which_key_map_RightSqureBracket['<C-T>'] = ':ptnext' " similar to 'tprevious', but in window
        " paste below
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

    " left angle
        let which_key_map_LeftAngle['p'] = 'paste after & increase indent'
        let which_key_map_LeftAngle['P'] = 'paste before & increase indent'
    " right angle
        let which_key_map_RightAngle['p'] = 'paste after & increase indent'
        let which_key_map_RightAngle['P'] = 'paste before & increase indent'
    " equal
        let which_key_map_Equal['p'] = 'paste after & re-indent'
        let which_key_map_Equal['P'] = 'paster before & re-indent'

" --------------------------------------------------------------------------------

" gutentags
    " name of the tags file
        set tags=./.tags;,.tags
    " gutentags 搜索工程目录的标志，碰到这些文件/目录名就停止向上一级目录递归
        let g:gutentags_project_root = ['.root', '.svn', '.git', '.hg', '.project']
    " 所生成的数据文件的名称
        let g:gutentags_ctags_tagfile = '.tags'
    " 将自动生成的 tags 文件全部放入 ~/.cache/tags 目录中，避免污染工程目录
        let s:vim_tags = expand('~/.cache/tags')
        let g:gutentags_cache_dir = s:vim_tags
    " 检测 ~/.cache/tags 不存在就新建
        if !isdirectory(s:vim_tags)
            silent! call mkdir(s:vim_tags, 'p')
        endif

" --------------------------------------------------------------------------------

" asyncrun
    " auto open quickfix window with hight 15 (or other hight)
        let g:asyncrun_open = 15
    " open/close quickfix window
        nnoremap <F10> :call asyncrun#quickfix_toggle(15)<CR>

" --------------------------------------------------------------------------------

" godlygeek/tabular
    " 't' means 'trim', or 'tabular'
    " Some common used delimiter. Here 't' is right, 'T' is center
        " &
            noremap <leader>t& :Tabularize<Space>/&<CR>
            noremap <leader>T& :Tabularize<Space>/&/c1<CR>
        " |
            noremap <leader>t<BAR> :Tabularize<Space>/<BAR><CR>
            noremap <leader>T<BAR> :Tabularize<Space>/<BAR>/c1<CR>
        " #
            noremap <leader>t# :Tabularize<Space>/#<CR>
            noremap <leader>T# :Tabularize<Space>/#/c1<CR>
        " =
            noremap <leader>t= :Tabularize<Space>/=<CR>
            noremap <leader>T= :Tabularize<Space>/=/c1<CR>
        " \\
            noremap <leader>t\ :Tabularize<Space>/\\\\<CR>
            noremap <leader>T\ :Tabularize<Space>/\\\\/c1<CR>
        " %
            noremap <leader>t% :Tabularize<Space>/%<CR>
            noremap <leader>T% :Tabularize<Space>/%/c1<CR>
        " :
            noremap <leader>t: :Tabularize<Space>/:<CR>
            noremap <leader>T: :Tabularize<Space>/:/c1<CR>
        " ,
            noremap <leader>t, :Tabularize<Space>/,<CR>
            noremap <leader>T, :Tabularize<Space>/,/c1<CR>
        " "
            noremap <leader>t" :Tabularize<Space>/"<CR>
            noremap <leader>T" :Tabularize<Space>/"/c1<CR>

    " most general command
        noremap <leader>ta :Tabularize<Space>/
    " repeat previous behavior
        noremap <leader>TA :Tabularize<Space><CR>

    " key map manage
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
            \ 'A': 'use last trim cmd',}

" --------------------------------------------------------------------------------

" auto-save
    let g:auto_save = 1  " enable AutoSave on Vim startup
    let g:auto_save_silent = 1  " do not display the auto-save notification
    " let g:auto_save_events = ["CursorHold", "TextChanged", "InsertLeave"]
    let g:auto_save_events = ["CursorHold"]
    let g:auto_save_write_all_buffers = 1  " write all open buffers as if you would use :wa
    set updatetime=1000 " default: 4000 (seems useless?)

" --------------------------------------------------------------------------------

" fast folding
    set sessionoptions-=folds
    let g:fastfold_savehook = 1
    let g:fastfold_fold_command_suffixes =  ['x','X','a','A','o','O','c','C']
    let g:fastfold_fold_movement_commands = [']z', '[z', 'zj', 'zk']

    " update fold info
        nmap zuz <Plug>(FastFoldUpdate)

    set foldmethod=indent " set 'indent' as default behavior

" --------------------------------------------------------------------------------

" delimitMate related
    " forbid auto-delete pair parenthesis
        inoremap <BS> <BS>
    " jump out form a delimiter
        imap <M-Tab> <Plug>delimitMateS-Tab

" --------------------------------------------------------------------------------

" ultisnips related
    " Expand
        let g:UltiSnipsExpandTrigger = '<tab>'
    " Jump Forward
        let g:UltiSnipsJumpForwardTrigger ='<M-j>'
    " Jump Backword
        let g:UltiSnipsJumpBackwardTrigger = '<M-k>'
    " List Snippets
        let g:UltiSnipsListSnippets='<c-e>'
    " Python version used
        let g:UltiSnipsUsePythonVersion=3
    " Split way of edic snippets file
        let g:UltiSnipsEditSplit ="vertical"
    " snippets file dirctory
        let g:UltiSnipsSnippetDirectories = [$HOME.'/.vim/UltiSnips']
        let g:UltiSnipsSnippetDir = [$HOME.'/.vim/UltiSnips']
    " check the snippet setting
        nnoremap <C-M-s> <C-u>:UltiSnipsEdit<CR>

" --------------------------------------------------------------------------------

" indentline related
    let g:indentLine_char_list = ['|', '¦', '┆', '┊']

" --------------------------------------------------------------------------------

" rainbow parentheses related
    let g:rainbow_active = 1 "0 if you want to enable it later via :RainbowToggle
	" \	'ctermfgs': ['#ff00ff', '#0000ff', '#3CCB3E', '#FDA428', '#FB4E1E', '#A53134', '#FCD32C'],
    let g:rainbow_conf = {
   	\	'guifgs': ['Magenta', 'Blue', 'LimeGreen', 'Orange', 'OrangeRed', 'Brown', 'Gold'],
	\	'operators': '_,_',
	\	'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/{/ end=/}/ fold'],
	\   'separately': {
	\		'*': {},
	\		'tex': {
	\	        'parentheses': [ 'start=/(/ end=/)/', 'start=/\[/ end=/\]/', 'start=/{/ end=/}/'],
	\		},
	\		'lisp': {
	\			'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick', 'darkorchid3'],
	\		},
	\		'vim': {
	\			'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/', 'start=/{/ end=/}/ fold', 'start=/(/ end=/)/ containedin=vimFuncBody', 'start=/\[/ end=/\]/ containedin=vimFuncBody', 'start=/{/ end=/}/ fold containedin=vimFuncBody'],
	\		},
	\		'html': {
	\			'parentheses': ['start=/\v\<((area|base|br|col|embed|hr|img|input|keygen|link|menuitem|meta|param|source|track|wbr)[ >])@!\z([-_:a-zA-Z0-9]+)(\s+[-_:a-zA-Z0-9]+(\=("[^"]*"|'."'".'[^'."'".']*'."'".'|[^ '."'".'"><=`]*))?)*\>/ end=#</\z1># fold'],
	\		},
	\		'css': 0,
	\	}
	\}

" --------------------------------------------------------------------------------

" vim-better-whitespace
    " appearance
        let g:better_whitespace_guicolor = "#ffafd7"
    " delete trailing space (since <F12> is close to <DEL>)
        nnoremap <F12> <ESC>:StripWhitespace<CR>
        inoremap <F12> <ESC>:StripWhitespace<CR>a

" --------------------------------------------------------------------------------

" defx (file tree) related
    " Avoid the white space highting issue
        autocmd FileType defx match ExtraWhitespace /^^/

    " key map (in file tree mode)
        autocmd FileType defx call s:defx_my_settings()
        function! s:defx_my_settings() abort
            " Define mappings
            nnoremap <silent><buffer><expr> <CR>
            \ defx#do_action('drop')
            nnoremap <silent><buffer><expr> c
            \ defx#do_action('copy')
            nnoremap <silent><buffer><expr> m
            \ defx#do_action('move')
            nnoremap <silent><buffer><expr> p
            \ defx#do_action('paste')
            nnoremap <silent><buffer><expr> l
            \ defx#do_action('open')
            nnoremap <silent><buffer><expr> E
            \ defx#do_action('open', 'vsplit')
            nnoremap <silent><buffer><expr> P
            \ defx#do_action('open', 'pedit')
            nnoremap <silent><buffer><expr> o
            \ defx#do_action('open_or_close_tree')
            nnoremap <silent><buffer><expr> K
            \ defx#do_action('new_directory')
            nnoremap <silent><buffer><expr> N
            \ defx#do_action('new_file')
            nnoremap <silent><buffer><expr> M
            \ defx#do_action('new_multiple_files')
            nnoremap <silent><buffer><expr> C
            \ defx#do_action('toggle_columns',
            \                'mark:indent:icon:filename:type:size:time')
            nnoremap <silent><buffer><expr> S
            \ defx#do_action('toggle_sort', 'time')
            nnoremap <silent><buffer><expr> d
            \ defx#do_action('remove_trash')
            nnoremap <silent><buffer><expr> r
            \ defx#do_action('rename')
            nnoremap <silent><buffer><expr> !
            \ defx#do_action('execute_command')
            nnoremap <silent><buffer><expr> x
            \ defx#do_action('execute_system')
            nnoremap <silent><buffer><expr> yy
            \ defx#do_action('yank_path')
            nnoremap <silent><buffer><expr> .
            \ defx#do_action('toggle_ignored_files')
            nnoremap <silent><buffer><expr> ;
            \ defx#do_action('repeat')
            nnoremap <silent><buffer><expr> h
            \ defx#do_action('cd', ['..']) " jump to upper path
            nnoremap <silent><buffer><expr> ~
            \ defx#do_action('cd') " jump to user path
            nnoremap <silent><buffer><expr> q
            \ defx#do_action('quit')
            nnoremap <silent><buffer><expr> <Space>
            \ defx#do_action('toggle_select') . 'j'
            nnoremap <silent><buffer><expr> *
            \ defx#do_action('toggle_select_all')
            nnoremap <silent><buffer><expr> j
            \ line('.') == line('$') ? 'gg' : 'j'
            nnoremap <silent><buffer><expr> k
            \ line('.') == 1 ? 'G' : 'k'
            nnoremap <silent><buffer><expr> <C-l>
            \ defx#do_action('redraw')
            nnoremap <silent><buffer><expr> <C-g>
            \ defx#do_action('print')
            nnoremap <silent><buffer><expr> cd
            \ defx#do_action('change_vim_cwd')
        endfunction

    " for git
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

    " appearance
        let g:defx_icons_enable_syntax_highlight = 1

        call defx#custom#column('icon', {
            \ 'directory_icon': '▸',
            \ 'opened_icon': '▾',
            \ 'root_icon': ' ',
            \ })

        call defx#custom#column('filename', {
            \ 'min_width': 35,
            \ 'max_width': 45,
            \ })

        call defx#custom#column('mark', {
            \ 'readonly_icon': '✗',
            \ 'selected_icon': '✓',
            \ })


        call defx#custom#option('_', {
            \ 'winwidth':32,
            \ 'split': 'vertical',
            \ 'direction': 'topleft',
            \ 'show_ignored_files': 1,
            \ 'buffer_name': 'FileTree',
            \ 'toggle': 1,
            \ 'resume': 1,
            \ 'columns': 'mark:indent:git:icon:icons:filename:type'
            \ })


    " key map
        inoremap <C-M-b> <ESC>:Defx `expand('%:p:h')` <CR>
        noremap <C-M-b> :Defx `expand('%:p:h')`<CR>

" --------------------------------------------------------------------------------

" multicursor
    " let g:VM_leader="\\"
    " nmap <M-RightMouse>  <Plug>(VM-Mouse-Word)
    " nmap <M-C-LeftMouse> <Plug>(VM-Mouse-Column)
    " nmap <M-LeftMouse>   <Plug>(VM-Mouse-Cursor)

" --------------------------------------------------------------------------------

" LeaderF
    " unknown function
        let g:Lf_ShowHidden = 1

    " chache related
        let g:Lf_UseCache = 1    " After Vin starts, it will refresh the cache at the first time LeaderF starts (first times after lunching will be slower)
        let g:Lf_UseMemoryCache = 1     " Always refresh LeaderF if it was lunched (alwayse be solwer)
        let g:LfNeedCacheTime = 0 " wait time before use cache

    " diaplay style
        let g:Lf_WindowPosition = 'popup' " Popup Mode is to open LeaderF in a popup, To enable popup mode
        let g:Lf_PreviewInPopup = 1 " also preview the result in a popup window.

        " Lf_hl_popup_inputText is the wincolor of input window
            highlight Lf_hl_popup_inputText guifg=#525252 guibg=#f4f3d7
        " Lf_hl_popup_window is the wincolor of content window
            highlight Lf_hl_popup_window guifg=#6c6b65 guibg=#fffde8
        " the color of the cursorline
            highlight Lf_hl_cursorline guifg=#9849ff guibg=NONE gui=bold 

    " key map
        " history command ('c' means 'command')
            nnoremap <Leader>sc <ESC>:LeaderfHistoryCmd<CR>
        " search code in current buffer file ('f' mans 'file')
            nnoremap <Leader>sf <ESC>:LeaderfLine<CR>
            nnoremap <F11> <ESC>:LeaderfLine<CR>
        " search code in all buffer (capital letter means search all)
            nnoremap <Leader>sF <ESC>:LeaderfLineAll<CR>
        " search help document of vim
            nnoremap <Leader>sh <ESC>:LeaderfHelp<CR>
        " search function in current buffer ('m' means 'map', since function is just a map)
            nnoremap <Leader>sm <ESC>:LeaderfFunction<CR>
        " search function in all listed buffers
            nnoremap <Leader>sM <ESC>:LeaderfFunctionAll<CR>
        " recent opened file in current working directory ('r' means 'recent')
            nnoremap <Leader>sr <ESC>:LeaderfMruCwd<CR>
        " recent opened file
            nnoremap <Leader>sR <ESC>:LeaderfMru<CR>
        " history search ('s' means 'search')
            nnoremap <Leader>ss <ESC>:LeaderfHistorySearch<CR>
        " search tags in current buffer
            nnoremap <Leader>st <ESC>:LeaderfBufTag<CR>
        " search tags
            nnoremap <Leader>sT <ESC>:LeaderfTag<CR>
    " key map management
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

" --------------------------------------------------------------------------------

" ALE related
    " Set this. Airline will handle the rest.
        let g:airline#extensions#ale#enabled = 1 " let airline work well with ALE
        let g:ale_sign_column_always = 1 "始终开启标志列
        let g:ale_change_sign_column_color = 1 " set different highlights for the sign column itself
        let g:ale_sign_highlight_linenrs = 1 " allowed highlight of line number
        let g:ale_lint_on_text_changed = 'normal' " 'normal' check buffers if text changed (both normal and insert)

    " error, warning and info
        let ale_sign_error = '✗'
        highlight ALEError gui=undercurl guisp=#ff0000 guibg=#87d7ff
        highlight ALEErrorSign guifg=#ff0000
        " seems useless for vim, but the help said noevim was supported    highlight ALEErrorSignLineNr guifg=#ff0000
        let ale_sign_warning = '⚡'
        highlight ALEWarning gui=undercurl guisp=#5f87ff guibg=#ffd787
        highlight ALEWarningSign guifg=#ff8700
        " seems useless for vim, but the help said noevim was supported    highlight ALEWarningSignLineNr guibg=#ffaf00
        let ale_sign_info = '?'
        highlight ALEInfo gui=bold guifg=#00d700
        highlight ALEInfoSign gui=undercurl guisp=#ff8700 guibg=#5fff5f
        " seems useless for vim, but the help said noevim was supported    highlight ALEInfoSignLineNr guifg=#00d700

    " key map
        " previous
            nmap <silent> <M-k> <Plug>(ale_previous_wrap)
        " next
            nmap <silent> <M-j> <Plug>(ale_next_wrap)
        " toggle and detail
            nnoremap <Leader>et :ALEToggle<CR>
            nnoremap <Leader>ed :ALEDetail<CR>
            let g:which_key_map_Leader.e = {
                \ 'name': '{ALE}',
                \ 't': 'toggle',
                \ 'd': 'detail',
                \ }

    " linter choose
        let g:ale_linters = {
        \   'cpp': ['clang', 'gcc'],
        \   'c': ['clang', 'gcc'],
        \   'python': ['pylint'],
        \   'fortran' : ['gfortran']
        \}

" --------------------------------------------------------------------------------

" coc.nvim
    " if hidden is not set, TextEdit might fail.
        set hidden
    " Some servers have issues with backup files, see #649
        set nobackup
        set nowritebackup
    " control the height of the command input
        set cmdheight=1
    " You will have bad experience for diagnostic messages when it's default 4000.
        set updatetime=300
    " don't give |ins-completion-menu| messages.
        set shortmess+=c
    " always show signcolumns
        set signcolumn=yes
    " background of current words
        highlight CocHighlightText guibg=#cfe3ff

    " use with 'vim-airline'
        " Change error symbol:
            let airline#extensions#coc#error_symbol = 'Error:'
        " Change warning symbol:
            let airline#extensions#coc#warning_symbol = 'Warning:'
        " Change error format:
            let airline#extensions#coc#stl_format_err = '%E{[%e(#%fe)]}'
        " Change warning format:
            let airline#extensions#coc#stl_format_warn = '%W{[%w(#%fw)]}'

    " key map
        let g:which_key_map_coc = {'name': '{coc.nvim}'} " to record the key map of coc.nvim

        " Use <c-space> to trigger completion.
            inoremap <silent><expr> <c-space> coc#refresh()
        " coc command
            nnoremap <leader>cm <ESC>:CocCommand<Space>
            let g:which_key_map_coc.m = 'coc command'
        " Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
        " Coc only does snippet and additional edit on confirm.
            inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

        " Use K to show documentation in preview window
            nnoremap <silent> K :call <SID>show_documentation()<CR>
            function! s:show_documentation()
                if (index(['vim','help'], &filetype) >= 0)
                   execute 'h '.expand('<cword>')
                else
                    call CocAction('doHover')
                endif
            endfunction

        " Create mappings for function text object, requires document symbols feature of languageserver.
            xmap if <Plug>(coc-funcobj-i)
            xmap af <Plug>(coc-funcobj-a)
            omap if <Plug>(coc-funcobj-i)
            omap af <Plug>(coc-funcobj-a)
            let g:which_key_map_a.f = 'function'
            let g:which_key_map_i.f = 'function'

        " Remap keys for gotos
            nmap <silent> gd <Plug>(coc-definition)
            nmap <silent> gy <Plug>(coc-type-definition)
            nmap <silent> gi <Plug>(coc-implementation)
            nmap <silent> gr <Plug>(coc-references)
            let g:which_key_map_coc_goto = {
                \ 'd': 'definition',
                \ 'y': 'type definition',
                \ 'i': 'implementation',
                \ 'r': 'references',
                \ }
            let g:which_key_map_g['name'] = 'go to'
            call extend(g:which_key_map_g, g:which_key_map_coc_goto)

        " Use `[g` and `]g` to navigate diagnostics
            nmap <silent> [g <Plug>(coc-diagnostic-prev)
            nmap <silent> ]g <Plug>(coc-diagnostic-next)
            let g:which_key_map_LeftSqureBracket.g = 'coc: previous diagnostic'
            let g:which_key_map_RightSqureBracket.g = 'coc: next diagnostic'

        " Use <TAB> for select selections ranges, needs server support, like: coc-tsserver, coc-python
        " since the map is in the normal mode, it won't infect the expand of snippet
            nmap <silent> <TAB> <Plug>(coc-range-select)
            xmap <silent> <TAB> <Plug>(coc-range-select)

        " pick color ('c' means 'coc'; the second 'c' means 'color')
            nnoremap <Leader>cc :call CocAction('pickColor')<CR>
            let g:which_key_map_coc.c = 'pick color'
        " open configure .json file ('j' means 'json')
            nnoremap <Leader>cj :CocConfig<CR>
            let g:which_key_map_coc.j = 'edit json file'
        " check diagnostic ('d' means 'diagnostic')
            nnoremap <Leader>cd :CocList diagnostic<CR>
            let g:which_key_map_coc.d = 'coc diagnostic'

        " extension manage ('e' means 'extension')
            " list extensions ('l' means list)
                nnoremap <Leader>cel :CocList extensions<CR>
            " install extension ('i' means 'install')
                nnoremap <Leader>cei :CocInstall<Space>
            " uninstall extensions ('u' means 'uninstall')
                nnoremap <Leader>ceu :CocUninstall<Space>

            " key map manage
                let g:which_key_map_coc.e = {
                    \ 'l': 'list extensions',
                    \ 'i': 'install extensions',
                    \ 'u': 'uninstall extensions',
                    \ }

            " add dic g:which_key_map_coc to dic g:which_key_map_Leader.c
                let g:which_key_map_Leader.c = {'name': '{coc.nvim}', }
                call extend(g:which_key_map_Leader.c, g:which_key_map_coc)

        " multicursor
            " highlight form
                hi CocCursorRange guibg=#d1c3ff guifg=#595273 gui=bold
            " key map
                " add current character cursor to multi-cursors
                    nmap <M-LeftMouse>  <Plug>(coc-cursors-position)
                    nmap <Leader><Leader> <Plug>(coc-cursors-position)
                    let g:which_key_map_Leader['\'] = 'add multicursor'
                " add current visual selected range to cursors
                    xmap <silent> <Leader><Leader> <Plug>(coc-cursors-range)
                " add current word range to cursors
                    " add current words ('m' means 'multi')
                        nmap <M-RightMouse> <Plug>(coc-cursors-word)
                        nmap <Leader>m <Plug>(coc-cursors-word)
                        let g:which_key_map_Leader.m = 'add current words to multicursor'
                    " add and jump to next same words (since the behavior like normal command 'n', so use key 'n')
                        nmap <Leader>n <Plug>(coc-cursors-word)*
                        let g:which_key_map_Leader.n = 'add word to multicursor and jump next'
                    " add and jump to previous same words
                        nmap <Leader>N <Plug>(coc-cursors-word)#
                        let g:which_key_map_Leader.N = 'add word to multicursor and jump previous'
                " add all the same ('a' mean 'all')
                    nnoremap <Leader>Ma :CocCommand document.renameCurrentWord<CR>
                    let g:which_key_map_Leader.M = {'name': '{multicursor}',}
                    let g:which_key_map_Leader.M.a = 'add all same words to multicursor'
                " use operator for add range to cursors. Use normal command like `<leader>xi(` ('t' means 'text object')
                    nmap <leader>Mt <Plug>(coc-cursors-operator)
                    let g:which_key_map_Leader.M.t = 'add textobj to multicursor'

        " coc list
            nnoremap <Leader>cl <ESC>:CocList<CR>
            nnoremap <Leader>Sb <ESC>:CocList buffer<CR>
            nnoremap <Leader>Sc <ESC>:CocList cmdhistory<CR>
            nnoremap <Leader>Se <ESC>:CocList extensions<CR>
            nnoremap <Leader>Sf <ESC>:CocList file<CR>
            nnoremap <Leader>Sg <ESC>:CocList grep<CR>
            nnoremap <Leader>Sh <ESC>:CocList help<CR>
            nnoremap <Leader>Sk <ESC>:CocList marks<CR>
            nnoremap <Leader>Sl <ESC>:CocList line<CR>
            nnoremap <Leader>Sm <ESC>:CocList maps<CR>
            nnoremap <Leader>So <ESC>:CocList outline<CR>
            nnoremap <Leader>Sp <ESC>:CocList output<CR>
            nnoremap <Leader>Sq <ESC>:CocList quickfix<CR>
            nnoremap <Leader>Sr <ESC>:CocList mru<CR>
            nnoremap <Leader>Ss <ESC>:CocList servers<CR>
            nnoremap <Leader>St <ESC>:CocList tags<CR>
            nnoremap <Leader>Sv <ESC>:CocList vimcommands<CR>

            " key map manage
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

" --------------------------------------------------------------------------------

" general key mapping
    " local leader (local leader is used in plug such as 'vimtex')
        let g:maplocalleader = ','
    " move
        noremap j gj
        noremap k gk
        noremap gj j
        noremap gk k
        let g:which_key_map_g.j = 'next actual line'
        let g:which_key_map_g.k = 'previous actual line'
    " faster move
        noremap <C-j> 5j
        noremap <C-k> 5k
    " check the global setting
        nnoremap <Leader>C <ESC>:e ~/.vim/vimrc<CR>
        let g:which_key_map_Leader.C = 'open vimrc'
    " open current file at new tab
        nnoremap <C-M-t> <ESC>:tabnew<SPACE>%<CR>
    " go to next/previous buffer file
        nnoremap <C-M-k> <ESC>:bp<CR>
        nnoremap <C-M-j> <ESC>:bn<CR>
    " go to next/previous tab
        nnoremap <C-M-h> <ESC>:tabp<CR>
        nnoremap <C-M-l> <ESC>:tabn<CR>
    " change spitted window
        nnoremap <S-M-h> <ESC><C-w>h
        nnoremap <S-M-l> <ESC><C-w>l
        nnoremap <S-M-k> <ESC><C-w>k
        nnoremap <S-M-j> <ESC><C-w>j
    " create new file at the current path of the current buffer
        nnoremap <C-M-n> <ESC>:e %:p:h/

    " close or quit
        " close the current file in buffer (which means 'buffer wipe out')
            nnoremap <Leader>q <ESC>:bwipeout<CR>
            let g:which_key_map_Leader.q = 'wipe current buffer'
        " quit Vim (which means 'quit all')
            nnoremap <Leader>Q <ESC>:quitall<CR>
            let g:which_key_map_Leader.Q = 'quit vim'
        " close current tab
            nnoremap <Leader>w <C-w>q
            let g:which_key_map_Leader.w = 'close split window'
        " close current split window
            nnoremap <Leader>W <ESC>:tabclose<CR>
            let g:which_key_map_Leader.W = 'close tab'

    " choose fold method
        nnoremap <LocalLeader>fd <ESC>:set foldmethod=diff<CR>
        nnoremap <LocalLeader>fe <ESC>:set foldmethod=expr<CR>
        nnoremap <LocalLeader>fi <ESC>:set foldmethod=indent<CR>
        nnoremap <LocalLeader>fk <ESC>:set foldmethod=marker<CR>
        nnoremap <LocalLeader>fm <ESC>:set foldmethod=manual<CR>
        nnoremap <LocalLeader>fs <ESC>:set foldmethod=syntax<CR>

        " map manage 
            let g:which_key_map_Local_Leader.f = {'name': '{fold method}', }
            let g:which_key_map_Local_Leader.f.d = 'diff'
            let g:which_key_map_Local_Leader.f.e = 'expr'
            let g:which_key_map_Local_Leader.f.i = 'indent'
            let g:which_key_map_Local_Leader.f.k = 'marker'
            let g:which_key_map_Local_Leader.f.m = 'manual'
            let g:which_key_map_Local_Leader.f.s = 'syntax'


" --------------------------------------------------------------------------------

" lilypond
    filetype off
    set runtimepath+=/Applications/LilyPond.app/Contents/Resources/share/lilypond/current/vim/
    filetype on
