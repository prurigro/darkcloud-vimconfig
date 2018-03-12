"autostart syntax checking when vim opens to a compatible filetype (default: 0)
if !exists("g:autostartchecker")
    let g:autostartchecker = 0
endif

if &diff
    let g:autostartchecker = 0
else
    if (g:autostartchecker == 1)
        let g:syntastic_mode_map = {
            \ 'mode':'active',
            \ 'active_filetypes':[],
            \ 'passive_filetypes':[]
        \ }

        let g:syntastic_check_on_open = 1
    else
        let g:syntastic_mode_map = {
            \ 'mode':'passive',
            \ 'active_filetypes':[],
            \ 'passive_filetypes':[]
        \ }

        let g:syntastic_check_on_open = 0
    endif

    "configure warnings/errors that should be silenced by module
    let g:syntastic_less_lessc_quiet_messages = {
        \ 'regex':[
            \ 'NameError:.* is undefined',
            \ 'FileError:.*'
        \ ]}

    let g:syntastic_scss_sass_quiet_messages = {
        \ 'regex':[
            \ 'File to import not found or unreadable.*'
        \ ]}

    let g:syntastic_java_javac_quiet_messages = {
        \ 'regex':[
            \ 'cannot find symbol.*',
            \ 'method does not override or implement a method from a supertype.*',
            \ 'package [^\ ]* does not exist.*'
        \ ]}

    let g:syntastic_javascript_eslint_quiet_messages = {
        \ 'regex':[
            \ '.* is defined but never used',
            \ "'[^']*' is not defined",
            \ 'Missing "use strict" statement',
            \ 'Unexpected [^ ]* statement.*'
        \ ]}

    let g:syntastic_javascript_jshint_quiet_messages = {
        \ 'regex':[
            \ 'Expected an assignment or function call and instead saw an expression.'
        \ ]}

    let g:syntastic_javascript_standard_quiet_messages = {
        \ 'regex':[
            \ '.* is defined but never used',
            \ "'[^']*' is not defined"
        \ ]}

    let g:syntastic_markdown_mdl_quiet_messages = {
        \ 'regex':[
            \ '.*MD013.*',
            \ '.*MD002.*',
            \ '.*MD029.*'
        \ ]}

    let g:syntastic_python_flake8_quiet_messages = {
        \ 'regex':[
            \ '.*\[W293\]',
            \ '.*\[E501\]'
        \ ]}

    let g:syntastic_php_phpmd_quiet_messages = {
        \ 'regex':[
            \ 'Avoid using short method names like.*',
            \ 'Avoid variables with short names like.*',
            \ 'The method.*has [0-9][0-9]* lines of code.*',
            \ 'The method.*has a Cyclomatic Complexity.*',
            \ 'The method.*has an NPath complexity.*',
            \ 'The function.*has a Cyclomatic Complexity.*',
            \ 'The function.*has an NPath complexity.*',
            \ 'The function.*Avoid really long methods\.',
            \ 'The class.*has an overall complexity.*',
            \ 'The class.*has.*public methods.*',
            \ 'The class.*lines of code'
        \ ]}

    let g:syntastic_sh_bashate_quiet_messages = {
        \ 'regex':[
            \ 'Indent not multiple of 4'
        \ ]}

    let g:syntastic_sh_shellcheck_quiet_messages = {
        \ 'regex':[
            \ '.*\[SC1001\]',
            \ '.*\[SC2015\]',
            \ '.*\[SC2016\]',
            \ '.*\[SC2029\]',
            \ '.*\[SC2034\]',
            \ '.*\[SC2148\]',
            \ '.*\[SC2181\]',
            \ '.*follow non-constant source',
            \ 'Not following:'
        \ ]}

    autocmd BufNewFile,BufRead PKGBUILD,bash.bashrc,.bashrc let g:syntastic_quiet_messages = {"level":"warnings"}

    let g:syntastic_check_on_wq = 0
    let g:syntastic_always_populate_loc_list = 1
    let g:syntastic_auto_loc_list = 1
    let g:syntastic_loc_list_height = 5
endif

"function to enable syntastic and set check_on_open on
function s:SyntasticToggleOn()
    let g:syntastic_check_on_open = 1

    if (g:syntastic_mode_map.mode == "passive")
        SyntasticToggleMode
    endif
endfunction

command! -buffer SyntasticToggleOn call s:SyntasticToggleOn()

"function to disable syntastic and set check_on_open off
function s:SyntasticToggleOff()
    let g:syntastic_check_on_open = 0

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
