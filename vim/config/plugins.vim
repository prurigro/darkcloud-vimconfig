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
"
" Acknowledgements:
"
"  The Tabular TableFormat() function is taken from the
"  vim-markdown project by plasticboy, which can be found
"  at https://github.com/plasticboy/vim-markdown and is
"  licensed with the MIT license.
"

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

"BOOKMARKS: {{{
    let g:bookmark_sign = '★'
    let g:bookmark_annotation_sign = '📌'
"}}}

"EASYTAGS: {{{
    let g:easytags_suppress_ctags_warning=1
    if !filereadable(glob("~/.vim/tags"))|let g:easytags_file='~/.vim/tags'|endif
    if !isdirectory(glob("~/.vim/tags_by_filetype"))|let g:easytags_by_filetype='~/.vim/tags_by_filetype'|endif

    "prevent automatically generating the tagfile and syntax highlighting tags (default: 0)
    if !exists("g:disableautotags")
        let g:disableautotags=0
    endif
    if (g:disableautotags == 1)
        let g:easytags_auto_update=0
        let g:easytags_auto_highlight=0
    else
        let g:easytags_auto_update=1
        let g:easytags_auto_highlight=1
    endif
"}}}

"EMMET: {{{
    let g:user_emmet_install_global=0
    let g:use_emmet_complete_tag=1
    let g:user_emmet_mode='a'
    let g:user_emmet_leader_key='<A-m>'

    autocmd FileType aspnet,html,xhtml,php,css,javascript,json EmmetInstall

    if filereadable("~/.vim/snippets.json")
        let g:user_emmet_settings = webapi#json#decode(join(readfile(expand('~/.vim/snippets.json')), "\n"))
    endif
"}}}

"GOYO: {{{
    autocmd VimEnter,Filetype *
        \ let g:goyo_width = &textwidth |
        \ if (g:goyo_width == 0) |
        \     let g:goyo_width = max(map(getline(1,'$'), 'len(v:val)')) |
        \     if (g:goyo_width < 80) |
        \         let g:goyo_width = 80 |
        \     endif |
        \ endif
"}}}

"GUNDO: {{{
    let g:gundo_right=1
    let g:gundo_width=35
    let g:gundo_preview_height=10

    autocmd FileType gundo setlocal nocursorcolumn
"}}}

"INCSEARCH: {{{
    "use incsearch in place of the default search
    map /  <Plug>(incsearch-forward)
    map ?  <Plug>(incsearch-backward)
    map g/ <Plug>(incsearch-stay)

    "n and N behavioru is consistant
    let g:incsearch#consistent_n_direction = 1
"}}}

"JSON: {{{
    let g:vim_json_warnings=0
    let g:vim_json_syntax_conceal=0
"}}}

"MATCHTAGALWAYS: {{{
    let g:mta_filetypes = {'aspnet':1, 'html':1, 'xhtml':1, 'php':1, 'xml':1, 'jinja':1}
"}}}

"NEOCOMPLCACHE AUTOCOMPLETION PLUGIN: {{{
    let g:neocomplcache_enable_at_startup=1
    let g:neocomplcache_enable_smart_case=1
    let g:neocomplcache_min_syntax_length=3
    let g:neocomplcache_enable_insert_char_pre=0
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
    let g:neocomplcache_omni_patterns.json='[^. \t]\.\%(\h\w*\)\?'
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

"SIGNIFY: {{{
    let g:signify_sign_add='+'
    let g:signify_sign_change='!'
    let g:signify_sign_delete='-'
    let g:signify_sign_delete_first_line='~'
"}}}

