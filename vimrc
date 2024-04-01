if !exists("b:deevim_path_loaded") " avoid repeating add path when `:so %` during debugging configuration
    let g:blade_vim_config_dir = expand("<sfile>:p:h") " root directory of blade-vim
    " set runtimepath^=~/Documents/my_config/blade-vim
    " set runtimepath+=~/Documents/my_config/blade-vim/after
    execute "set runtimepath^=" . g:blade_vim_config_dir
    execute "set runtimepath+=" . g:blade_vim_config_dir . "/after"
    let &packpath = &runtimepath

    " use `.vim/vimlocal.vim` for local setting (i.e. project setting)
    silent! so ./.vim/vimlocal.vim

    let b:deevim_path_loaded=1
endif

" normal setting
    " most simple setting
        filetype plugin indent on       " Load plugins accroding to detected filetype.
        syntax on                       " Enable syntax highlighting

    " indent
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

    " set backspace =indent,eol,start " Make backspace work as you would expect
    set hidden                      " Switch between buffers without having to sove first
    set laststatus=2                " Alwayse show statusline.
    set display =lastline           " Show as much as possible of the last line.

    " show
        set showmode                    " Show current mode in command-line
        set showcmd                     " Show already typed keys when more are expected

    " highlight set
        set incsearch                   " Hightlight while searching with / or ?.
        " set nohlsearch                    " disable matches highlightes by default (nohlsearch, hlsearch)
        set hlsearch                    " enable matches highlights by default (nohlsearch, hlsearch)
        set synmaxcol=2000              " Only hightlight the limited column

    " search set (use '\c' '\C' to manually ignore/don't ignore case)
        set ignorecase
    " Override the 'ignorecase' option if the search pattern contains upper case characters.
    " Only used when the search pattern is typed and 'ignorecase' option is on.
        set smartcase

    " spell check (first turn on as default at Macbook Air)
        set spell
        set spelllang=en,cjk            " set cjk to forbid cjk char check
        " turn on spell check in terminal may lead char display issue, so
        " close it.
        if has('nvim')
            au TermOpen * setlocal nospell
        endif

    " edrawing
        set ttyfast                     " Faster redrawing.
        set lazyredraw                  " Only redraw when necessary

    " split
        set splitbelow                  " Open new windows below the current window
        set splitright                  " Open new windows right of the current window

    " use gui color
        set termguicolors

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

    " history command
        set history=500

    " alwayse use mouse
        set mouse=a

" --------------------------------------------------------------------------------

" for macvim
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

" ================================================================================ (80 个 '-')

