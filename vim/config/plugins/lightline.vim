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
    \   fname == '__Tagbar__.1' ? g:lightline.fname :
    \   &ft == 'vimfiler' ? vimfiler#get_status_string() :
    \   &ft == 'unite' ? unite#get_status_string() :
    \   &ft == 'qf' ? '[Error/Location List]' :
    \       ('' != LLReadonly() ? LLReadonly() . ' ' : '') .
    \       ('' != fname ? fname : '[NEW]') .
    \       ('' != LLModified() ? ' ' . LLModified() : '')
endfunction

function! LLFugitive()
    if expand('%:t') !~? 'Tagbar' && &ft !~? 'vimfiler' && exists('*FugitiveHead')
        let mark = '' "edit here for cool mark
        let _ = FugitiveHead()
        return strlen(_) ? mark._ : ''
    else
        return ''
    endif
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
    \   &ft == 'unite' ? 'Unite' :
    \   &ft == 'vimfiler' ? 'VimFiler' :
    \   winwidth(0) > 60 ? lightline#mode() : ''
endfunction

let g:tagbar_status_func = 'TagbarStatusFunc'

function! TagbarStatusFunc(current, sort, fname, ...) abort
    let g:lightline.fname = 'tags'
    return lightline#statusline(0)
endfunction

let g:lightline = {
    \ 'colorscheme': 'darkcloud',
    \
    \ 'component_function': {
    \     'fugitive': 'LLFugitive',
    \     'filename': 'LLFilename',
    \     'fileformat': 'LLFileformat',
    \     'filetype': 'LLFiletype',
    \     'fileencoding': 'LLFileencoding',
    \     'mode': 'LLMode'
    \ },
    \
    \ 'component_expand': {
    \     'linter_checking': 'lightline#ale#checking',
    \     'linter_warnings': 'lightline#ale#warnings',
    \     'linter_errors': 'lightline#ale#errors',
    \     'linter_ok': 'lightline#ale#ok'
    \ },
    \
    \ 'component_type': {
    \     'linter_checking': 'left',
    \     'linter_warnings': 'warning',
    \     'linter_errors': 'error',
    \     'linter_ok': 'left'
    \ },
    \
    \ 'component': {
    \     'tagbar': '%{tagbar#currenttag("[%s]", "", "f")}'
    \ },
    \
    \ 'active': {
    \     'left': [[ 'mode', 'paste' ], [ 'fugitive', 'filename' ], [ 'tagbar' ]],
    \     'right': [[ 'linter_checking', 'linter_errors', 'linter_warnings', 'linter_ok' ], [ 'fileformat', 'fileencoding', 'filetype' ], [ 'percent', 'lineinfo' ]]
    \ }
\ }

let g:lightline#ale#indicator_checking = ""
let g:lightline#ale#indicator_warnings = "W:"
let g:lightline#ale#indicator_errors = "E:"
let g:lightline#ale#indicator_ok = "OK"

"status bar config with and without powerline fonts (default: 0)
if !exists("g:powerlinefonts")
    let g:powerlinefonts = 0
endif

if (g:powerlinefonts == 1)
    let g:lightline.separator = { 'left': '', 'right': '' }
    let g:lightline.subseparator = { 'left': '', 'right': '' }
else
    let g:lightline.separator = { 'left': '', 'right': '' }
    let g:lightline.subseparator = { 'left': '|', 'right': '|' }
endif

"ligtline theme {{{
    let s:p = { 'normal': {}, 'inactive': {}, 'insert': {}, 'replace': {}, 'visual': {}, 'tabline': {} }

    let s:p.normal.left = [[ g:cBlue, g:cDarkGrayBg ], [ g:cLightText, g:cLightGrayBg ]]
    let s:p.inactive.left = [[ g:cBlue, g:cDarkGrayBg ], [ g:cLightText, g:cLightGrayBg ]]
    let s:p.normal.right = [[ g:cGray, g:cDarkGrayBg ], [ g:cLightText, g:cLightGrayBg ], [ g:cGray, g:cDarkGrayBg ]]
    let s:p.inactive.right = [[ g:cGray, g:cDarkGrayBg ], [ g:cLightText, g:cLightGrayBg ], [ g:cGray, g:cDarkGrayBg ]]

    let s:p.insert.left = [[ g:cRed, g:cLightGrayBg ], [ g:cGray, g:cDarkGrayBg ]]
    let s:p.replace.left = [[ g:cLightGrayBg, g:cRed ], [ g:cGray, g:cDarkGrayBg ]]
    let s:p.visual.left = [[ g:cYellow, g:cLightGrayBg ], [ g:cGray, g:cDarkGrayBg ]]

    let s:p.normal.middle = [[ g:cLightText, g:cLightGrayBg ]]
    let s:p.tabline.left = [[ g:cGray, g:cDarkGrayBg ]]
    let s:p.tabline.tabsel = [[ g:cGray, g:cLightGrayBg ]]
    let s:p.tabline.middle = [[ g:cDarkGrayBg, g:cGray ]]
    let s:p.tabline.right = copy(s:p.normal.right)
    let s:p.normal.error = [[ g:cRed, g:cLightGrayBg ]]
    let s:p.normal.warning = [[ g:cYellow, g:cLightGrayBg ]]

    let g:lightline#colorscheme#darkcloud#palette = lightline#colorscheme#fill(s:p)
"}}}
