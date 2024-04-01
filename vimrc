" ######################################################################
" use directory of this file as root directory of `deevim`, where use flag
" `deevim_path_loaded` to avoid repeating add path when `:so %` during
" debugging configuration
"
" NOTE: this block only used to check if path is correctly added to `&rtp`,
" not a real "load guard", therefore I didn't name it as `g:deevim_loaded`,
" also didn't use `finish` because I wish when run `:so %` it can source the
" rest code inside this file.

if !exists("g:deevim_path_loaded")

  let g:deevim_root_dir = expand("<sfile>:p:h") " root directory of blade-vim
  execute "set runtimepath^=" . g:deevim_root_dir
  execute "set runtimepath+=" . g:deevim_root_dir . "/after"
  let &packpath = &runtimepath

  " use `.vim/vimlocal.vim` for local setting (i.e. project setting)
  silent! source ./.vim/vimlocal.vim

  let g:deevim_path_loaded=1
endif

" ######################################################################
" BASIC SETTINGS

" ==========
" MINIMAL SETTING
filetype plugin indent on       " Load plugins accroding to detected filetype.
syntax on                       " Enable syntax highlighting

" ==========
" INDENT
" set smartindent
" Indent according to previous line
set autoindent

" Round indent to multiple of 'shiftwidth'.  Applies to > and < commands.
set shiftround

" Use spaces instead of tebs.
set expandtab

" Number of spaces to use for each step of (auto)indent.  Used for 'cindent', >>, <<, etc.
set shiftwidth=2

" Number of spaces that a tab char `\t` display in the file counts for.
set tabstop=8

" Tab key indents by 4 spaces.
set softtabstop=4

" ==========
" HIGHLIGHT, COLOR

" Hightlight while searching with / or ?.
set incsearch

" disable matches highlightes by default (nohlsearch, hlsearch)
" set nohlsearch

" enable matches highlights by default (nohlsearch, hlsearch)
set hlsearch

" Only hightlight the limited column
set synmaxcol=2000

" use gui color
set termguicolors

" ==========
" REGEX AND SEARCH

" ignore case in search (use '\c' '\C' to manually ignore/don't ignore case)
set ignorecase

" Override the 'ignorecase' option if the search pattern contains upper case characters.
" Only used when the search pattern is typed and 'ignorecase' option is on.
set smartcase

" ==========
" SPELL

" spell check (first turn on as default at Macbook Air)
set spell

" set cjk to forbid checking cjk char
set spelllang=en,cjk

" turn on spell check in terminal may lead char display issue, so close it.
if has('nvim')
    au TermOpen * setlocal nospell
endif

" ==========
" WINDOW, TAB

" split
set splitbelow                  " Open new windows below the current window
set splitright                  " Open new windows right of the current window

" ==========
" MISC

" set backspace =indent,eol,start " Make backspace work as you would expect
set hidden                        " Switch between buffers without having to sove first
set laststatus=2                  " Alwayse show statusline.
set display =lastline             " Show as much as possible of the last line.

" show
set showmode                    " Show current mode in command-line
set showcmd                     " Show already typed keys when more are expected

" edrawing
set ttyfast                     " Faster redrawing.
set lazyredraw                  " Only redraw when necessary

" let line number visuable
set number

" Finde the current line quickly.
set cursorline

" Searches warp around end-if-file
set wrapscan

" Alwayse report changed lines.
set report=0

" font (for gui)
set guifont=Hack_Nerd_Font_Mono:h12,DroidSansMono_Nerd_Font_Mono:h12
" for macvim
if has('gui')
  set guifont=Hack_Nerd_Font_Mono:h13,DroidSansMono_Nerd_Font_Mono:h13
endif

" coding
set encoding=utf-8
set fileencodings=utf-8,gb18030,ucs-bom,cp936,,big5,euc-jp,euc-kr,latin1
let &termencoding=&encoding

set textwidth=0 " forbid auto change line

" set how to judge whether the key was pressed at the same time, if use tmux, the time should be longer
if $TMUX != ''
  set ttimeoutlen=20
elseif &ttimeoutlen > 60 || &ttimeoutlen <= 0
  set ttimeoutlen=60
endif

" timeout for normal command
set timeoutlen=800

" history command
set history=500

" alwayse use mouse
set mouse=a

" --------------------------------------------------------------------------------
" macvim

if has('gui')
  " let meta key works well
  set macmeta

  " disable cursor blink
  set guicursor+=a:blinkon0
endif

" ----------------------------------------------------------------------
"  for macOS
    if has('mac') && executable('gmake')
        " macOS's built-in `make` command is old version, and the GNU Make
        " installed from Homebrew has name `gmake`
        set makeprg=gmake
    endif

" ######################################################################
" vim-plug

call plug#begin('~/.vim/plugged')

" ==========
" SHOULD BE LOADED EARLIER

" auto align
Plug 'godlygeek/tabular'

" ==========
" LANGUAGE SPECIFIC

" ----------
" natural language (such as English)

" syntax check, powered by LanguageTool
Plug 'dpelle/vim-LanguageTool'

" bionic-like reading
" Plug 'JellyApple102/easyread.nvim'
Plug 'nullchilly/fsread.nvim'

" ----------
" Applescript

Plug 'dearrrfish/vim-applescript'

" ----------
" C/C++

" enhanced highlight
Plug 'octol/vim-cpp-enhanced-highlight', {'for':'cpp'}

" ----------
" HTML
Plug 'gregsexton/MatchTag'

" ----------
" Julia
Plug 'JuliaEditorSupport/julia-vim'

" ----------
" LaTeX

Plug 'lervag/vimtex'
Plug 'Deeperand/vim-mdtex', {'for': ['tex', 'markdown']}

" ----------
" Lilypond
Plug 'gisraptor/vim-lilypond-integrator', {'for':' '}

