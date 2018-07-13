let g:easytags_suppress_ctags_warning = 1

"set the temporary directory for ctags
if isdirectory(glob("/tmp"))
    let $TMPDIR = '/tmp'
endif

"put general tags in ~/.vim/tags
if filereadable(glob("~/.vim/tags"))
    let g:easytags_file = '~/.vim/tags'
endif

"put filetype-specific tags in ~/.vim/tags_by_filetype/
if isdirectory(glob("~/.vim/tags_by_filetype"))
    let g:easytags_by_filetype = '~/.vim/tags_by_filetype'
endif

"prevent automatically generating the tagfile and syntax highlighting tags (default: 0)
if !exists("g:disableautotags")
    let g:disableautotags = 0
endif

if (g:disableautotags == 1)
    let g:easytags_auto_update = 0
    let g:easytags_auto_highlight = 0
else
    let g:easytags_auto_update = 1
    let g:easytags_auto_highlight = 1
endif
