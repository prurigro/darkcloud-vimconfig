let g:gutentags_cache_dir = '~/.vim/gutentags'

"prevent automatically generating the tagfile and syntax highlighting tags (default: 0)
if !exists("g:disableautotags")
    let g:gutentags_enabled = 0
endif