" ----------
" Lisp
Plug 'kovisoft/slimv'
" Plug 'UltiRequiem/coc-cl', {'do': 'yarn install --frozen-lockfile && yarn build'}

" ----------
" Markdown

Plug 'plasticboy/vim-markdown', {'for':'markdown'}
Plug 'iamcco/mathjax-support-for-mkdp', {'for':'markdown'}
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'}

" ----------
" Mathematica
Plug 'voldikss/vim-mma'

" ----------
" Sagemath
" Plug 'petRUShka/vim-sage'
Plug 'Deeperand/vim-sage'

" ==========
" GENERALLY PURPOSE

" ----------
" TEXT EDIT ENHANCEMENT

" mark trailing whitespace
Plug 'ntpeters/vim-better-whitespace'

" snippet
Plug 'sirver/ultisnips'

" autocomplete parenthesis
Plug 'Raimondi/delimitMate'

" faster comment
Plug 'tpope/vim-commentary'

" surround
Plug 'tpope/vim-surround'

" faster fold
Plug 'Konfekt/FastFold'

" auto-save
Plug '907th/vim-auto-save'

" faster moving
Plug 'rhysd/accelerated-jk'

" quicker jump
Plug 'justinmk/vim-sneak'

" visualize undo tree
Plug 'mbbill/undotree'

" useful key maps
Plug 'tpope/vim-unimpaired'

" " multiple-cursors
" Plug 'mg979/vim-visual-multi',{'for':' '}

" " better search and substitute
" Plug 'tpope/vim-abolish'

" " switch the input way (for MacOS)
" if has('mac')
"   Plug 'lyokha/vim-xkbswitch',{'for':' '}
" endif

" " English/Chinese input method changingtest 输入
" Plug 'CodeFalling/fcitx-vim-osx', {'for':' '}
" Plug 'ybian/smartim', {'for':' '}

" ----------
" TEXT OBJECT

" create your own
Plug 'kana/vim-textobj-user'

" some pre-defined text object
Plug 'kana/vim-textobj-entire'
Plug 'kana/vim-textobj-fold'
Plug 'kana/vim-textobj-function',{'for':' '}
Plug 'kana/vim-textobj-indent'
Plug 'kana/vim-textobj-line'
Plug 'kana/vim-textobj-syntax'

" ----------
" FUZZY SEARCH

Plug 'Yggdroot/LeaderF', { 'do': './install.sh' }
" Plug '/opt/homebrew/opt/fzf' " point to fzf's built-in script
" Plug 'junegunn/fzf.vim'

" ----------
" STATUS BAR

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" tmux status bar
" Plug 'edkolev/tmuxline.vim',{'for':' '}

" ----------
" TAB

" allow quickly rename tab label, very lightweight plugin (around 300 lines)
Plug 'gcmt/taboo.vim'

" ----------
" BETTER VISUAL

" rainbow parentheses
Plug 'luochen1990/rainbow'

" indent line
Plug 'Yggdroot/indentLine'

" ----------
" FILE TREE

" defx
if has('nvim')
  Plug 'Shougo/defx.nvim', { 'do': ':UpdateRemotePlugins' }
  " set pythondll=/usr/local/Frameworks/Python.framework/Versions/3.7/Python
  " set pythonhome=/usr/local/Frameworks/Python.framework/Versions/3.7
  " set pythonthreedll=/usr/local/Frameworks/Python.framework/Versions/3.7/Python
  " set pythonthreehome=/usr/local/Frameworks/Python.framework/Versions/3.7
else
  Plug 'Shougo/defx.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif

" icon supoort of defx
" Plug 'Deeperand/defx-icons'
Plug 'kristijanhusak/defx-icons'

" git support of defx
Plug 'kristijanhusak/defx-git'

" ----------
" DEVELOPMENT TOOLS

" autocomplete, LSP
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" auto-update tags
Plug 'ludovicchabant/vim-gutentags'

" interact with REPL
Plug 'jpalardy/vim-slime'

" run shell commands in background
Plug 'skywind3000/asyncrun.vim'

" debugger
Plug 'puremourning/vimspector'

" syntax check
" Plug 'dense-analysis/ale', {'for': ' '}

" copilot
" Plug 'github/copilot.vim'

" ----------
" GIT

" git wrapper
Plug 'tpope/vim-fugitive'

" Show a diff using Vim its sign column
if has('nvim') || has('patch-8.0.902')
  Plug 'mhinz/vim-signify'
else
  Plug 'mhinz/vim-signify', { 'branch': 'legacy' }
endif

" ----------
" THEME

Plug 'rakr/vim-one'
Plug 'hzchirs/vim-material'
Plug 'ayu-theme/ayu-vim'
Plug 'kaicataldo/material.vim', {'for': ' '}
Plug 'sainnhe/lightline_foobar.vim',{'for':' '}
Plug 'itchyny/lightline.vim',{'for':' '}

call plug#end()

" " vim-plug key map ('p' means 'plug')

" " clean plug
" nnoremap <Leader>pc :PlugClean<CR>

" " install and uninstall plug
" nnoremap <Leader>pi :PlugInstall<CR>

" " update plug
" nnoremap <Leader>pu :PlugUpdate<Space>

" " update vim-plug itself
" nnoremap <Leader>pU :PlugUpgrade<CR>

" " check status of plug
" nnoremap <Leader>ps :PlugStatus<CR>

