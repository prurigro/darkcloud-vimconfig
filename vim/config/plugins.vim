"=========================="
"                          "
"  Plugins Configuration:  "
"                          "
"  Maintainer: Prurigro    "
"  License: MIT            "
"                          "
"=========================="

"PATHOGEN BUNDLED EXTENSIONS PLUGIN: LOAD BUNDLED PLUGINS {{{
    execute pathogen#infect('bundle/{}', 'bundle.user/{}')
"}}}

"EMMET: CONFIGURE WHEN ZENCODING IS ENABLED {{{
    let g:user_emmet_install_global=0
    let g:use_emmet_complete_tag=1
    let g:user_emmet_mode='a'

    autocmd FileType css,json,htm,html,php,aspx EmmetInstall

    if filereadable("~/.vim/snippets.json")
        let g:user_emmet_settings = webapi#json#decode(join(readfile(expand('~/.vim/snippets.json')), "\n"))
    endif
"}}}

"GUNDO: CONFIGURE SIDEBAR SETTINGS {{{
    let g:gundo_right=1
    let g:gundo_width=35
    let g:gundo_preview_height=10

    autocmd FileType gundo setlocal nocursorcolumn
"}}}

"LIGHTLINE: CONFIGURE THE LIGHTLINE STATUS BAR {{{
    let g:unite_force_overwrite_statusline = 0
    let g:vimfiler_force_overwrite_statusline = 0

    function! LLModified()
        return &ft =~ 'help' ? '' : &modified ? '+' : &modifiable ? '' : '-'
    endfunction

    function! LLReadonly()
        return &ft !~? 'help' && &readonly ? 'RO' : ''
    endfunction

    function! LLFilename()
        let fname = expand('%:t')
        return
        \   fname == '__Tagbar__' ? g:lightline.fname :
        \   fname =~ '__Gundo' ? '' :
        \   &ft == 'vimfiler' ? vimfiler#get_status_string() :
        \   &ft == 'unite' ? unite#get_status_string() :
        \       ('' != LLReadonly() ? LLReadonly() . ' ' : '') .
        \       ('' != fname ? fname : '[No Name]') .
        \       ('' != LLModified() ? ' ' . LLModified() : '')
    endfunction

    function! LLFugitive()
        try
            if expand('%:t') !~? 'Tagbar\|Gundo' && &ft !~? 'vimfiler' && exists('*fugitive#head')
                let mark = ''  " edit here for cool mark
                let _ = fugitive#head()
                return strlen(_) ? mark._ : ''
            endif
        catch
        endtry
        return ''
    endfunction

    function! LLFileformat()
        return winwidth(0) > 70 ? &fileformat : ''
    endfunction

    function! LLFiletype()
        return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype : 'no ft') : ''
    endfunction

    function! LLFileencoding()
        return winwidth(0) > 70 ? (strlen(&fenc) ? &fenc : &enc) : ''
    endfunction

    function! LLMode()
        let fname = expand('%:t')
        return fname == '__Tagbar__' ? 'Tagbar' :
        \   fname == '__Gundo__' ? 'Gundo' :
        \   fname == '__Gundo_Preview__' ? 'Gundo Preview' :
        \   &ft == 'unite' ? 'Unite' :
        \   &ft == 'vimfiler' ? 'VimFiler' :
        \   winwidth(0) > 60 ? lightline#mode() : ''
    endfunction

    let g:tagbar_status_func = 'TagbarStatusFunc'
    function! TagbarStatusFunc(current, sort, fname, ...) abort
        let g:lightline.fname = a:fname
        return lightline#statusline(0)
    endfunction

    augroup AutoSyntastic
        autocmd!
        autocmd BufWritePost * call s:syntastic()
    augroup END

    function! s:syntastic()
        SyntasticCheck
        call lightline#update()
    endfunction

    "status bar config with and without powerline fonts (defaults to off)
    if !exists("g:powerlinefonts")
        let g:powerlinefonts=0
    endif

    if (g:powerlinefonts == 1)
        let g:lightline = {
        \   'colorscheme': 'darkcloud',
        \   'active': {
        \       'left': [ [ 'mode', 'paste' ], [ 'fugitive', 'filename' ] ],
        \       'right': [ [ 'syntastic', 'lineinfo' ], ['percent'], [ 'fileformat', 'fileencoding', 'filetype' ] ]
        \   },
        \   'component_function': {
        \       'fugitive': 'LLFugitive',
        \       'filename': 'LLFilename',
        \       'fileformat': 'LLFileformat',
        \       'filetype': 'LLFiletype',
        \       'fileencoding': 'LLFileencoding',
        \       'mode': 'LLMode',
        \   },
        \   'component_expand': {
        \       'syntastic': 'SyntasticStatuslineFlag',
        \   },
        \   'component_type': {
        \       'syntastic': 'error',
        \   },
        \   'separator': {'left': '', 'right': ''},
        \   'subseparator': {'left': '', 'right': ''}
        \ }
    else
        let g:lightline = {
        \   'colorscheme': 'darkcloud',
        \   'active': {
        \       'left': [ [ 'mode', 'paste' ], [ 'fugitive', 'filename' ] ],
        \       'right': [ [ 'syntastic', 'lineinfo' ], ['percent'], [ 'fileformat', 'fileencoding', 'filetype' ] ]
        \   },
        \   'component_function': {
        \       'fugitive': 'LLFugitive',
        \       'filename': 'LLFilename',
        \       'fileformat': 'LLFileformat',
        \       'filetype': 'LLFiletype',
        \       'fileencoding': 'LLFileencoding',
        \       'mode': 'LLMode',
        \   },
        \   'component_expand': {
        \       'syntastic': 'SyntasticStatuslineFlag',
        \   },
        \   'component_type': {
        \       'syntastic': 'error',
        \   },
        \   'separator': {'left': '', 'right': ''},
        \   'subseparator': {'left': '|', 'right': '|'}
        \ }
    endif
