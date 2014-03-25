"==============================="
"  Vim Settings Configuration:  "
"==============================="

"COMPATIBILITY SETTINGS: DOCUMENT AND ENVIRONMENT SETTINGS {{{
    set nocompatible "enable vim specific capabilities"
    set lazyredraw "only redraw what needs to be redrawn"
    set encoding=utf-8 "set encoding"
    set fileformats=unix,dos,mac "set compatible line endings in order of preference"

    if $TERM =~ '^linux'
        set t_Co=8 "use 8 colours when a vterm is detected
    elseif !has("gui_running")
        set t_Co=256 "assume 256 colours when any other terminal is detected
    endif
"}}}

"SYNTAX: INDENTING, HIGHLIGHTING, FOLDING {{{
    filetype plugin indent on
    syntax on "turn syntax highlighting on
    set foldmethod=syntax foldcolumn=1 foldlevel=3 "configure how folding code works
    set formatoptions=roqnl12 "configure format options
"}}}

"FILETYPES: SETTINGS SPECIFIC TO A FILETYPE {{{
    au FileType mail setl spell "enable spellcheck for e-mail (mutt)
    au FileType gitcommit setl spell "enable spellcheck in git commits
    au BufNewFile,BufRead *.txt setl spell "enable spellcheck for text files (*.txt)
    au BufNewFile,BufRead *tmux.conf setf sh "set syntax for *tmux.conf to sh (bash)
    au BufNewFile,BufRead pacman.conf setf sh "set syntax for *tmux.conf to sh (bash)
    au BufNewFile,BufRead yaourtrc setf sh "set syntax for *tmux.conf to sh (bash)
    au BufNewFile,BufRead cjdroute.conf setf javascript "set syntax for *cjdroute.conf to javascript
    au BufNewFile,BufRead ircd.conf setf javascript "set syntax for *ircd.conf to javascript
"}}}

"GENERAL: ANYTHING THAT DOESN'T FIT ELSEWHERE {{{
    set cursorline cursorcolumn "enable row/column highlighting
    set splitright "add new tiles on the right (and not left) when added
    set scrolloff=1 sidescrolloff=1 "how many vertical and horizontal characters left before scrolling
    set number "enable line numbers
    set list listchars=tab:>-,trail:- "display whitespace
    set nowrap "disable line wrapping
    set autochdir "current dir is file dir
    set backspace=indent,eol,start "enables backspacing
    set history=75 "undo history
    set mouse=a "enables mouse
    set whichwrap=b,s,<,>,[,] "allow the cursor to wrap lines
    set clipboard=unnamedplus "enable copy/paste support between vim and xorg's middle-click style clipboard
    set textwidth=0 "the default width text will go before breaking when line breaks are enabled
    set nolinebreak "disable linebreaks, though this will be overridden by filetype plugins
    set showmatch "show matching open bracket when closed bracket is inserted
    set matchtime=5 "the amount of time the matching bracket will highlight
    set smarttab expandtab autoindent tabstop=4 shiftwidth=4 "configure tabs
    set laststatus=2 showcmd statusline=%F%m%r%h%w[%L][%{&ff}]%y[%p%%][%04l,%04v] "statusline init and config
    set hlsearch incsearch ignorecase smartcase "configure search
    set guicursor+=a:blinkon0 "disable the blinking cursor

    "load the system version of matchit if another hasn't already been
    if !exists('g:loaded_matchit') && findfile('plugin/matchit.vim', &rtp) ==# ''
        runtime! macros/matchit.vim
    endif

    "enable menu tab completion, configure its behaviour and set configure suffixes to reduce priority for and ignore"
    set completeopt=longest,menuone
    set wildmenu
    set wildmode=list:longest,full
    set wildignore=*.dll,*.o,*.obj,*.bak,*.exe,*.pyc,*.jpg,*.gif,*.png
    set suffixes=.bak,~,.swp,.o,.info,.aux,.log,.dvi,.bbl,.blg,.brf,.cb,.ind,.idx,.ilg,.inx,.out,.toc
"}}}

"GVIM: GUI CONFIG OPTIONS {{{
    set guioptions-=T "remove the toolbar

    if &wrap
        set go-=b "disable the bottom scrollbar iff text wrapping is enabled
    else
        set go+=b "enable the bottom scrollbar iff text wrapping is disabled
    endif
"}}}