" --------------------------------------------------------------------------------

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
        " display tab char
            set list
            set listchars=tab:>-,nbsp:+
            highlight Whitespace guifg=#BFBFBF
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
        " copilot
            highlight CopilotSuggestion guifg=#C0BDDE ctermfg=8
    " for nvim
        " if has('nvim')
        "     highlight NormalNC guibg = '#dddddd'
        "     highlight MsgArea guibg = '#c8c1a1'
        " endif

    " terminal color
        " let g:terminal_color_0  = '#073642'
        " let g:terminal_color_1  = '#dc322f'
        " let g:terminal_color_2  = '#859900'
        " let g:terminal_color_3  = '#cfad00'
        " let g:terminal_color_4  = '#1268d2'
        " let g:terminal_color_5  = '#d33682'
        " let g:terminal_color_6  = '#2aa198'
        " let g:terminal_color_7  = '#eee8d5'
        " let g:terminal_color_8  = '#b2b2b2'
        " let g:terminal_color_9  = '#cb4b16'
        " let g:terminal_color_10 = '#586e75'
        " let g:terminal_color_11 = '#657b83'
        " let g:terminal_color_12 = '#839496'
        " let g:terminal_color_13 = '#6c71c4'
        " let g:terminal_color_14 = '#93a1a1'
        " let g:terminal_color_15 = '#fdf6e3'

" ######################################################################
" taboo
nnoremap <leader>tr :TabooRename<space>

" ######################################################################

" ----------------------------------------------------------------------

" netrw
" solve can't move file
    let g:netrw_keepdir=0

" ----------------------------------------------------------------------
" undotree
    nnoremap <Leader>u :UndotreeToggle<CR>

" ----------------------------------------------------------------------
"  vimspector
" let g:vimspector_enable_mappings = 'VISUAL_STUDIO'

" start and quit
nmap <leader>dc <plug>VimspectorContinue
nnoremap <leader>dq :VimspectorReset<CR>

" play control
nmap <leader>ds <plug>VimspectorStop
nmap <leader>dr <plug>VimspectorRestart
nmap <leader>dD <plug>VimspectorPause
nmap <leader>di <plug>VimspectorStepInto
nmap <leader>do <plug>VimspectorStepOut
nmap <leader>dn <plug>VimspectorStepOver

" break point
nmap <leader>dj <plug>VimspectorJumpToNextBreakpoint
nmap <leader>dk <plug>VimspectorJumpToPreviousBreakpoint
nmap <leader>db <plug>VimspectorToggleBreakpoint
nmap <leader>dB <Plug>VimspectorToggleConditionalBreakpoint
nmap <leader>dC :call vimspector#ClearBreakpoints()<CR>
nmap <leader>df <plug>VimspectorAddFunctionBreakpoint

" disassemble
nmap <leader>da <plug>VimspectorDisassemble

" evaluate expression under cursor
nmap <leader>de <Plug>VimspectorBalloonEval
xmap <leader>de <Plug>VimspectorBalloonEval

" ----------------------------------------------------------------------
" slimv (first record from: 20231026)
    if has('nvim')
        let g:slimv_swank_cmd = "call jobstart(\"ros -e '(ql:quickload :swank) (swank:create-server)' wait\")"
    else
        let g:slimv_swank_cmd = "!ros -e '(ql:quickload :swank) (swank:create-server)' wait &"
    endif
    let g:slimv_lisp = 'ros run'
    let g:slimv_impl = 'sbcl'

    let g:slimv_unmap_tab=1
    " inoremap <silent> <buffer> <s-Tab> <C-R>=SlimvHandleTab()<CR>
    " let g:slimv_keybindings=2
    " let g:slimv_leader = '\'
    " set guioptions+=m
    " set showtabline=2

" LanguageTool
    let g:languagetool_jar = '/Applications/LanguageTool-5.9/languagetool-commandline.jar'

" ================================================================================
" copilot

let g:copilot_proxy = '127.0.0.1:7890'
let g:copilot_filetypes = {
  \ 'tex': v:false,
\ }
let g:copilot_enabled=v:false

" ======================================================================
" lilypond

" let g:did_ftplugin=1

" turn off first,turn on later (why?)
" filetype off
" set runtimepath^=/Applications/LilyPond.app/Contents/Resources/share/lilypond/current/vim/
" filetype on

" ================================================================================
" `accelerated-jk`

nmap j <Plug>(accelerated_jk_gj)
nmap k <Plug>(accelerated_jk_gk)

let g:accelerated_jk_acceleration_limit = 100
let g:accelerated_jk_acceleration_table = [2,3,6,9,11,13,15,17]

" ================================================================================

" vim-julia
" use <F2> to convert UTF-8 text (to avoid the collision with auto-complete)
" by default, `<tab>` key is used to expand
imap <F2> <left><right><tab>

" enable U2L being used in other filetypes (the value is a regular expression,
" more info see :h julia-vim-L2U)
let g:latex_to_unicode_file_types = '.*'

" ================================================================================

" vim-slime
if has('nvim')
  let g:slime_target = "neovim"
else
  let g:slime_target = "vimterminal"
endif

" enable escape indent with help of ipython
let g:slime_python_ipython = 1

" ================================================================================

