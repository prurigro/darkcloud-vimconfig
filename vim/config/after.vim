"============================================================"
"                                                            "
"  Darkcloud Vim Config: settings to load after              "
"                                                            "
"  By: Kevin MacMartin (prurigro@gmail.com)                  "
"  Website: https://github.com/prurigro/darkcloud-vimconfig  "
"                                                            "
"  License: MIT                                              "
"                                                            "
"============================================================"

"load the system version of matchit if another hasn't already been
if !exists('g:loaded_matchit') && findfile('plugin/matchit.vim', &rtp) ==# ''
    runtime! macros/matchit.vim
endif

"when enabled, this will override each file type default and disable all line breaks (default: 1)
if !exists("g:disablelinebreaks")
    let g:disablelinebreaks = 1
endif

if (g:disablelinebreaks == 1)
    autocmd VimEnter * set textwidth=0
endif

"enable omnicompletion for any filetype without that has syntax highlighting
if exists("+omnifunc")
    autocmd VimEnter,Filetype * if &omnifunc == ""|setlocal omnifunc=syntaxcomplete#Complete|endif
endif

"prevent warnings when changing read-only files
autocmd FileChangedRO * nested set noreadonly

"FILETPE AND SYNTAX: {{{
    "enable more accurate syntax synchronization
    autocmd BufEnter * :syntax sync fromstart

    "set given filenames to various filetypes
    autocmd BufNewFile,BufRead *.aspx,*.asmx,*.ascx,*.master setlocal ft=aspnet
    autocmd BufNewFile,BufRead *.gradle setlocal ft=groovy
    autocmd BufNewFile,BufRead cjdroute.conf,ircd.conf,.eslintrc setlocal ft=json
    autocmd BufNewFile,BufRead *.muttrc setlocal ft=muttrc
    autocmd BufNewFile,BufRead *.neomuttrc setlocal ft=neomuttrc
    autocmd BufNewFile,BufRead *pacman.conf setlocal ft=conf
    autocmd BufNewFile,BufRead *vimpagerrc setlocal ft=vim

    "filtype specific settings
    autocmd BufEnter,FileType sh setlocal iskeyword-=.
    autocmd Filetype text,markdown,mkdc,gitcommit,notes,mail,notmuch,rst,taskreport setlocal nonumber spell nolist linebreak tabstop=2 shiftwidth=2 breakat&vim breakat-=* breakat-=. breakat-=/ breakat-=? breakat-=, breakat-=: breakat-=; breakat-=! "set some defaults for word processing
    autocmd Filetype text,gitcommit,notes,mail,notmuch,rst,taskreport setlocal wrap
    autocmd FileType tmux,taskrc setlocal commentstring=#\ %s "set the comment string to #
    autocmd FileType slrnrc setlocal commentstring=%%\ %s "set the comment string to %

    "special side/bottom-bar settings to apply when opened
    autocmd BufEnter,FileType taskreport,qf,help* setlocal nowrap nocursorcolumn "disable text wrapping and the vertical cursor line
    autocmd BufEnter,FileType extradite setlocal number "enable line numbers in extradite
    autocmd BufEnter,FileType help* setlocal nocursorline "remove the horizontal cursor line

    "load in an 80 char vertical split if the window is wider than 140 characters
    autocmd BufEnter,FileType help* if (winwidth(0) >= 110)|wincmd L|vertical resize 80|endif

    "settings for buffers in diff mode
    autocmd VimEnter,FilterWritePre * if &diff|setlocal nofoldenable|endif
    autocmd VimEnter * if &diff|wincmd H|endif

    "disable the whitespace plugin for vimfiler
    autocmd BufEnter,FileType vimfiler,mail hi ExtraWhitespace ctermbg=NONE guibg=NONE
    autocmd BufEnter,FileType mail set textwidth=0
"}}}
