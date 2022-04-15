"============================================================"
"                                                            "
"  Darkcloud Vim Config: plugin settings                     "
"                                                            "
"  By: Kevin MacMartin (prurigro@gmail.com)                  "
"  Website: https://github.com/prurigro/darkcloud-vimconfig  "
"                                                            "
"  License: MIT                                              "
"                                                            "
"============================================================"

"use utf-8 encoding to load the script as it contains utf-8 characters
scriptencoding utf-8

"INITIALIZE PLUGINS: {{{
    "create missing plugin config files and directories
    if exists('*mkdir') && !isdirectory(glob("~/.vim/gutentags"))
        call mkdir(glob("~/.vim/gutentags"),'p')
    endif

    if !filereadable(glob("~/.vim/filetypes.vim"))
        new|silent e ~/.vim/filetypes.vim|silent w|q
    endif

    "load plugins in vim/bundle/ and vim/bundle.user/
    execute pathogen#infect('bundle/{}', 'bundle.user/{}')
"}}}

runtime! config/plugins/*