" airline
    " use powerline font symbol
        let g:airline_powerline_fonts = 1
    " the introduction was long, check `:h airline` for more detiles
        let g:airline_exclude_preview = 1
    " cache the changes to the highlighting groups, should therefore be faster
        let g:airline_highlighting_cache = 0
    "
        " let g:airline#extensions#vimtex#enabled = 1

  " built-in extensions
    " quickfix
        " configure the title text for quickfix buffers
            let g:airline#extensions#quickfix#quickfix_text = 'Quickfix'
        " configure the title text for location list buffers
            let g:airline#extensions#quickfix#location_text = 'Location'

    " word count (seems lunched by default?)
        " enable the extension
            let g:airline#extensions#wordcount#enabled = 1
        " defines how to display the wordcount statistics for the default formatter:
            let g:airline#extensions#wordcount#formatter#default#fmt = '%s words'
            let g:airline#extensions#wordcount#formatter#default#fmt_short = '%sW'

    " tab bar
        " enable tab style
            let g:airline#extensions#tabline#enabled = 1
        " if you want to show the current active buffer like this: buffer <buffer> buffer, then let this variable one
            let g:airline#extensions#tabline#alt_sep = 1
        " sep of tab bar (default is as same as status bar, but use this you can let it has some different behavior)
            " let g:airline#extensions#tabline#left_sep = ' '
            " let g:airline#extensions#tabline#left_alt_sep = '|'
        " enable/disable displaying buffers with a single tab. (若设置为 1, 则当只有一个 tab 时, 右侧的缓冲区文件提示将代替左侧的 tab 进行显示, 但显示的方式仍然与正常的 tab 类似, 只是最右侧没有 'tab' 字符提示)
            let g:airline#extensions#tabline#show_buffers = 1
        " enable/disable displaying open splits per tab at left
            let g:airline#extensions#tabline#show_splits = 1
        " enable/disable display preview window buffer in the tabline.
            let g:airline#extensions#tabline#exclude_preview = 1
        " configure how numbers are displayed in tab mode. 0: # of split; 1: tab number; 2 split and tab number
            let g:airline#extensions#tabline#tab_nr_type = 1
        " specify a different formatter for displaying the numbers, check documentation for detiles
            " let g:airline#extensions#tabline#tabnr_formatter = 'tabnr' " default?
        " style of tab style
            let g:airline#extensions#tabline#formatter = 'unique_tail' " with 'unique_tail', just the name of file will be displayed and no path information unless exist two or more files with the same name

" ================================================================================
" git related

" check log with neovim terminal
if has('nvim')
  nnoremap <leader>gl :split \| terminal cd '%:p:h'; git log --graph<CR>
endif

" ==========
" fugitive

" cooperate with airline
let g:airline#extensions#fugitiveline#enabled = 1

" compare with last commit of current file ('d' means diff)
nnoremap <leader>gd :Gdiff<CR>

" add current file to stage
nnoremap <leader>ga :Git add %<CR>

" check git log with parameter '--graph' in a brief way ('g' means 'log')
" (加上右移 'h' 是因为有时会需要键入命令才能打开 log 窗口, 加入一个无害的
" 指令可以避免手动进行此步)
nnoremap <silent> <leader>gg :Git log --graph --pretty=format:'%Cred%h%Creset - %Cgreen(%ad)%C(yellow)%d%Creset %s %C(bold blue)<%an>%Creset' --abbrev-commit --date=local<CR>h

" ==========
" signify

" check status
nnoremap <leader>gs :Gstatus<CR>

" icon to represent change
let g:signify_sign_change = '~'

" fold unchanged content ('f' means 'fold' or 'diff')
nnoremap <leader>gf :SignifyFold<CR>

" highlight diff
nnoremap <leader>gh :SignifyToggleHighlight<CR>

" hunk text object ('ic' operates on all lines of the current hunk. 'ac' does
" the same, but also removes all trailing empty lines.)
omap ic <plug>(signify-motion-inner-pending)
xmap ic <plug>(signify-motion-inner-visual)
omap ac <plug>(signify-motion-outer-pending)
xmap ac <plug>(signify-motion-outer-visual)

" ================================================================================
" asyncrun

" auto open quickfix window with hight 15 (or other hight)
let g:asyncrun_open = 10

" open/close quickfix window
nnoremap <F10> :call asyncrun#quickfix_toggle(10)<CR>

" ==========
" SHORTCUT

" :AsyncRun
nnoremap <leader>ac :AsyncRun cd $VIM_FILEDIR;<space>
nnoremap <leader>ar :AsyncRun<space>
nnoremap <leader>aR :AsyncRun!<space>
nnoremap <leader>as :AsyncStop<CR>

" make file
nnoremap <leader>mm :AsyncRun! make<CR>
nnoremap <leader>mt :AsyncRun! make test<CR>

" ================================================================================
" gutentags

" coorperate with airline
let g:airline#extensions#grepper#enabled = 1

" name of the tags file
set tags=./.tags,.tags

" gutentags 搜索工程目录的标志，碰到这些文件/目录名就停止向上一级目录递归
let g:gutentags_project_root = ['.root', '.svn', '.git', '.hg', '.project']

" 所生成的数据文件的名称
let g:gutentags_ctags_tagfile = '.tags'

" 将自动生成的 tags 文件全部放入 ~/.cache/tags 目录中，避免污染工程目录
let s:vim_tags = expand('~/.cache/vim/tags')
let g:gutentags_cache_dir = s:vim_tags

" 检测 ~/.cache/tags 不存在就新建
if !isdirectory(s:vim_tags)
    silent! call mkdir(s:vim_tags, 'p')
endif

" avoid generate large `opt-homebrew-.tags` file, where `/usr/local` is
" default value
let g:gutentags_exclude_project_root = ['/usr/local', "/opt/homebrew"]

" output error message (use command 'messages'. hide the option to avoid
" unwanted pop message)
let g:gutentags_trace = 0

" ================================================================================
" godlygeek/tabular

" SHORTCUTS ('t' means 'trim', or 'tabular'. Here 't' is right, 'T' is center)

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

" multiple spaces
noremap <leader>t<space> :Tabularize multiple_spaces<CR>

" repeat previous behavior
noremap <leader>tt :Tabularize<Space><CR>

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
    set foldlevelstart=99                   " will automatically set &foldlevel to 99 when open a new file
    set sessionoptions-=folds
    let g:fastfold_savehook = 1
    let g:fastfold_fold_command_suffixes =  ['x','X','a','A','o','O','c','C']
    let g:fastfold_fold_movement_commands = [']z', '[z', 'zj', 'zk']

    " update fold info
        nmap zuz <Plug>(FastFoldUpdate)

    set foldmethod=indent " set 'indent' as default behavior

" --------------------------------------------------------------------------------