"SYNTASTIC: {{{
    "autostart syntax checking when vim opens to a compatible filetype (default: 0)
    if !exists("g:autostartchecker")
        let g:autostartchecker=0
    endif

    if &diff
        let g:autostartchecker=0
    else
        if (g:autostartchecker == 1)
            let g:syntastic_mode_map={'mode':'active','active_filetypes':[],'passive_filetypes':[]}
            let g:syntastic_check_on_open=1
        else
            let g:syntastic_mode_map={'mode':'passive','active_filetypes':[],'passive_filetypes':[]}
            let g:syntastic_check_on_open=0
        endif

        let g:syntastic_quiet_messages={
            \ 'regex':[
                \ 'package\ [^\ ]*\ does not exist.*',
                \ 'cannot find symbol.*',
                \ '.*method does not override or implement a method from a supertype.*',
                \ '.*fatal error:[^:]*: No such file or directory.*',
                \ '.*line too long.*'
            \ ]}

        let g:syntastic_check_on_wq=0
        let g:syntastic_always_populate_loc_list=1
        let g:syntastic_auto_loc_list=1
        let g:syntastic_loc_list_height=5
    endif

    "function to enable syntastic and set check_on_open on
    function s:SyntasticToggleOn()
        let g:syntastic_check_on_open=1
        if (g:syntastic_mode_map.mode == "passive")
            SyntasticToggleMode
        endif
    endfunction
    command! -buffer SyntasticToggleOn call s:SyntasticToggleOn()

    "function to disable syntastic and set check_on_open off
    function s:SyntasticToggleOff()
        let g:syntastic_check_on_open=0
        if (g:syntastic_mode_map.mode == "active")
            SyntasticToggleMode
        endif
    endfunction
    command! -buffer SyntasticToggleOff call s:SyntasticToggleOff()

    "function to toggle syntastic and check_on_open on and off together
    function s:SyntasticToggleAll()
        if (g:syntastic_check_on_open == 1)
            call s:SyntasticToggleOff()
        else
            call s:SyntasticToggleOn()
        endif
    endfunction
    command! -buffer SyntasticToggleAll call s:SyntasticToggleAll()
"}}}

