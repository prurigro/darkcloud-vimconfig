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
    if exists('*mkdir')|if !isdirectory(glob("~/.vim/tags_by_filetype"))|call mkdir(glob("~/.vim/tags_by_filetype"),'p')|endif|endif
    if !filereadable(glob("~/.vim/tags"))|new|silent e ~/.vim/tags|silent w|q|endif
    if !filereadable(glob("~/.vim/snippets.json"))|new|silent e ~/.vim/snippets.json|silent w|q|endif
    if !filereadable(glob("~/.vim/filetypes.vim"))|new|silent e ~/.vim/filetypes.vim|silent w|q|endif

    "load plugins in vim/bundle/ and vim/bundle.user/
    execute pathogen#infect('bundle/{}', 'bundle.user/{}')

    "set the locations for easytags, tagbar and other plugins to look for tag files
    set tags=./.tags;,~/.vim/tags
"}}}

runtime! config/plugins/*