" delimitMate related
    " forbid auto-delete paired parenthesis
        inoremap <BS> <BS>
    " jump out form a delimiter
        " imap <M-Tab> <Plug>delimitMateS-Tab
        inoremap <M-tab> <right>
        " inoremap <S-tab> <left>
    " allow work in all the region (default value is "Comment")
        let g:delimitMate_excluded_regions = ""
    " auto expand `{}` block when press `<CR>`
        " let g:delimitMate_expand_cr=1

" --------------------------------------------------------------------------------

" ultisnips related
    " Expand
        let g:UltiSnipsExpandTrigger = '<tab>'
    " Jump Forward
        let g:UltiSnipsJumpForwardTrigger ='<M-j>'
    " Jump Backword
        let g:UltiSnipsJumpBackwardTrigger = '<M-k>'
    " List Snippets
        " let g:UltiSnipsListSnippets='<c-e>' (don't use `<c-e>`), which conflict with Vim built-in command
    " Python version used
        let g:UltiSnipsUsePythonVersion=3
    " Split way of edic snippets file
        let g:UltiSnipsEditSplit ="vertical"
    " snippets file dirctory
        let g:UltiSnipsSnippetDirectories = [g:deevim_root_dir.'/UltiSnips']
        let g:UltiSnipsSnippetDir = [g:deevim_root_dir.'/UltiSnips']
    " check the snippet setting
        nnoremap <C-M-s> :UltiSnipsEdit<CR>

" --------------------------------------------------------------------------------

" indentline related
    let g:indentLine_char_list = ['|', '¦', '┆', '┊']

" --------------------------------------------------------------------------------

" rainbow parentheses related
    let g:rainbow_active = 1 "0 if you want to enable it later via :RainbowToggle
	" \	'ctermfgs': ['#ff00ff', '#0000ff', '#3CCB3E', '#FDA428', '#FB4E1E', '#A53134', '#FCD32C'],
   	" \	'guifgs': ['Magenta', 'Blue', 'LimeGreen', 'Orange', 'OrangeRed', 'Brown', 'Gold'],
    let g:rainbow_conf = {
   	\	'guifgs': ['Magenta', 'Blue', 'LimeGreen', 'Orange', 'OrangeRed', 'Brown'],
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

    " forbid in mathematica file
        autocmd BufEnter *.w,*wls,*.nb,*.m RainbowToggleOff
        autocmd BufEnter CMakeLists.txt,*.cmake RainbowToggleOff

" --------------------------------------------------------------------------------

" vim-better-whitespace
    " appearance
        let g:better_whitespace_guicolor = "#ffafd7"
    " delete trailing space (since <F12> is close to <DEL>)
        nnoremap <F12> :StripWhitespace<CR>
        inoremap <F12> <ESC>:StripWhitespace<CR>a

        " override default keymap (when user set keymap for `<leader>s`,
        " vim-bettwer-whitespace will stop using this keymap)
        nnoremap <leader>s <leader>s
    " auto disable whitespace when open terminal
    if has('nvim')
        au TermOpen * DisableWhitespace
    endif

" --------------------------------------------------------------------------------
" defx (file tree)

let g:deevim_load_defx = 1
execute "source " . g:deevim_root_dir . "/config/defx.vim"

" --------------------------------------------------------------------------------

" multicursor
    " let g:VM_leader="\\"
    " nmap <M-RightMouse>  <Plug>(VM-Mouse-Word)
    " nmap <M-C-LeftMouse> <Plug>(VM-Mouse-Column)
    " nmap <M-LeftMouse>   <Plug>(VM-Mouse-Cursor)

" fzf
let g:deeplugin_fzf = 0

if g:deeplugin_fzf == 1
    command! FZFMru call fzf#run({
    \ 'source':  reverse(s:all_files()),
    \ 'sink':    'edit',
    \ 'options': '-m -x +s',
    \ 'down':    '40%' })

    function! s:all_files()
    return extend(
    \ filter(copy(v:oldfiles),
    \        "v:val !~ 'fugitive:\\|NERD_tree\\|^/tmp/\\|.git/'"),
    \ map(filter(range(1, bufnr('$')), 'buflisted(v:val)'), 'bufname(v:val)'))
    endfunction

    " fzf.vim
    nnoremap <leader>fb :Buffers<CR>
    nnoremap <leader>ff :Files<CR>
    nnoremap <leader>fh :Helptags<CR>
    nnoremap <leader>fl :BLines<CR>
    nnoremap <leader>fr :History<CR>
    nnoremap <leader>fw :Windows<CR>
endif

" --------------------------------------------------------------------------------

" LeaderF
let g:deevim_load_leaderf = 1

if g:deevim_load_leaderf == 1
  " set default mode
  let g:LfDefaultMode='Fuzzy'

  " if file is open, jump to it or open it at current window
  let g:Lf_JumpToExistingWindow=0

  " show hiden content
  " let g:Lf_ShowHidden = 1

  " if remeber last search
  let Lf_RememberLastSearch=0

  " the max number of recent file search
  let g:Lf_MruMacFiles=500
  let Lf_MaxCount=3000000

  " ==========
  " CHACHE SETTINGS

  " After Vin starts, it will refresh the cache at the first time LeaderF
  " starts (first times after lunching will be slower)
  let g:Lf_UseCache = 1

  " Always refresh LeaderF if it was lunched (alwayse be solwer)
  let g:Lf_UseMemoryCache = 1

  " wait time before use cache
  " let g:LfNeedCacheTime = 1

  " ==========
  " APPEARANCE

  " enable using popup mode to launch LeaderF
  let g:Lf_WindowPosition = 'popup'

  " preview the result in a popup window.
  let g:Lf_PreviewInPopup = 1

  " `wincolor` of input window
  highlight Lf_hl_popup_inputText guifg=#525252 guibg=#f4f3d7

  " `wincolor` of content window
  highlight Lf_hl_popup_window guifg=#6c6b65 guibg=#fffde8

  " color of the "cursorline"
  highlight def Lf_hl_cursorline guifg=#9849ff guibg=NONE gui=NONE

  " ==========
  " SHORTCUTS

  " history command ('c' means 'command')
  nnoremap <Leader>sc :LeaderfHistoryCmd<CR>

  " search code in current buffer file line ('l' mans 'line')
  nnoremap <Leader>sl :LeaderfLine<CR>

  " search code in all buffer (capital letter means search all)
  nnoremap <Leader>sL :LeaderfLineAll<CR>

  " search help document of vim
  nnoremap <Leader>sh :LeaderfHelp<CR>

  " search function in current buffer
  nnoremap <Leader>sf :LeaderfFunction<CR>

  " search function in all listed buffers
  nnoremap <Leader>sF :LeaderfFunctionAll<CR>

  " recent opened file ('r' means 'recent')
  nnoremap <Leader>sr :LeaderfMru<CR>

  " recent opened file in current working directory
  nnoremap <Leader>sR :LeaderfMruCwd<CR>

  " history search ('s' means 'search')
  nnoremap <Leader>ss :LeaderfHistorySearch<CR>

  " search tags in current buffer
  nnoremap <Leader>st :LeaderfBufTag<CR>

  " search tags
  nnoremap <Leader>sT :LeaderfTag<CR>