" vim-plug
    " plug manage
         call plug#begin('~/.vim/plugged')
            " should be loaded earlier
                " auto align
                    Plug 'godlygeek/tabular'

             " language specific
                " natural language (such as English)
                    " syntax check, powered by LanguageTool
                        Plug 'dpelle/vim-LanguageTool'
                    " bionic-like reading
                        " Plug 'JellyApple102/easyread.nvim'
                        Plug 'nullchilly/fsread.nvim'
                " Applescript
                    Plug 'dearrrfish/vim-applescript'
                " LaTeX
                    Plug 'lervag/vimtex'
                    Plug 'Deeperand/vim-mdtex', {'for': ['tex', 'markdown']}
                " markdown
                    Plug 'plasticboy/vim-markdown', {'for':'markdown'}
                    Plug 'iamcco/mathjax-support-for-mkdp', {'for':'markdown'}
                    Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'}
                " c/c++
                    " enhanced highlight
                        Plug 'octol/vim-cpp-enhanced-highlight', {'for':'cpp'}
                " html
                    Plug 'gregsexton/MatchTag'
                " mathematica
                    Plug 'voldikss/vim-mma'
                " Julia
                    Plug 'JuliaEditorSupport/julia-vim'
                " Lilypond
                    Plug 'gisraptor/vim-lilypond-integrator', {'for':' '}
                " Sagemath
                    " Plug 'petRUShka/vim-sage'
                    Plug 'Deeperand/vim-sage'
                " Lisp
                    Plug 'kovisoft/slimv'
                    " Plug 'UltiRequiem/coc-cl', {'do': 'yarn install --frozen-lockfile && yarn build'}

            " used generally
                " file tree browse
                    " main plugin
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

                    " icon supoort
                        Plug 'Deeperand/defx-icons'
                        Plug 'kristijanhusak/defx-icons'
                    " git support
                        Plug 'kristijanhusak/defx-git'
                " debugger interface
                    Plug 'puremourning/vimspector'
                " git enhancment
                    " git wrapper
                        Plug 'tpope/vim-fugitive'
                    " Show a diff using Vim its sign column
                        if has('nvim') || has('patch-8.0.902')
                            Plug 'mhinz/vim-signify'
                        else
                            Plug 'mhinz/vim-signify', { 'branch': 'legacy' }
                        endif
                " shortcut management
                    Plug 'liuchengxu/vim-which-key'
                " search
                    Plug 'Yggdroot/LeaderF', { 'do': './install.sh' }
                    " Plug '/opt/homebrew/opt/fzf' " point to fzf's built-in script
                    " Plug 'junegunn/fzf.vim'
                " power status line
                    Plug 'vim-airline/vim-airline'
                    Plug 'vim-airline/vim-airline-themes'
                " allow quickly rename tab label, very lightweight plugin
                " (around 300 lines)
                    Plug 'gcmt/taboo.vim'
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
                    Plug 'mg979/vim-visual-multi',{'for':' '}
                " syntax check
                    " Plug 'dense-analysis/ale', {'for': ' '}
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
                " text object
                    " create your own
                        Plug 'kana/vim-textobj-user'
                    " some pre-defined text object
                        Plug 'kana/vim-textobj-entire'
                        Plug 'kana/vim-textobj-fold'
                        Plug 'kana/vim-textobj-function',{'for':' '}
                        Plug 'kana/vim-textobj-indent'
                        Plug 'kana/vim-textobj-line'
                        Plug 'kana/vim-textobj-syntax'
                " some useful key map of vim
                    Plug 'tpope/vim-unimpaired'
                " switch the input way (for MacOS)
                    if has('mac')
                        Plug 'lyokha/vim-xkbswitch',{'for':' '}
                    endif
                " tmux status bar
                    Plug 'edkolev/tmuxline.vim',{'for':' '}
                " quicker jump
                    Plug 'justinmk/vim-sneak'
                " interact with REPL
                   Plug 'jpalardy/vim-slime'
                " better search and substitute
                    Plug 'tpope/vim-abolish'
                " English/Chinese input method changingtest 输入
                    Plug 'CodeFalling/fcitx-vim-osx', {'for':' '}
                    Plug 'ybian/smartim', {'for':' '}
                " quick moving
                    Plug 'rhysd/accelerated-jk'
                " visualize undo tree
                    Plug 'mbbill/undotree'

            " advanced tool
                Plug 'github/copilot.vim'

            " Theme
                Plug 'rakr/vim-one'
                Plug 'hzchirs/vim-material'
                Plug 'ayu-theme/ayu-vim'
                Plug 'kaicataldo/material.vim', {'for': ' '}
                Plug 'sainnhe/lightline_foobar.vim',{'for':' '}
                Plug 'itchyny/lightline.vim',{'for':' '}
        call plug#end()

    " key map ('p' means 'plug')
        " clean plug
            nnoremap <Leader>pc :PlugClean<CR>
        " install and uninstall plug
            nnoremap <Leader>pi :PlugInstall<CR>
        " update plug
            nnoremap <Leader>pu :PlugUpdate<Space>
        " update vim-plug itself
            nnoremap <Leader>pU :PlugUpgrade<CR>
        " check status of plug
            nnoremap <Leader>ps :PlugStatus<CR>

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

" --------------------------------------------------------------------------------
" copilot

    let g:copilot_proxy = '127.0.0.1:7890'
    let g:copilot_filetypes = {
        \ 'tex': v:false,
        \ }
    let g:copilot_enabled=v:false

" ----------------------------------------------------------------------

" lilypond
    " let g:did_ftplugin=1

" --------------------------------------------------------------------------------

" " accelerated jk
    nmap j <Plug>(accelerated_jk_gj)
    nmap k <Plug>(accelerated_jk_gk)
    nmap <C-j> 5j
    nmap <C-k> 5k

    let g:accelerated_jk_acceleration_limit = 100
    let g:accelerated_jk_acceleration_table = [2,3,6,9,11,13,15,17]

        \al
" --------------------------------------------------------------------------------

" vim-julia
    " use <F2> to convert UTF-8 text (to avoid the collision with auto-complete)
    " by default, `<tab>` key is used to expand
        imap <F2> <left><right><tab>
    " let other filetypes can convert string to UTF-8 (the value is a regular expression)
    " more info see :h julia-vim-L2U
        let g:latex_to_unicode_file_types = '.*'

