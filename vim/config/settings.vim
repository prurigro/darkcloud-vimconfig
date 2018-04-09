"============================================================"
"                                                            "
"  Darkcloud Vim Config: main settings                       "
"                                                            "
"  By: Kevin MacMartin (prurigro@gmail.com)                  "
"  Website: https://github.com/prurigro/darkcloud-vimconfig  "
"                                                            "
"  License: MIT                                              "
"                                                            "
"============================================================"

"GVIM SETTINGS: {{{
    set guicursor+=a:blinkon0 "disable the blinking cursor
    set guioptions=e "use the gui to render the list of open tabs
    set guioptions+=g "make inactive menu items grey
    set guioptions+=i "have the gui use the vim icon
    set guioptions+=p "enable pointer callbacks for X11 (required by some WMs)
    set guioptions+=h "prevent the cursor jumping to the longest line while scrolling
    set winaltkeys=no "don't select the menu when pressing the alt-keys
"}}}

"COMPATIBILITY SETTINGS: {{{
    set nocompatible "disable vi-compatibility settings
    set backspace=indent,eol,start "enables/configures standard backspace behaviour

    "use the '*' register as well as the the '+' register if it's available too
    set clipboard=unnamed

    if has('unnamedplus')
        set clipboard+=unnamedplus
    endif

    "fancy mouse reporting with xterm2 fallback
    if !has('nvim')
        if has("mouse_sgr")
            set ttymouse=sgr
        else
            set ttymouse=xterm2
        endif
    endif

    set mouse=a "enables mouse functionality with extended capabilities

    "8 colours in $TERM=linux, 256 elsewhere
    if $TERM =~ '^linux$'|set t_Co=8|elseif !has("gui_running")|set t_Co=256|endif
    set ttyfast "assume a fast connection to the terminal for better rendering

    "configure to primarily use utf8
    if has("multi_byte")
        if &termencoding == ""
            let &termencoding = &encoding
        endif

        set encoding=utf-8
        setglobal fileencoding=utf-8
    endif

    set fileformats=unix,dos,mac "set compatible line endings in order of preference
"}}}

"GENERAL SETTINGS: {{{
    "FILE: {{{
        filetype plugin indent on "enable filetype-based auto-indentation
        syntax on "enable syntax highlighting
        set synmaxcol=300 "disable syntax highlighting on a given line after 300 characters
        set formatoptions=roqnl12 "how automatic formatting is to be done
        set diffopt=foldcolumn:0,filler "vimdiff default settings
        set foldmethod=syntax foldcolumn=1 foldlevel=2 "fold layers 3 and deeper
        set nofoldenable "disable folds by default
        set tw=80 "set the default text width to 80 when nothing overrides this
    "}}}

    "USER INTERFACE: {{{
        set laststatus=2 showcmd statusline=%F%m%r%h%w[%L][%{&ff}]%y[%p%%][%04l,%04v] "statusline init and config
        set winheight=1 winminheight=1 "set the minimum window height to 1 lines
        set winwidth=1 winminwidth=1 "set the minimum window width to 1 columns
        set noshowmode "don't display mode information handled by lightline
        set lazyredraw "don't redraw the screen while macros are executing
        set noequalalways "don't force splits to be equal in size when closing or opening one
        set number "enable line numbers
        set nowrap "disable line wrapping
        set cursorline cursorcolumn "enable row/column highlighting
        set visualbell "notify visually instead of with an audible bell
        set splitright "add new tiles on the right (and not left) when added
        set scrolloff=0 sidescrolloff=0 "start scrolling if the cursor is one position away from the edge
        set list listchars=tab:>-,trail:- "display tabs as: >--- and trailing spaces as: -
        set showmatch "show matching open bracket when closed bracket is inserted
        set matchtime=5 "the amount of time before the matching bracket will highlight
        let &showbreak = "" "character to prepend to wrapped lines when linewrapping is enabled

        "enable tab completion in command mode and configure how it handles extensions
        set completeopt=longest,menuone
        set wildmenu
        set wildmode=list:longest,full
        set wildignore=*.dll,*.o,*.obj,*.bak,*.exe,*.pyc,*.jpg,*.gif,*.png
        set suffixes=.bak,~,.swp,.o,.info,.aux,.log,.dvi,.bbl,.blg,.brf,.cb,.ind,.idx,.ilg,.inx,.out,.toc
    "}}}

    "BEHAVIOUR: {{{
        set history=250 "size of the undo history
        set whichwrap=b,s,<,>,[,] "scrolling left/right off current line wraps to the next/previous
        set smarttab expandtab autoindent tabstop=4 shiftwidth=4 "configure tabs
        set hlsearch incsearch ignorecase smartcase "configure how search behaves
        set timeout timeoutlen=500 "how long before timing out for mappings
        set ttimeout ttimeoutlen=100 "how long before timing out for terminal key codes

        "create ~/.vim/swap if necessary, then use as default swap file location
        if exists('*mkdir') && !isdirectory($HOME.'/.vim/swap')
            call mkdir($HOME.'/.vim/swap','p')
        endif

        set directory=$HOME/.vim/swap,.,/var/tmp,/tmp

        "FUNCTIONS: {{{
            "enable the auto-creation of missing folders in a save path
            if !exists('*s:MakeNewDir')
                function s:MakeNewDir(fullpath, buf)
                    if empty(getbufvar(a:buf,'&buftype')) && a:fullpath!~#'\v^\w+\:\/'
                        let dirpath = fnamemodify(a:fullpath,':h')

                        if !isdirectory(dirpath)
                            call mkdir(dirpath,'p')
                        endif
                    endif
                endfunction

                augroup WriteDir
                    autocmd!
                    autocmd BufWritePre * :call s:MakeNewDir(expand('<afile>'),+expand('<abuf>'))
                augroup END
            endif

            "update the current filetype when a file is renamed
            augroup RenameCheckFiletype
                autocmd!
                autocmd BufFilePost * filetype detect
            augroup END

            "functions to create a split using 33% and 66% of the height
            function s:SPResize33()
                sp|wincmd =|q
            endfunction

            function s:sp33()
                sp|call s:SPResize33()|wincmd j
            endfunction

            command! -buffer SP33 call s:sp33()

            function s:sp66()
                sp|wincmd j|call s:SPResize33()
            endfunction

            command! -buffer SP66 call s:sp66()

            "functions to create a vertical split using 33% and 66% width
            function s:VSResize66()
                vs|wincmd =|q
            endfunction

            function s:vs66()
                vs|call s:VSResize66()
            endfunction

            command! -buffer VS66 call s:vs66()

            function s:vs33()
                vs|wincmd h|call s:VSResize66()|wincmd l
            endfunction

            command! -buffer VS33 call s:vs33()
        "}}}
    "}}}
"}}}