endif

" --------------------------------------------------------------------------------
" coc.nvim

" ==========
" REQUIRED VIM SETTINGS

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

" ==========
" COC.NVIM SETTINGS

" root marker for workspace
let b:coc_root_patterns = ['.root', '.svn', '.git', '.hg', '.project']

" ----------
" VIM-AIRLINE

" enable/disable coc integration for vim-airline
let g:airline#extensions#coc#enabled = 1

" Change error symbol:
let airline#extensions#coc#error_symbol = 'Error:'

" Change warning symbol:
let airline#extensions#coc#warning_symbol = 'Warning:'

" Change error format:
" let airline#extensions#coc#stl_format_err = '%E{[%e(#%fe)]}'
let airline#extensions#coc#stl_format_err = '%C(L%L)'

" Change warning format:
" let airline#extensions#coc#stl_format_warn = '%W{[%w(#%fw)]}'
let airline#extensions#coc#stl_format_warn = '%C(L%L)'

" ----------
" AUTO-COMPLETE

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" (I use `<plug>delimitMateCR` at the end to make it compatible to `delimitMate`)
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<plug>delimitMateCR"

" scroll in float windows
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f>
    \ coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b>
    \ coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f>
    \ coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b>
    \ coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr>
    \ <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr>
    \ <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" ----------
" LSP

" navigate diagnostics
nmap <silent> <M-k> <Plug>(coc-diagnostic-prev)
nmap <silent> <M-j> <Plug>(coc-diagnostic-next)

" rename symbol, check changes
nnoremap <leader>r <Plug>(coc-rename)
nnoremap <leader>R :CocCommand workspace.inspectEdit<CR>

" code actions (general)
nmap <leader>cf <Plug>(coc-fix-current)
nmap <leader>cc <Plug>(coc-codeaction-line)

" code format
xmap <leader>F  <Plug>(coc-format-selected)
nmap <leader>F  <Plug>(coc-format-selected)

" function text object, requires document symbols feature of languageserver.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" various goto-commands
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use <TAB> for select selections ranges, needs server support, like:
" coc-tsserver, coc-python. (since the map is in the normal mode, it won't
" infect the expand of snippet)
nmap <silent> <S-tab> <Plug>(coc-range-select)
xmap <silent> <S-tab> <Plug>(coc-range-select)

" Use K to show hover (LSP required), otherwise search in help doc
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction
nnoremap <silent> K :call <SID>show_documentation()<CR>

" highlight for inlay hint (see `:h coc-highlights-inlayHint`)
highlight CocInlayHint guifg=#C0BDDE

" ----------
" MULTICURSOR

" highlight of multicursor
hi CocCursorRange guibg=#d1c3ff guifg=#595273 gui=bold

" add current character cursor to multi-cursors
nmap <Leader><Leader> <Plug>(coc-cursors-position)
nmap <M-MiddleMouse> <leftmouse><Plug>(coc-cursors-position)

" add current visual selected range to cursors
xmap <silent> <Leader><Leader> <Plug>(coc-cursors-range)

" add current words ('m' means 'multi')
nmap <Leader>MM <Plug>(coc-cursors-word)

" add and jump to next same words (since the behavior like normal command 'n',
" so use key 'n')
nmap <Leader>n <Plug>(coc-cursors-word)*

" add and jump to previous same words
nmap <Leader>N <Plug>(coc-cursors-word)#

" add all the same words ('a' mean 'all')
nnoremap <Leader>Ma :CocCommand document.renameCurrentWord<CR>

" use operator for add range to cursors. Use normal command like `<leader>xi(`
" ('t' means 'text object')
nmap <leader>Mt <Plug>(coc-cursors-operator)

" ----------
" COC LIST

" built-in
" (full built-in list see :h coc-list-sources)
nnoremap <leader>la :CocList<CR>
nnoremap <leader>lc :CocList commands<CR>
nnoremap <leader>ls :CocList symbols<CR>
nnoremap <leader>lt :CocList outline<CR>

" `coc-lists`
" full supported list include (ref: https://github.com/neoclide/coc-lists )
" `buffers`: current buffer list.
" `changes`: changes list.
" `cmdhistory`: history of commands.
" `colors`: colors schemes.
" `files`: search files from current cwd.
" `filetypes`: file types.
" `grep`: grep text from current cwd.
" `helptags`: helptags of vim.
" `lines`: search lines by regex patterns.
" `locationlist`: items from vim's location list.
" `maps`: key mappings.
" `marks`: marks of vim.
" `mru`: most recent used files.
" `quickfix`: items from vim's quickfix list.
" `registers`: registers of vim.
" `searchhistory`: history of search.
" `sessions`: session list.
" `tags`: search tag files.
" `vimcommands`: available vim commands.
" `windows`: windows of vim.
" `words`: search word in current buffer.
" `functions`: available vim functions.
nnoremap <leader>lb :CocList buffers<CR>
nnoremap <leader>lf :CocList files<CR>
nnoremap <leader>lg :CocList grep<CR>
nnoremap <leader>lh :CocList helptags<CR>
nnoremap <leader>ll :CocList lines<CR>
nnoremap <leader>lm :CocList maps<CR>
nnoremap <leader>lr :CocList mru<CR>

