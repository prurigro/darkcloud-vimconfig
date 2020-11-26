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
        if expand('%:t') !~? 'Tagbar' && &ft !~? 'vimfiler' && exists('*fugitive#head')
            let mark = '' "edit here for cool mark
            let _ = fugitive#head()
            return strlen(_) ? mark._ : ''
        endif
    catch
        return ''
    endtry
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

let g:lightline = {}

let g:lightline.colorscheme = 'darkcloud'
let g:lightline#ale#indicator_checking = ""
let g:lightline#ale#indicator_warnings = "W:"
let g:lightline#ale#indicator_errors = "E:"
let g:lightline#ale#indicator_ok = "OK"

let g:lightline.component_function = {
    \     'fugitive': 'LLFugitive',
    \     'filename': 'LLFilename',
    \     'fileformat': 'LLFileformat',
    \     'filetype': 'LLFiletype',
    \     'fileencoding': 'LLFileencoding',
    \     'mode': 'LLMode',
    \     'scrollstatus': 'ScrollStatus'
    \ }

let g:lightline.component_expand = {
    \     'linter_checking': 'lightline#ale#checking',
    \     'linter_warnings': 'lightline#ale#warnings',
    \     'linter_errors': 'lightline#ale#errors',
    \     'linter_ok': 'lightline#ale#ok'
    \ }

let g:lightline.component_type = {
    \     'linter_checking': 'left',
    \     'linter_warnings': 'warning',
    \     'linter_errors': 'error',
    \     'linter_ok': 'left'
    \ }

let g:lightline.component = {
    \     'tagbar': '%{tagbar#currenttag("[%s]", "", "f")}'
    \ }

let g:lightline.active = {
    \     'left': [[ 'mode', 'paste' ], [ 'fugitive', 'filename' ], [ 'tagbar' ]],
    \     'right': [[ 'linter_checking', 'linter_errors', 'linter_warnings', 'linter_ok' ], [ 'fileformat', 'fileencoding', 'filetype' ], [ 'percent', 'lineinfo' ], [ 'scrollstatus' ]]
    \ }

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

    let s:p = { 'normal': {}, 'inactive': {}, 'insert': {}, 'replace': {}, 'visual': {}, 'tabline': {} }

    let s:p.normal.left = [[ s:bcol, s:base1 ], [ s:base6, s:base0 ]]
    let s:p.normal.right = [[ s:base4, s:base1 ], [ s:base6, s:base0 ]]
    let s:p.inactive.left =  [[ s:base6, s:base0 ], [ s:base4, s:base1 ]]
    let s:p.inactive.right = [[ s:base4, s:base1 ], [ s:base6, s:base0 ]]
    let s:p.insert.left = [[ s:rcol, s:base1 ], [ s:base6, s:base0 ]]
    let s:p.replace.left = [[ s:base1, s:rcol ], [ s:base6, s:base0 ]]
    let s:p.visual.left = [[ s:ycol, s:base1 ], [ s:base6, s:base0 ]]

    let s:p.normal.middle = [[ s:base4, s:base1 ]]
    let s:p.inactive.abmiddle = [[ s:base3, s:base1 ]]
    let s:p.tabline.left = [[ s:base5, s:base0 ]]
    let s:p.tabline.tabsel = [[ s:base5, s:base1 ]]
    let s:p.tabline.middle = [[ s:base0, s:base4 ]]
    let s:p.tabline.right = copy(s:p.normal.right)
    let s:p.normal.error = [[ s:rcol, s:base1 ]]
    let s:p.normal.warning = [[ s:ycol, s:base1 ]]

    let g:lightline#colorscheme#darkcloud#palette = lightline#colorscheme#fill(s:p)
"}}}
