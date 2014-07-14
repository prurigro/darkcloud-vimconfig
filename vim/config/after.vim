"============================================================"
"                                                            "
"  Darkcloud Vim Config: settings to load after all else     "
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
    autocmd VimEnter * set tw=0 nolinebreak
endif

"enable omnicompletion for any filetype without that has syntax highlighting
if has("autocmd") && exists("+omnifunc")
    autocmd VimEnter,Filetype * if &omnifunc == ""|setlocal omnifunc=syntaxcomplete#Complete|endif
endif

"FILETPE AND SYNTAX: {{{
    "misc filtype specific settings
    autocmd FileType gitcommit,notes,mail,notmuch,text setlocal spell
    autocmd FileType notes,mail,notmuch,mkd,text setlocal nonumber
    autocmd FileType mail,notmuch,text setlocal wrap
    autocmd FileType notes setlocal tw=80
    autocmd FileType help* wincmd L "help windows always open vertically
    autocmd FileType help* vertical resize 80 "set the window size to 80 cols
    autocmd FileType help* setlocal nocursorline "remove the horizontal cursor line
    autocmd BufEnter,FileType qf,help* setlocal nowrap nocursorcolumn "disable text wrapping and the vertical cursor line
    autocmd BufEnter,FileType extradite setlocal number

    "settings for buffers in diff mode
    autocmd VimEnter,FilterWritePre * if &diff|setlocal nofoldenable|endif
    autocmd VimEnter * if &diff|wincmd H|endif

    "disable the whitespace plugin for vimfiler
    autocmd BufEnter,FileType vimfiler hi ExtraWhitespace ctermbg=NONE guibg=NONE
"}}}
