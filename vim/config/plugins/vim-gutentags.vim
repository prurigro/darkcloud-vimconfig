let g:gutentags_cache_dir = '~/.vim/gutentags'

let g:gutentags_file_list_command = {
    \ 'markers': {
    \ '.git': 'git ls-files',
    \ },
\ }

"prevent automatically generating the tagfile and syntax highlighting tags (default: 0)
if exists("g:disableautotags") && g:disableautotags == 1
    let g:gutentags_enabled = 0
endif
