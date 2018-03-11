let g:neocomplete#enable_at_startup=1
let g:neocomplete#enable_smart_case=1
let g:neocomplete#sources#syntax#min_keyword_length=3

if !exists('g:neocomplete#sources#omni#input_patterns')
    let g:neocomplete#sources#omni#input_patterns = {}
endif

let g:neocomplete#sources#omni#input_patterns.c='[^.[:digit:] *\t]\%(\.\|->\)\%(\h\w*\)\?'
let g:neocomplete#sources#omni#input_patterns.cpp='[^.[:digit:] *\t]\%(\.\|->\)\%(\h\w*\)\?\|\h\w*::\%(\h\w*\)\?'
let g:neocomplete#sources#omni#input_patterns.xml='<[^>]*'
let g:neocomplete#sources#omni#input_patterns.html='<[^>]*'
let g:neocomplete#sources#omni#input_patterns.xhtml='<[^>]*'
let g:neocomplete#sources#omni#input_patterns.markdown='<[^>]*'
let g:neocomplete#sources#omni#input_patterns.css='^\s\+\w+\|\w+[):;]?\s\+\|[@!]'
let g:neocomplete#sources#omni#input_patterns.less='^\s\+\w+\|\w+[):;]?\s\+\|[@!]'
let g:neocomplete#sources#omni#input_patterns.javascript='[^. \t]\.\%(\h\w*\)\?'
let g:neocomplete#sources#omni#input_patterns.json='[^. \t]\.\%(\h\w*\)\?'
let g:neocomplete#sources#omni#input_patterns.python='[^. *\t]\.\h\w*\|\h\w*::'
let g:neocomplete#sources#omni#input_patterns.ruby='[^. *\t]\.\w*\|\h\w*::'
let g:neocomplete#sources#omni#input_patterns.php='[^. \t]->\%(\h\w*\)\?\|\h\w*::\%(\h\w*\)\?'
let g:neocomplete#sources#omni#input_patterns.actionscript='[^. \t][.:]\h\w*'
let g:neocomplete#sources#omni#input_patterns.python3='[^. *\t]\.\h\w*\|\h\w*::'
let g:neocomplete#sources#omni#input_patterns.go='\h\w*\%.'
let g:neocomplete#sources#omni#input_patterns.perl='\h\w*->\h\w*\|\h\w*::'
let g:neocomplete#sources#omni#input_patterns.java='\%(\h\w*\|)\)\.'
let g:neocomplete#sources#omni#input_patterns.objc='\h\w\+\|\h\w*\%(\.\|->\)\h\w*'
let g:neocomplete#sources#omni#input_patterns.objj='[\[ \.]\w\+$\|:\w*$'