"TABULAR: {{{
    "format markdown tables
    function! s:TableFormat()
        let l:pos = getpos('.')
        normal! {
        call search('|')
        normal! j
        s/[^|]//g
        Tabularize /|
        s/ /-/g
        call setpos('.', l:pos)
    endfunction
    command! -buffer TableFormat call s:TableFormat()
"}}}

"TAGBAR: {{{
    "autostart tagbar when vim opens to a compatible filetype (default: 0)
    if !exists("g:autostarttagbar")
        let g:autostarttagbar=0
    endif
    if !&diff
        if (g:autostarttagbar == 1)
            autocmd VimEnter * nested :call tagbar#autoopen(1)
        endif
    endif

    let g:tagbar_sort=0
    let g:tagbar_compact=1
    let g:tagbar_singleclick=1
    let g:tagbar_width=35
    let g:tagbar_autofocus=1
"}}}

"TCOMMAND: {{{
    let g:tcommand#include_history=0
"}}}

"TCOMMENT: {{{
    let g:tcomment#rstrip_on_uncomment=2 "remove right-hand whitespace from all lines on uncomment
"}}}

"VIM FILER: {{{
    "autostart filer when vim opens to an empty buffer (default: 1)
    if !exists("g:autostartfiler")|let g:autostartfiler=1|endif
    if (g:autostartfiler == 1)
        autocmd VimEnter * if !argc() | VimFiler -quit -project | endif
    endif

    let g:vimfiler_as_default_explorer=1
    let g:vimfiler_safe_mode_by_default=0
    let g:vimfiler_enable_auto_cd=1

    let g:vimfiler_tree_indentation=2
    let g:vimfiler_explorer_columns='type:time'
    let g:vimfiler_tree_closed_icon='▸' "['▶', '▼'], ['▸', '▾'], ['▷', '◢']
    let g:vimfiler_tree_opened_icon='▾'
    let g:vimfiler_file_icon='-'
    let g:vimfiler_marked_file_icon='+'

    "edit files by double clicking them, and justify the cursor on the left
    autocmd FileType vimfiler setlocal nonumber nocursorcolumn

    "load the list of file extensions and handlers if it exists
    if filereadable(glob("~/.vim/filetypes.vim"))
        source ~/.vim/filetypes.vim
    endif
"}}}

"LIGHTLINE: {{{
    let g:unite_force_overwrite_statusline = 0
    let g:vimfiler_force_overwrite_statusline = 0

    function! LLModified()
        return &ft =~ 'help' ? '' : &modified ? '💾 ' : &modifiable ? '' : '-'
    endfunction

    function! LLReadonly()
        return &ft !~? 'help' && &readonly ? '🔒' : ''
    endfunction

    function! LLFilename()
        let fname = expand('%:t')
        return
        \   fname == '__Tagbar__' ? g:lightline.fname :
        \   fname =~ '__Gundo' ? '' :
        \   &ft == 'vimfiler' ? vimfiler#get_status_string() :
        \   &ft == 'unite' ? unite#get_status_string() :
        \   &ft == 'qf' ? '[Error/Location List]' :
        \   &ft == 'extradite' ? '[Commit History]' :
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
        return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype : 'none') : ''
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
        let g:lightline.fname = 'tags' "a:fname
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

    "status bar config with and without powerline fonts (default: 0)
    if !exists("g:powerlinefonts")
        let g:powerlinefonts=0
    endif
    if (g:powerlinefonts == 1)
        let g:lightline = {
        \   'colorscheme': 'darkcloud',
        \   'active': {
        \       'left': [ [ 'mode', 'paste' ], [ 'fugitive', 'filename' ], ['tagbar'] ],
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
        \   'subseparator': {'left': '', 'right': ''},
        \   'component': {
        \       'tagbar': '%{tagbar#currenttag("[%s]", "", "f")}',
        \   },
        \ }
    else
        let g:lightline = {
        \   'colorscheme': 'darkcloud',
        \   'active': {
        \       'left': [ [ 'mode', 'paste' ], [ 'fugitive', 'filename' ], ['tagbar'] ],
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
        \   'subseparator': {'left': '|', 'right': '|'},
        \   'component': {
        \       'tagbar': '%{tagbar#currenttag("[%s]", "", "f")}',
        \   },
        \ }
    endif

    "ligtline theme {{{
        let s:base0 = '#262626'
        let s:base1 = '#303030'
        let s:base2 = '#767676'
        let s:base3 = '#949494'
        let s:base4 = '#b2b2b2'
        let s:base5 = '#c6c6c6'
        let s:base6 = '#eaeaea'

        let s:rcol = '#d75f5f'
        let s:ycol = '#ffd787'
        let s:bcol = '#87d7ff'

        let s:p = {'normal':{},'inactive':{},'insert':{},'replace':{},'visual':{},'tabline':{}}

        let s:p.normal.left = [[ s:bcol,s:base1 ],[ s:base6,s:base0 ]]
        let s:p.normal.right = [[ s:base1,s:base4 ],[ s:base6,s:base0 ]]
        let s:p.inactive.left =  [[ s:base6,s:base0 ],[ s:base4,s:base1 ]]
        let s:p.inactive.right = [[ s:base1,s:base4 ],[ s:base6,s:base0 ]]
        let s:p.insert.left = [[ s:rcol,s:base1 ],[ s:base6,s:base0 ]]
        let s:p.replace.left = [[ s:base1,s:rcol ],[ s:base6,s:base0 ]]
        let s:p.visual.left = [[ s:ycol,s:base1 ],[ s:base6,s:base0 ]]

        let s:p.normal.middle = [[ s:base4,s:base1 ]]
        let s:p.inactive.abmiddle = [[ s:base3,s:base1 ]]
        let s:p.tabline.left = [[ s:base5,s:base0 ]]
        let s:p.tabline.tabsel = [[ s:base5,s:base1 ]]
        let s:p.tabline.middle = [[ s:base0,s:base4 ]]
        let s:p.tabline.right = copy(s:p.normal.right)
        let s:p.normal.error = [[ s:rcol,s:base1 ]]
        let s:p.normal.warning = [[ s:ycol,s:base1 ]]

        let g:lightline#colorscheme#darkcloud#palette = lightline#colorscheme#fill(s:p)
    "}}}
"}}}