" ----------
" MISC

" run `:CocCommand`
" nnoremap <leader>cm :CocCommand<Space>

" pick color ('c' means 'coc'; the second 'c' means 'color')
" nnoremap <Leader>cc :call CocAction('pickColor')<CR>

" open configure .json file ('j' means 'json')
" nnoremap <Leader>cj :CocConfig<CR>

" check diagnostic ('d' means 'diagnostic')
" nnoremap <Leader>cd :CocList diagnostic<CR>

" extension manage ('e' means 'extension')

" list extensions ('l' means list)
" nnoremap <Leader>cel :CocList extensions<CR>

" install extension ('i' means 'install')
" nnoremap <Leader>cei :CocInstall<Space>

" uninstall extensions ('u' means 'uninstall')
" nnoremap <Leader>ceu :CocUninstall<Space>

" ######################################################################
" GENERAL KEY MAPPINGS

" local leader (local leader is used in plug such as 'vimtex')
let g:maplocalleader= "\<space>"

" double press localleader to use its original function
nnoremap <localleader><localleader> <space>

" move
vnoremap j gj
vnoremap k gk
noremap gj j
noremap gk k

" faster move (`5j` and `5k` is defined in `accelerated-jk`)
nnoremap <C-j> 5j
nnoremap <C-k> 5k
vnoremap <C-j> 5j
vnoremap <C-k> 5k
noremap <C-h> 5h
noremap <C-l> 5l

" in visual mode, use `$` jump to end of line (eol) without '\n' char; use
" `g$` jump to eol with '\n' char
xnoremap $ $<left>
xnoremap g$ $

