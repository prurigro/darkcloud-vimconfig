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

"disable linebreaks by default or override all of them (default: 1)
if !exists("g:disablelinebreaks")
    let g:disablelinebreaks=1
endif
if (g:disablelinebreaks == 1)
    autocmd VimEnter * set tw=0
endif

"enable omnicompletion for any filetype without that has syntax highlighting
if has("autocmd") && exists("+omnifunc")
    autocmd VimEnter,Filetype * if &omnifunc == ""|setlocal omnifunc=syntaxcomplete#Complete|endif
endif

"FILETPE AND SYNTAX: {{{
    "set given filenames to various filetypes
    autocmd BufNewFile,BufRead *.aspx,*.asmx,*.ascx,*.master setlocal ft=aspnet
    autocmd BufNewFile,BufRead *.gradle setlocal ft=groovy
    autocmd BufNewFile,BufRead *muttrc setlocal ft=muttrc
    autocmd BufNewFile,BufRead *vimpagerrc setlocal ft=vim
    autocmd BufNewFile,BufRead *ircd.conf setlocal ft=json
    autocmd BufNewFile,BufRead pacman.conf,yaourtrc setlocal ft=sh
    autocmd BufNewFile,BufRead cjdroute.conf,cjdmaid.conf setlocal ft=json

    "filename specific settings
    autocmd BufEnter,BufRead PKGBUILD setlocal iskeyword-=.

    "filtype specific settings
    autocmd Filetype text,mkd,mkdc,gitcommit,notes,mail,notmuch,rst,taskreport setlocal nonumber spell nolist wrap linebreak breakat&vim breakat-=* breakat-=. breakat-=/ breakat-=? breakat-=, breakat-=: breakat-=; breakat-=! "set some defaults for word processing
    autocmd FileType help* wincmd L "help windows always open vertically
    autocmd FileType help* vertical resize 80 "set the window size to 80 cols
    autocmd FileType help* setlocal nocursorline "remove the horizontal cursor line
    autocmd FileType tmux,taskrc setlocal commentstring=#\ %s "remove the horizontal cursor line
    autocmd BufEnter,FileType taskreport,qf,help* setlocal nowrap nocursorcolumn "disable text wrapping and the vertical cursor line
    autocmd BufEnter,FileType extradite setlocal number "enable line numbers in extradite

    "settings for buffers in diff mode
    autocmd VimEnter,FilterWritePre * if &diff|setlocal nofoldenable|endif
    autocmd VimEnter * if &diff|wincmd H|endif

    "disable the whitespace plugin for vimfiler
    autocmd BufEnter,FileType vimfiler hi ExtraWhitespace ctermbg=NONE guibg=NONE
"}}}
