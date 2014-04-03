"==============================="
"                               "
"  Vim Settings Configuration:  "
"                               "
"  Maintainer: Prurigro         "
"  License: MIT                 "
"                               "
"==============================="

"COMPATIBILITY SETTINGS: DOCUMENT AND ENVIRONMENT SETTINGS {{{
    set nocompatible "enable vim specific capabilities
    set encoding=utf-8 "set encoding
    set fileformats=unix,dos,mac "set compatible line endings in order of preference
    set backspace=indent,eol,start "enables backspacing
    set mouse=a "enables extended mouse capabilities
    set clipboard=unnamedplus "enable copy/paste support between vim and the environment's clipboard

    set lazyredraw "only redraw what needs to be redrawn
    set ttyfast "assume a fast connection to the terminal for better rendering

    if $TERM =~ '^linux'
        set t_Co=8 "use 8 colours when a vterm is detected
    elseif !has("gui_running")
        set t_Co=256 "assume 256 colours when any other terminal is detected
        set ttymouse=xterm2 "sets the type of mouse to one we can expect in most gui envs
    endif
"}}}

"GENERAL: ANYTHING THAT DOESN'T FIT ELSEWHERE {{{
    set number "enable line numbers
    set nowrap "disable line wrapping
    set cursorline cursorcolumn "enable row/column highlighting
    set visualbell "notify visually instead of with an audible bell
    set splitright "add new tiles on the right (and not left) when added
    set scrolloff=1 sidescrolloff=1 "start scrolling if the cursor is one position away from the edge
    set list listchars=tab:>-,trail:- "display tabs as >--- and trailing spaces as -
    set autochdir "current dir is file dir
    set history=250 "undo history
    set timeoutlen=1000 ttimeoutlen=0 "shorten the timeout length of escapes
    set whichwrap=b,s,<,>,[,] "allow the cursor to wrap lines
    set textwidth=0 "set an unlimited text width before breaking the line when line breaks are enabled
    set nolinebreak "disable linebreaks, though this will be overridden by filetype plugins
    set showmatch "show matching open bracket when closed bracket is inserted
    set matchtime=5 "the amount of time the matching bracket will highlight
    set smarttab expandtab autoindent tabstop=4 shiftwidth=4 "configure tabs
    set laststatus=2 showcmd statusline=%F%m%r%h%w[%L][%{&ff}]%y[%p%%][%04l,%04v] "statusline init and config
    set hlsearch incsearch ignorecase smartcase "configure search
    let &showbreak="+++ " "when linewrap is enabled, show wrapped lines with +++

    "load the system version of matchit if another hasn't already been
    if !exists('g:loaded_matchit') && findfile('plugin/matchit.vim', &rtp) ==# ''
        runtime! macros/matchit.vim
    endif

    "enable tab completion in command mode and configure how it handles extensions
    set completeopt=longest,menuone
    set wildmenu
    set wildmode=list:longest,full
    set wildignore=*.dll,*.o,*.obj,*.bak,*.exe,*.pyc,*.jpg,*.gif,*.png
    set suffixes=.bak,~,.swp,.o,.info,.aux,.log,.dvi,.bbl,.blg,.brf,.cb,.ind,.idx,.ilg,.inx,.out,.toc
"}}}

"FILETYPES AND SYNTAX: SETTINGS FOR FILETYPES AND ASSOCIATED SYNTAX {{{
    filetype plugin indent on
    syntax on "turn syntax highlighting on

    "set matching filenames to the given file types
    autocmd BufNewFile,BufRead *.aspx,*.asmx,*.ascx,*.master setf aspnet
    autocmd BufNewFile,BufRead *tmux.conf,pacman.conf,yaourtrc setf sh
    autocmd BufNewFile,BufRead cjdroute.conf,ircd.conf setf javascript

    "enable spellcheck by default when using given filetypes and extensions
    autocmd FileType gitcommit,notes,mail,notmuch,mkd,text setlocal spell
    autocmd FileType notes,mail,notmuch,mkd,text setlocal nonumber

    "enable omnicompletion for any filetype without that has syntax highlighting
    if has("autocmd") && exists("+omnifunc")
        autocmd VimEnter,Filetype *
            \   if &omnifunc == "" |
            \       setlocal omnifunc=syntaxcomplete#Complete |
            \   endif
    endif

    set formatoptions=roqnl12
    set foldmethod=syntax foldcolumn=1 foldlevel=3 "fold layers 3 or more deep

    if &diff
        autocmd VimEnter * windo setlocal nofoldenable "disable folding by default in vimdiff
    endif
"}}}

"GVIM: GUI CONFIG OPTIONS {{{
    set guicursor+=a:blinkon0 "disable the blinking cursor
    set guioptions=aegi
"}}}