"}}}

"MARKDOWN VIM MODE: SETTINGS {{{
    let g:vim_markdown_folding_disabled=0
    let g:vim_markdown_initial_foldlevel=2
"}}}

"SYNTASTIC: CONFIGURE SYNTAX CHECKING {{{
    if !exists("g:autostartchecker")
        let g:autostartchecker=1
    endif

    if (g:autostartchecker == 1)
        let g:syntastic_mode_map = {'mode':'active','active_filetypes':[],'passive_filetypes':[]}
        let g:syntastic_check_on_open=1
    else
        let g:syntastic_mode_map = {'mode':'passive','active_filetypes':[],'passive_filetypes':[]}
        let g:syntastic_check_on_open=0
    endif

    let g:syntastic_always_populate_loc_list=1
    let g:syntastic_auto_loc_list=1
    let g:syntastic_loc_list_height=5
"}}}

"VIM FILER: SETTINGS {{{
    let g:vimfiler_as_default_explorer=1
    let g:vimfiler_safe_mode_by_default=0
    let g:vimfiler_enable_auto_cd=1

    let g:vimfiler_tree_indentation=2
    let g:vimfiler_explorer_columns='type:time'
    let g:vimfiler_tree_closed_icon='▸'
    let g:vimfiler_tree_opened_icon='▾'
    let g:vimfiler_file_icon='-'
    let g:vimfiler_marked_file_icon='+'

    "edit files by double clicking them, and justify the cursor on the left
    autocmd FileType vimfiler setlocal nonumber wrap
    autocmd FileType vimfiler setlocal nocursorcolumn

    "open automatically if vim was run without any files
    autocmd VimEnter * if !argc() | VimFiler -quit -project | endif

    "load the list of file extensions and handlers if it exists
    if filereadable(glob("~/.vim/filetypes.vim"))
        source ~/.vim/filetypes.vim
    endif
"}}}

"NEOCOMPLCACHE AUTOCOMPLETION PLUGIN: ENABLE AND CONFIGURE BEHAVIOUR {{{
    let g:neocomplcache_enable_at_startup=1
    let g:neocomplcache_enable_smart_case=1
    let g:neocomplcache_min_syntax_length=3
    let g:neocomplcache_enable_insert_char_pre=1
    let g:neocomplcache_enable_underbar_completion=1
    let g:neocomplcache_wildcard_characters={'_': '-'}

    if !exists('g:neocomplcache_omni_patterns')
        let g:neocomplcache_omni_patterns = {}
    endif
    if !exists('g:neocomplcache_force_omni_patterns')
        let g:neocomplcache_force_omni_patterns = {}
    endif

    let g:neocomplcache_omni_patterns.c='[^.[:digit:] *\t]\%(\.\|->\)\%(\h\w*\)\?'
    let g:neocomplcache_omni_patterns.cpp='[^.[:digit:] *\t]\%(\.\|->\)\%(\h\w*\)\?\|\h\w*::\%(\h\w*\)\?'
    let g:neocomplcache_omni_patterns.xml='<[^>]*'
    let g:neocomplcache_omni_patterns.html='<[^>]*'
    let g:neocomplcache_omni_patterns.xhtml='<[^>]*'
    let g:neocomplcache_omni_patterns.markdown='<[^>]*'
    let g:neocomplcache_omni_patterns.css='^\s\+\w+\|\w+[):;]?\s\+\|[@!]'
    let g:neocomplcache_omni_patterns.less='^\s\+\w+\|\w+[):;]?\s\+\|[@!]'
    let g:neocomplcache_omni_patterns.javascript='[^. \t]\.\%(\h\w*\)\?'
    let g:neocomplcache_omni_patterns.python='[^. *\t]\.\h\w*\|\h\w*::'
    let g:neocomplcache_omni_patterns.ruby='[^. *\t]\.\w*\|\h\w*::'
    let g:neocomplcache_omni_patterns.php='[^. \t]->\%(\h\w*\)\?\|\h\w*::\%(\h\w*\)\?'
    let g:neocomplcache_omni_patterns.actionscript='[^. \t][.:]\h\w*'
    let g:neocomplcache_omni_patterns.python3='[^. *\t]\.\h\w*\|\h\w*::'
    let g:neocomplcache_omni_patterns.go='\h\w*\%.'
    let g:neocomplcache_omni_patterns.perl='\h\w*->\h\w*\|\h\w*::'
    let g:neocomplcache_omni_patterns.java='\%(\h\w*\|)\)\.'
    let g:neocomplcache_omni_patterns.objc='\h\w\+\|\h\w*\%(\.\|->\)\h\w*'
    let g:neocomplcache_omni_patterns.objj='[\[ \.]\w\+$\|:\w*$'
"}}}