" --------------------------------------------------------------------------------

" vim-slime
    if has('nvim')
        let g:slime_target = "neovim"
    else
        let g:slime_target = "vimterminal"
    endif

    let g:slime_python_ipython = 1

" --------------------------------------------------------------------------------

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

" git related
    " cooperate with airline
        let g:airline#extensions#fugitiveline#enabled = 1

    " build dictionary for git shortcut
        let g:which_key_map_Leader.g = {'name' : '{git}',}
    " use terminal
        if has('nvim')
            " check log with terminal
                nnoremap <leader>gl :split \| terminal cd '%:p:h'; git log --graph<CR>
                let g:which_key_map_Leader.g.l = 'git log graph (term)'
        endif
    " fugitive
        " compare with last commit of current file ('d' means diff)
            nnoremap <leader>gd :Gdiff<CR>
            let g:which_key_map_Leader.g.d = 'compare with last commit'
        " add current file to stage
            nnoremap <leader>ga :Git add %<CR>
            let g:which_key_map_Leader.g.a = 'add current file to stage'
        " check git log with parameter '--graph' in a brief way ('g' means 'log') (加上右移 'h' 是因为有时会需要键入命令才能打开 log 窗口, 加入一个无害的指令可以避免手动进行此步)
            nnoremap <silent> <leader>gg :Git log --graph --pretty=format:'%Cred%h%Creset - %Cgreen(%ad)%C(yellow)%d%Creset %s %C(bold blue)<%an>%Creset' --abbrev-commit --date=local<CR>h
            let g:which_key_map_Leader.g.g = 'git log graph (brief)'
    " signify
        nnoremap <leader>gs :Gstatus<CR>
        let g:which_key_map_Leader.g.s = ':Gstatus'
        " icon
            let g:signify_sign_change = '~'
        " fold unchanged content ('f' means 'fold' or 'diff')
            nnoremap <leader>gf :SignifyFold<CR>
            let g:which_key_map_Leader.g.f = 'fold unchang in new tab'
        " highlight diff
            nnoremap <leader>gh :SignifyToggleHighlight<CR>
            let g:which_key_map_Leader.g.h = 'toggle highlight change'
        " hunk text object ('ic' operates on all lines of the current hunk. 'ac' does the same, but also removes all trailing empty lines.)
            omap ic <plug>(signify-motion-inner-pending)
            xmap ic <plug>(signify-motion-inner-visual)
            omap ac <plug>(signify-motion-outer-pending)
            xmap ac <plug>(signify-motion-outer-visual)
            let g:which_key_map_i.c = 'change hunk'
            let g:which_key_map_a.c = 'change hunk'
        " key map
            let g:which_key_map_LeftSqureBracket.c = 'previous change'
            let g:which_key_map_RightSqureBracket.c = 'next change'
            let g:which_key_map_LeftSqureBracket.C = 'first change'
            let g:which_key_map_RightSqureBracket.C = 'last change'

" --------------------------------------------------------------------------------

" asyncrun
    " auto open quickfix window with hight 15 (or other hight)
        let g:asyncrun_open = 10
    " open/close quickfix window
        nnoremap <F10> :call asyncrun#quickfix_toggle(10)<CR>
    " keymap
        nnoremap <leader>ac :AsyncRun cd $VIM_FILEDIR;<space>
        nnoremap <leader>ar :AsyncRun<space>
        nnoremap <leader>aR :AsyncRun!<space>
        nnoremap <leader>as :AsyncStop<CR>
        let g:which_key_map_Leader.a = {
            \ 'name' : '{asyncrun}',
            \ 'r' : ':AsyncRun',
            \ 'R' : ':AsyncRun!',
            \ 's' : ':AsyncStop',
            \ 'c' : 'AsyncRun at current dir',
            \ }
    " make file
        nnoremap <leader>mm :AsyncRun! make<CR>
        nnoremap <leader>mt :AsyncRun! make test<CR>

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

        " multiple spaces
        " most general command
            noremap <leader>t<space> :Tabularize multiple_spaces<CR>
        " repeat previous behavior
            noremap <leader>tt :Tabularize<Space><CR>

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
        let g:UltiSnipsSnippetDirectories = [g:blade_vim_config_dir.'/UltiSnips']
        let g:UltiSnipsSnippetDir = [g:blade_vim_config_dir.'/UltiSnips']
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