" add parenthesis/space ('a' means 'add', 'A' will inster extra space at
" both side)
vnoremap <localleader>p c<space><C-r>"<space>
nnoremap <localleader>p vc<space><C-r>"<space><ESC>
vnoremap <localleader>ap c(<C-r>")<ESC>
nnoremap <localleader>ap vc(<C-r>")<ESC>
vnoremap <localleader>as c[<C-r>"]<ESC>
nnoremap <localleader>as vc[<C-r>"]<ESC>
vnoremap <localleader>ab c{<C-r>"}<ESC>
nnoremap <localleader>ab vc{<C-r>"}<ESC>
vnoremap <localleader>aa c<<C-r>"><ESC>
nnoremap <localleader>aa vc<<C-r>"><ESC>
vnoremap <localleader>a` c`<C-r>"`<ESC>
nnoremap <localleader>a` vc`<C-r>"`<ESC>

vnoremap <localleader>Ap c(<space><C-r>"<space>)<ESC>
nnoremap <localleader>Ap vc(<space><C-r>"<space>)<ESC>
vnoremap <localleader>As c[<space><C-r>"<space>]<ESC>
nnoremap <localleader>As vc[<space><C-r>"<space>]<ESC>
vnoremap <localleader>Ab c{<space><C-r>"<space>}<ESC>
nnoremap <localleader>Ab vc{<space><C-r>"<space>}<ESC>
vnoremap <localleader>Aa c<<C-r>"><ESC>
nnoremap <localleader>Aa vc<<C-r>"><ESC>

" ==========
" INPUT ORIGINAL STRING TO CLIPBOARD: to avoid the influence of auto-expand
" snippet ("'" or '"' means this shortcut is related to register '"'), but now
" is deprecated due to had the technique to define highlight-group-based
" snippets.

" nnoremap <M-'> :let @" = '<left>'
" inoremap <M-'> <ESC>:let @" = '<left>'
" vnoremap <M-'> c<ESC>:let @" = '<left>'
" nnoremap <M-"> :let @" = "<left>"
" inoremap <M-"> <ESC>:let @" = "<left>"
" vnoremap <M-"> c<ESC>:let @" = "<left>"

" ==========
" ENHANCED SEARCH: '*' can search selected content now (by default it can only
" search current word), where the code from [2015, Neil, Practical Vim, Tip 87]
xnoremap * :<C-u>call <SID>VSetSearch('/')<CR>/<C-R>=@/<CR><CR>
xnoremap # :<C-u>call <SID>VSetSearch('?')<CR>?<C-R>=@/<CR><CR>

function! s:VSetSearch(cmdtype)
  let temp = @s
  norm! gv"sy
  let @/ = '\V' . substitute(escape(@s, a:cmdtype.'\'), '\n', '\\n', 'g')
  let @s = temp
endfunction

" ==========
" REPEAT SUBSTITUTE: repeat the last substitute operation, also with same flag
nnoremap & :&&<CR>
xnoremap & :&&<CR>

" ==========
" FASTER SUBSTITUTE: 'r' means 'replace'

" substitute current line (pattern is form last search)
" nnoremap <leader>r V:s/<C-r>//
"
" substitute current line (input pattern by keyboard)
" nnoremap <leader>R V:s/
"
" substitute selected (pattern is form last search)
" xnoremap <leader>r :s/<C-r>//
"
" substitute selected (input pattern)
" xnoremap <leader>R :s/

" ==========
" OPEN FILE

" open directory of current file with Finder.app
if has('mac')
  nnoremap <silent><C-M-o> :silent !open -a Finder "%:p:h"<CR>
end

" quick access vimrc and help doc
nnoremap <silent> <leader>C :execute("edit".g:deevim_root_dir."/vimrc")<CR>
nnoremap <silent> <leader>H :execute("split".g:deevim_root_dir."/doc/deevim.txt")<CR>

" open corresponding ftplugin of current file
nnoremap <silent> <F2> :vsplit \| call execute("edit ".g:deevim_root_dir."/ftplugin/".&filetype.".vim")<CR>

" open current file with Macvim
nnoremap <silent> <F3> :silent ! mvim "%:p"<CR>

" open current file with VS Code
nnoremap <silent> <F4> :silent ! code "%:p"<CR>

" create new file at the current path of the current buffer
" nnoremap <C-M-n> <ESC>:edit %:p:h/

" ==========
" TAB AND WINDOW

" open current file at new tab
" nnoremap <C-M-t> :tabnew<SPACE>%<CR>

" go to next/previous buffer file (would better to use `[b` `]b` provided by `unimpaired`)
" nnoremap <C-M-k> :bprevious<CR>
" nnoremap <C-M-j> :bnext<CR>

" go to next/previous tab (would better to use default key `gt` `gT`)
" nnoremap <C-M-h> :tabp<CR>
" nnoremap <C-M-l> :tabn<CR>

" change spitted window (would better to use default key `<C-w>` + `hjkl`)
" nnoremap <S-M-h> <ESC><C-w>h
" nnoremap <S-M-l> <ESC><C-w>l
" nnoremap <S-M-j> <ESC><C-w>j
" nnoremap <S-M-k> <ESC><C-w>k

" ==========
" CLOSE AND QUIT

" close the current file in buffer (which means 'buffer wipe out')
" nnoremap <Leader>q <ESC>:bwipeout<CR>

" quit Vim (which means 'quit all')
" nnoremap <Leader>Q <ESC>:quitall<CR>

" close current tab
" nnoremap <Leader>w <C-w>q

" close current split window
" nnoremap <Leader>W <ESC>:tabclose<CR>

" ==========
" QUICK SET

" set syntax
" nnoremap <localleader>ss <ESC>:setlocal syntax

" set file type
" nnoremap <localleader>st <ESC>:setlocal filetype

" set indent length
" nnoremap <silent> <localleader>si2 :setlocal shiftwidth=2 tabstop=2 softtabstop=2<CR>:IndentLinesReset<CR>
" nnoremap <silent> <localleader>si4 :setlocal shiftwidth=4 tabstop=4 softtabstop=4<CR>:IndentLinesReset<CR>

" set cancel level
" nnoremap <localleader>sc :setlocal conceallevel

" choose fold method
" nnoremap <localLeader>sfd :setlocal foldmethod=diff<CR>
" nnoremap <localLeader>sfe :setlocal foldmethod=expr<CR>
" nnoremap <localLeader>sfi :setlocal foldmethod=indent<CR>
" nnoremap <localLeader>sfk :setlocal foldmethod=marker<CR>
" nnoremap <localLeader>sfm :setlocal foldmethod=manual<CR>
" nnoremap <localLeader>sfs :setlocal foldmethod=syntax<CR>

" ==========
" TERMINAL

" run command in terminal at current file path with a split window
nnoremap <leader>tT :split \| terminal<CR><C-w>k
nnoremap <leader>tt :vsplit \| terminal<CR><C-w>h
command Terminalcd execute 'SlimeSend1 cd '.expand("%:p:h")

if has('terminal')
  " statusline support
  autocmd TerminalOpen * setlocal statusline=%{b:term_title}

  " exit terminal and kill the process
  autocmd TerminalOpen * nnoremap <buffer> gq <ESC>:bwipeout!<CR>
  autocmd TerminalOpen * nnoremap <buffer> <leader>q <ESC>:bwipeout!<CR>
endif

if has('nvim')
  " statusline support
  autocmd TermOpen * setlocal statusline=%{b:term_title}

  " exit terminal and kill the process
  autocmd TermOpen * nnoremap <buffer> gq <ESC>:bwipeout!<CR>
  autocmd TermOpen * nnoremap <buffer> <leader>q <ESC>:bwipeout!<CR>
endif

" To map <Esc> to exit terminal-mode
tnoremap <Esc> <C-\><C-n>

" ----------
" NAVIGATE: use `Shift+Meta+{h,j,k,l}` to navigate windows from any mode

" terminal mode
tnoremap <M-S-h> <C-\><C-N><C-w>h
tnoremap <M-S-j> <C-\><C-N><C-w>j
tnoremap <M-S-k> <C-\><C-N><C-w>k
tnoremap <M-S-l> <C-\><C-N><C-w>l

" insert mod
inoremap <M-S-h> <C-\><C-N><C-w>h
inoremap <M-S-j> <C-\><C-N><C-w>j
inoremap <M-S-k> <C-\><C-N><C-w>k
inoremap <M-S-l> <C-\><C-N><C-w>l

" ================================================================================
" custom file type

autocmd BufNewFile,BufRead *.ins setlocal filetype=tex
autocmd BufNewFile,BufRead *.temptex setlocal filetype=temptex
autocmd BufNewFile,BufRead *.tmux setlocal filetype=tmux
autocmd BufNewFile,BufRead *.red setlocal filetype=reduce
autocmd BufNewFile,BufRead zsh.snippets setlocal filetype=snippets " solve zsh.snippets will be detected as `zsh` filetype
autocmd BufNewFile,BufRead *.sage setlocal filetype=pythoh.sage

" ==========
" GNUPLOT

" solve the following problems:
" 1. by default `*.gp` will be detected as filetype `gp` rather than `gnuplot`
"    (so need `filetype=...` instead of `setfiletype`)
" 2. by default `*.gnuplot` and `*.plt` cannot be detected as filetype `gnuplot`
autocmd! BufRead,BufNewFile *.gp,*.gnuplot setlocal filetype=gnuplot
