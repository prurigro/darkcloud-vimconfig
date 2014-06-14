"============================================================"
"                                                            "
"  Darkcloud Vim Config: main settings                       "
"                                                            "
"  Maintainer: Kevin MacMartin (prurigro@gmail.com)          "
"  Website: https://github.com/prurigro/darkcloud-vimconfig  "
"                                                            "
"  License: MIT                                              "
"                                                            "
"============================================================"

"COMPATIBILITY SETTINGS: DOCUMENT AND ENVIRONMENT SETTINGS {{{
    set nocompatible "enable vim specific capabilities
    set encoding=utf-8 "set encoding
    set fileformats=unix,dos,mac "set compatible line endings in order of preference
    set backspace=indent,eol,start "enables backspacing
    set clipboard=unnamedplus "enable copy/paste support between vim and the environment's clipboard
    set lazyredraw "only redraw what needs to be redrawn
    set ttyfast "assume a fast connection to the terminal for better rendering

    set mouse=a "enables mouse functionality with extended capabilities
    if has("mouse_sgr")
        set ttymouse=sgr "use mouse handling that emits sgr-style reporting if it's available
    else
        set ttymouse=xterm2 "fall back to xterm2-style reporting if sgr isn't available
    endif

    if $TERM =~ '^linux'
        set t_Co=8 "use 8 colours when a vterm is detected
    elseif !has("gui_running")
        set t_Co=256 "assume 256 colours when any other terminal is detected
    endif
"}}}

"GENERAL: ANYTHING THAT DOESN'T FIT ELSEWHERE {{{
    set number "enable line numbers
    set nowrap "disable line wrapping
    set cursorline cursorcolumn "enable row/column highlighting
    set visualbell "notify visually instead of with an audible bell
    set splitright "add new tiles on the right (and not left) when added
    set scrolloff=0 sidescrolloff=0 "start scrolling if the cursor is one position away from the edge
    set list listchars=tab:>-,trail:- "display tabs as: >--- and trailing spaces as: -
    set autochdir "current dir is file dir
    set history=250 "undo history
    set timeoutlen=800 ttimeoutlen=0 "shorten the timeout length of escapes
    set whichwrap=b,s,<,>,[,] "allow the cursor to wrap lines
    set showmatch "show matching open bracket when closed bracket is inserted
    set matchtime=5 "the amount of time the matching bracket will highlight
    set smarttab expandtab autoindent tabstop=4 shiftwidth=4 "configure tabs
    set laststatus=2 showcmd statusline=%F%m%r%h%w[%L][%{&ff}]%y[%p%%][%04l,%04v] "statusline init and config
    set hlsearch incsearch ignorecase smartcase "configure search
    set diffopt=foldcolumn:0,filler "vimdiff default settings
    set formatoptions=roqnl12 "how automatic formatting is to be done
    set foldmethod=syntax foldcolumn=1 foldlevel=3 "fold layers 3 or more deep
    let &showbreak="_" "highlight wrapped lines when linewrap is enabled

    "enable tab completion in command mode and configure how it handles extensions
    set completeopt=longest,menuone
    set wildmenu
    set wildmode=list:longest,full
    set wildignore=*.dll,*.o,*.obj,*.bak,*.exe,*.pyc,*.jpg,*.gif,*.png
    set suffixes=.bak,~,.swp,.o,.info,.aux,.log,.dvi,.bbl,.blg,.brf,.cb,.ind,.idx,.ilg,.inx,.out,.toc
"}}}

"FILETYPES AND SYNTAX: SETTINGS FOR FILETYPES AND ASSOCIATED SYNTAX {{{
    filetype plugin indent on
    syntax on

    "set given filenames to various filetypes
    au BufNewFile,BufRead *.aspx,*.asmx,*.ascx,*.master setf aspnet
    au BufNewFile,BufRead *.gradle setf groovy
    au BufNewFile,BufRead *.muttrc setf muttrc
    au BufNewFile,BufRead pacman.conf,yaourtrc setf sh
    au BufNewFile,BufRead archversion.conf setf archversion
    au BufNewFile,BufRead cjdroute.conf,cjdmaid.conf setf json
"}}}

"GVIM: GUI CONFIG OPTIONS {{{
    set guicursor+=a:blinkon0 "disable the blinking cursor
    set guioptions=aegi
"}}}
