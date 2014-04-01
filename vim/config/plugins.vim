"=========================="
"  Plugins Configuration:  "
"=========================="

"PATHOGEN BUNDLED EXTENSIONS PLUGIN: LOAD BUNDLED PLUGINS {{{"
    execute pathogen#infect()
"}}}

"EMMET: CONFIGURE WHEN ZENCODING IS ENABLED {{{
    let g:user_emmet_install_global = 0
    autocmd FileType html,css,php,aspx EmmetInstall
"}}}

"MARKDOWN VIM MODE: SETTINGS {{{
    let g:vim_markdown_folding_disabled=0
    let g:vim_markdown_initial_foldlevel=2
"}}}

"NEOCOMPLCACHE AUTOCOMPLETION PLUGIN: ENABLE, CONFIG AND SETUP OMNICOMPLETION {{{"
    let g:neocomplcache_enable_at_startup=1
    let g:neocomplcache_enable_smart_case=1
    let g:neocomplcache_min_syntax_length=3
    let g:neocomplcache_enable_insert_char_pre=1
    let g:neocomplcache_enable_underbar_completion=1
    let g:neocomplcache_enable_camel_case_completion=1
    let g:neocomplcache_wildcard_characters={'_': '-'}

    if has("autocmd") && exists("+omnifunc")
        autocmd Filetype * if &omnifunc == "" | setlocal omnifunc=syntaxcomplete#Complete | endif
    endif

    autocmd FileType c setlocal omnifunc=ccomplete#Complete
    autocmd FileType cpp setlocal omnifunc=omni#cpp#complete#Main
    autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
    autocmd FileType ruby set omnifunc=rubycomplete#Complete
    autocmd FileType php setlocal omnifunc=phpcomplete#CompletePHP

    if !exists('g:neocomplcache_omni_patterns') | let g:neocomplcache_omni_patterns={} | endif
    let g:neocomplcache_omni_patterns.c='[^.[:digit:] *\t]\%(\.\|->\)'
    let g:neocomplcache_omni_patterns.cpp='[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'
    let g:neocomplcache_omni_patterns.xml='<[^>]*'
    let g:neocomplcache_omni_patterns.html='<[^>]*'
    let g:neocomplcache_omni_patterns.xhtml='<[^>]*'
    let g:neocomplcache_omni_patterns.markdown='<[^>]*'
    let g:neocomplcache_omni_patterns.css='^\s\+\w+\|\w+[):;]?\s\+\|[@!]'
    let g:neocomplcache_omni_patterns.less='^\s\+\w+\|\w+[):;]?\s\+\|[@!]'
    let g:neocomplcache_omni_patterns.javascript='[^. \t]\.\%(\h\w*\)\?'
    let g:neocomplcache_omni_patterns.python='[^. *\t]\.\h\w*\|\h\w*::'
    let g:neocomplcache_omni_patterns.ruby='[^. *\t]\.\w*\|\h\w*::'
    let g:neocomplcache_omni_patterns.php='[^. \t]->\h\w*\|\h\w*::'
    let g:neocomplcache_omni_patterns.actionscript='[^. \t][.:]\h\w*'
    let g:neocomplcache_omni_patterns.python3='[^. *\t]\.\h\w*\|\h\w*::'
    let g:neocomplcache_omni_patterns.go='\h\w*\%.'
    let g:neocomplcache_omni_patterns.perl='\h\w*->\h\w*\|\h\w*::'
    let g:neocomplcache_omni_patterns.java='\%(\h\w*\|)\)\.'
    let g:neocomplcache_omni_patterns.objc='\h\w\+\|\h\w*\%(\.\|->\)\h\w*'
    let g:neocomplcache_omni_patterns.objj='[\[ \.]\w\+$\|:\w*$'
    let g:neocomplcache_omni_patterns.vimshell='\%(\\[^[:alnum:].-]\|[[:alnum:]@/.-_+,#$%~=*]\)\{2,}'
"}}}

"ASPNET ABSHIRE SYNTAX PLUGIN: {{{
    au BufRead,BufNewFile *.aspx,*.asmx,*.ascx,*.master set syntax=aspnet
"}}}