" defx (file tree) related
    " Avoid the white space highting issue
        autocmd FileType defx match ExtraWhitespace /^^/

    " key map (in file tree mode)
        autocmd FileType defx call s:defx_my_settings()
        function! s:defx_my_settings() abort
            " nnoremap <silent><buffer><expr> <CR>
            " \ defx#do_action('drop')
            nnoremap <silent><buffer><expr> <CR>
            \ defx#do_action('open')
            nnoremap <silent><buffer><expr> c
            \ defx#do_action('copy')
            nnoremap <silent><buffer><expr> m
            \ defx#do_action('move')
            nnoremap <silent><buffer><expr> p
            \ defx#do_action('paste')
            " nnoremap <silent><buffer><expr> l
            " \ defx#do_action('open')
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
            " use upper case `D` can avoid conflict with `vim-surround`'s
            " `nmap ds <plug>Dsurround`, and also agree with convention used
            " by `netrw`
            nnoremap <silent><buffer><expr> D
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
            " nnoremap <silent><buffer><expr> h
            " \ defx#do_action('cd', ['..']) " jump to parent dir
            nnoremap <silent><buffer><expr> -
            \ defx#do_action('cd', ['..']) " jump to parent dir
            nnoremap <silent><buffer><expr> ~
            \ defx#do_action('cd') " jump to home dir
            nnoremap <silent><buffer><expr> q
            \ defx#do_action('quit')
            nnoremap <silent><buffer><expr> <space><space>
            \ defx#do_action('toggle_select')
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

        " test position of indent
        " call defx#custom#column('indent', {
        "     \ 'indent': '✗',
        "     \ })

        " 'new': 1
        " Create new defx buffer, which will allow open several defx at
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

    " key map
        " noremap <silent> <C-M-b> :Defx `expand('%:p:h')` -search=`expand('%:p')`<CR>
        function CurrentPath() abort
            return fnameescape(expand('%:p:h'))
        endfunction

        function CurrentFile() abort
            return fnameescape(expand('%:p'))
        endfunction

        " noremap <silent> <C-M-b> :execute 'Defx ' . CurrentPath() . ' -search=' . CurrentFile()<CR>

        " use no-split Defx to override built-in `:Explore` (netrw)
        command! E execute 'Defx -split=no ' . CurrentPath()

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
    " default mode
        let g:LfDefaultMode='Fuzzy'
    " if file is open, jump to it or open it at current window
        let g:Lf_JumpToExistingWindow=0
    " show hiden content
        " let g:Lf_ShowHidden = 1
    " remeber last search
        let Lf_RememberLastSearch=0

    " the max number of recent file search
        let g:Lf_MruMacFiles=500

        let Lf_MaxCount=3000000

    " chache related
        let g:Lf_UseCache = 1    " After Vin starts, it will refresh the cache at the first time LeaderF starts (first times after lunching will be slower)
        let g:Lf_UseMemoryCache = 1     " Always refresh LeaderF if it was lunched (alwayse be solwer)
        " let g:LfNeedCacheTime = 1 " wait time before use cache

    " diaplay style
        let g:Lf_WindowPosition = 'popup' " Popup Mode is to open LeaderF in a popup, To enable popup mode
        let g:Lf_PreviewInPopup = 1 " also preview the result in a popup window.

        " Lf_hl_popup_inputText is the wincolor of input window
            highlight Lf_hl_popup_inputText guifg=#525252 guibg=#f4f3d7
        " Lf_hl_popup_window is the wincolor of content window
            highlight Lf_hl_popup_window guifg=#6c6b65 guibg=#fffde8
        " the color of the cursorline
            highlight def Lf_hl_cursorline guifg=#9849ff guibg=NONE gui=NONE

    " key map
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
    endif

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

    " root marker for workspace
        let b:coc_root_patterns = ['.root', '.svn', '.git', '.hg', '.project']

    " use with 'vim-airline'
        " enable/disable coc integration
            let g:airline#extensions#coc#enabled = 1
        " Change error symbol:
            let airline#extensions#coc#error_symbol = 'Error:'
        " Change warning symbol:
            let airline#extensions#coc#warning_symbol = 'Warning:'
        " Change error format:
            " let airline#extensions#coc#stl_format_err = '%E{[%e(#%fe)]}'
            let airline#extensions#coc#stl_format_err = '%C(L%L)'
        " Change warning format:
            let airline#extensions#coc#stl_format_warn = '%W{[%w(#%fw)]}'
            let airline#extensions#coc#stl_format_warn = '%C(L%L)'

    " key map
        let g:which_key_map_coc = {'name': '{coc.nvim}'} " to record the key map of coc.nvim

        " Use <c-space> to trigger completion.
            inoremap <silent><expr> <c-space> coc#refresh()

        " scroll in float windows
        if has('nvim-0.4.0') || has('patch-8.2.0750')
            nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
            nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
            inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
            inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
            vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
            vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
        endif

        " coc command
            " nnoremap <leader>cm :CocCommand<Space>
            " let g:which_key_map_coc.m = 'coc command'

        " Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
        " Coc only does snippet and additional edit on confirm.
            inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<Plug>delimitMateCR"
            " let g:delimitMate_expand_cr = 1

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

        " rename symbol, check changes
            nnoremap <leader>r <Plug>(coc-rename)
            nnoremap <leader>R :CocCommand workspace.inspectEdit<CR>

        " navigate diagnostics
            nmap <silent> <M-k> <Plug>(coc-diagnostic-prev)
            nmap <silent> <M-j> <Plug>(coc-diagnostic-next)

        " Use <TAB> for select selections ranges, needs server support, like: coc-tsserver, coc-python
        " since the map is in the normal mode, it won't infect the expand of snippet
            nmap <silent> <S-tab> <Plug>(coc-range-select)
            xmap <silent> <S-tab> <Plug>(coc-range-select)

        " pick color ('c' means 'coc'; the second 'c' means 'color')
            nnoremap <Leader>cc :call CocAction('pickColor')<CR>
            let g:which_key_map_coc.c = 'pick color'
        " open configure .json file ('j' means 'json')
            " nnoremap <Leader>cj :CocConfig<CR>
            " let g:which_key_map_coc.j = 'edit json file'
        " check diagnostic ('d' means 'diagnostic')
            " nnoremap <Leader>cd :CocList diagnostic<CR>
            " let g:which_key_map_coc.d = 'coc diagnostic'

        " extension manage ('e' means 'extension')
            " list extensions ('l' means list)
                " nnoremap <Leader>cel :CocList extensions<CR>
            " install extension ('i' means 'install')
                " nnoremap <Leader>cei :CocInstall<Space>
            " uninstall extensions ('u' means 'uninstall')
                " nnoremap <Leader>ceu :CocUninstall<Space>

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
                    nmap <Leader><Leader> <Plug>(coc-cursors-position)
                    nmap <M-MiddleMouse> <leftmouse><Plug>(coc-cursors-position)

                    let g:which_key_map_Leader['\'] = 'add multicursor'

                " add current visual selected range to cursors
                    xmap <silent> <Leader><Leader> <Plug>(coc-cursors-range)

                " add current word range to cursors
                    " add current words ('m' means 'multi')
                        nmap <Leader>MM <Plug>(coc-cursors-word)
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
        " code actions
        nmap <leader>cf <Plug>(coc-fix-current)
        nmap <leader>cc <Plug>(coc-codeaction-line)

        " code format
        xmap <leader>F  <Plug>(coc-format-selected)
        nmap <leader>F  <Plug>(coc-format-selected)

        " coc list
        " built-in (full built-in list see :h coc-list-sources)
        nnoremap <leader>la :CocList<CR>
        nnoremap <leader>lc :CocList commands<CR>
        nnoremap <leader>ls :CocList symbols<CR>
        nnoremap <leader>lt :CocList outline<CR>

        " provided by `coc-lists`, supported list include
        " (ref: https://github.com/neoclide/coc-lists )
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

        highlight CocInlayHint guifg=#C0BDDE
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
        let g:maplocalleader= "\<space>"

    " double press localleader to use its original function
        nnoremap <localleader><localleader> <space>

    " move
        vnoremap j gj
        vnoremap k gk
        noremap gj j
        noremap gk k
        let g:which_key_map_g.j = 'next actual line'
        let g:which_key_map_g.k = 'previous actual line'

    " copy
        " nnoremap Y y$

    " faster move
        " noremap <C-j> 5j
        " noremap <C-k> 5k
        vnoremap <C-j> 5j
        vnoremap <C-k> 5k
        noremap <C-h> 5h
        noremap <C-l> 5l

    " jump to last char without '\n' char or with '\n' char
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

        let g:which_key_map_Local_Leader.p = 'add space'
        let g:which_key_map_Local_Leader.a = {'name': '{add parenthesis}'}
        let g:which_key_map_Local_Leader.a.p = 'add round parenthesis'
        let g:which_key_map_Local_Leader.a.s = 'add square parenthesis'
        let g:which_key_map_Local_Leader.a.b = 'add brace'

    " faster substitute ('r' means 'replace')
        " substitute current line (pattern is form last search)
            " nnoremap <leader>r V:s/<C-r>//
        " substitute current line (input pattern by keyboard)
            " nnoremap <leader>R V:s/
        " substitute selected (pattern is form last search)
            " xnoremap <leader>r :s/<C-r>//
        " substitute selected (input pattern)
            " xnoremap <leader>R :s/

        " keymap manage
            let g:which_key_map_Leader.r = 'replace (with default pattern)'
            let g:which_key_map_Leader.R = 'replace (without default pattern)'


    " input original string to clipboard, can avoid the influence of auto-expand snippet ("'" or '"' means this shortcut is related to register '"')
        nnoremap <M-'> :let @" = '<left>'
        inoremap <M-'> <ESC>:let @" = '<left>'
        vnoremap <M-'> c<ESC>:let @" = '<left>'
        nnoremap <M-"> :let @" = "<left>"
        inoremap <M-"> <ESC>:let @" = "<left>"
        vnoremap <M-"> c<ESC>:let @" = "<left>"

    " enhanced search with '*' (can search selected content now, see [2015, Neil, Practical Vim, Tip 87] )
        xnoremap * :<C-u>call <SID>VSetSearch('/')<CR>/<C-R>=@/<CR><CR>
        xnoremap # :<C-u>call <SID>VSetSearch('?')<CR>?<C-R>=@/<CR><CR>

        function! s:VSetSearch(cmdtype)
            let temp = @s
            norm! gv"sy
            let @/ = '\V' . substitute(escape(@s, a:cmdtype.'\'), '\n', '\\n', 'g')
            let @s = temp
        endfunction

    " repeat the last substitute operation, also with same flag
        nnoremap & :&&<CR>
        xnoremap & :&&<CR>

    " open current file directory with Finder
        if has('mac')
            nnoremap <silent><C-M-o> :silent !open -a Finder "%:p:h"<CR>
        end

    " check vimrc and help doc
        nnoremap <silent> <leader>C :execute("edit".g:blade_vim_config_dir."/vimrc")<CR>
        nnoremap <silent> <leader>H :execute("split".g:blade_vim_config_dir."/doc/deevim.txt")<CR>
        let g:which_key_map_Leader.C = 'open vimrc'

    " check ftplugin file respective
        nnoremap <silent> <F2> :vsplit \| call execute("edit ".g:blade_vim_config_dir."/ftplugin/".&filetype.".vim")<CR>

    " open current file with Macvim
        nnoremap <silent> <F3> :silent ! mvim "%:p"<CR>

    " open current file with VS Code
        nnoremap <silent> <F4> :silent ! code "%:p"<CR>

    " create new file at the current path of the current buffer
        nnoremap <C-M-n> <ESC>:edit %:p:h/

    " tab and window
        " open current file at new tab
            nnoremap <C-M-t> :tabnew<SPACE>%<CR>
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

    " close or quit
        " close the current file in buffer (which means 'buffer wipe out')
            " nnoremap <Leader>q <ESC>:bwipeout<CR>
            " let g:which_key_map_Leader.q = 'wipe current buffer'
        " quit Vim (which means 'quit all')
            " nnoremap <Leader>Q <ESC>:quitall<CR>
            " let g:which_key_map_Leader.Q = 'quit vim'
        " close current tab
            " nnoremap <Leader>w <C-w>q
            " let g:which_key_map_Leader.w = 'close split window'
        " close current split window
            " nnoremap <Leader>W <ESC>:tabclose<CR>
            " let g:which_key_map_Leader.W = 'close tab'

    " set options
        let g:which_key_map_Local_Leader.s = {'name': '{set option}'}
        " set syntax
            nnoremap <localleader>ss <ESC>:setlocal syntax
            let g:which_key_map_Local_Leader.s.s = 'set syntax'

        " set file type
            nnoremap <localleader>st <ESC>:setlocal filetype
            let g:which_key_map_Local_Leader.s.t = 'set filetype'

        " set indent length
            nnoremap <silent> <localleader>si2 :setlocal shiftwidth=2 tabstop=2 softtabstop=2<CR>:IndentLinesReset<CR>
            nnoremap <silent> <localleader>si4 :setlocal shiftwidth=4 tabstop=4 softtabstop=4<CR>:IndentLinesReset<CR>

            let g:which_key_map_Local_Leader.s.i = {'name': '{set indent}'}
            let g:which_key_map_Local_Leader.s.i.2 = '2 spaces as indent'
            let g:which_key_map_Local_Leader.s.i.4 = '4 spaces as indent'

        " set cancel level
            nnoremap <localleader>sc :setlocal conceallevel
            let g:which_key_map_Local_Leader.s.c = 'conceallevel'

        " choose fold method
            nnoremap <localLeader>sfd :setlocal foldmethod=diff<CR>
            nnoremap <localLeader>sfe :setlocal foldmethod=expr<CR>
            nnoremap <localLeader>sfi :setlocal foldmethod=indent<CR>
            nnoremap <localLeader>sfk :setlocal foldmethod=marker<CR>
            nnoremap <localLeader>sfm :setlocal foldmethod=manual<CR>
            nnoremap <localLeader>sfs :setlocal foldmethod=syntax<CR>

            let g:which_key_map_Local_Leader.s.f = {'name': '{set fold method}', }
            let g:which_key_map_Local_Leader.s.f.d = 'diff'
            let g:which_key_map_Local_Leader.s.f.e = 'expr'
            let g:which_key_map_Local_Leader.s.f.i = 'indent'
            let g:which_key_map_Local_Leader.s.f.k = 'marker'
            let g:which_key_map_Local_Leader.s.f.m = 'manual'
            let g:which_key_map_Local_Leader.s.f.s = 'syntax'

    " terminal related (need nvim)
        " run command in terminal at current file path with a split window
            " nnoremap <localleader>t :split \| terminal cd '%:p:h';
            " let g:which_key_map_Local_Leader.t = 'run at terminal'
            nnoremap <leader>tT :split \| terminal<CR><C-w>k
            nnoremap <leader>tt :vsplit \| terminal<CR><C-w>h
            command Terminalcd execute 'SlimeSend1 cd '.expand("%:p:h")

        if has('terminal')
            " statusline support
                autocmd TerminalOpen * setlocal statusline=%{b:term_title}

            " key map in terminal mod
                " exit terminal and kill the process
                    autocmd TerminalOpen * nnoremap <buffer> gq <ESC>:bwipeout!<CR>
                    autocmd TerminalOpen * nnoremap <buffer> <leader>q <ESC>:bwipeout!<CR>
       endif

        if has('nvim')
            " statusline support
                autocmd TermOpen * setlocal statusline=%{b:term_title}

            " key map in terminal mod
                " exit terminal and kill the process
                    autocmd TermOpen * nnoremap <buffer> gq <ESC>:bwipeout!<CR>
                    autocmd TermOpen * nnoremap <buffer> <leader>q <ESC>:bwipeout!<CR>
       endif

        " To map <Esc> to exit terminal-mode
            tnoremap <Esc> <C-\><C-n>
        " To use `Shift+Meta+{h,j,k,l}` to navigate windows from any mode
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

" --------------------------------------------------------------------------------

" lilypond
    " filetype off
    " set runtimepath^=/Applications/LilyPond.app/Contents/Resources/share/lilypond/current/vim/
    " filetype on

" ================================================================================

" custom file type
    autocmd BufNewFile,BufRead *.ins setlocal filetype=tex
    autocmd BufNewFile,BufRead *.temptex setlocal filetype=temptex
    autocmd BufNewFile,BufRead *.tmux setlocal filetype=tmux
    autocmd BufNewFile,BufRead *.red setlocal filetype=reduce
    autocmd BufNewFile,BufRead zsh.snippets setlocal filetype=snippets " solve zsh.snippets will be detected as `zsh` filetype
    autocmd BufNewFile,BufRead *.sage setlocal filetype=pythoh.sage

    " solve the following problems:
    " 1. by default `*.gp` will be detected as filetype `gp` rather than `gnuplot`
    "    (so need `filetype=...` instead of `setfiletype`)
    " 2. by default `*.gnuplot` and `*.plt` cannot be detected as filetype `gnuplot`
    autocmd! BufRead,BufNewFile *.gp,*.gnuplot setlocal filetype=gnuplot
