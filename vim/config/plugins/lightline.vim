let g:unite_force_overwrite_statusline = 0
let g:vimfiler_force_overwrite_statusline = 0

function! LLModified()
    return &ft =~ 'help' ? '' : &modified ? '*' : &modifiable ? '' : '-'
endfunction

function! LLReadonly()
    return &ft !~? 'help' && &readonly ? '[RO]' : ''
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
    \       ('' != fname ? fname : '[NEW]') .
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
    \       'left': [ [ 'mode', 'paste' ], [ 'fugitive', 'filename' ], [ 'tagbar' ] ],
    \       'right': [ [ 'syntastic', 'lineinfo' ], [ 'percent' ], [ 'fileformat', 'fileencoding', 'filetype' ] ]
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
    \       'left': [ [ 'mode', 'paste' ], [ 'fugitive', 'filename' ], [ 'tagbar' ] ],
    \       'right': [ [ 'syntastic', 'lineinfo' ], [ 'percent' ], [ 'fileformat', 'fileencoding', 'filetype' ] ]
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
    \   }
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
    let s:p.normal.right = [[ s:base4,s:base1 ],[ s:base6,s:base0 ]]
    let s:p.inactive.left =  [[ s:base6,s:base0 ],[ s:base4,s:base1 ]]
    let s:p.inactive.right = [[ s:base4,s:base1 ],[ s:base6,s:base0 ]]
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
