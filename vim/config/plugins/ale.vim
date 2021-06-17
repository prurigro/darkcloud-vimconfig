"autostart syntax checking when vim opens to a compatible filetype (default: 0)
if !exists("g:autostartchecker") || &diff
    let g:autostartchecker = 0
endif

"start ale if autostartchecker is true
let g:ale_enabled = g:autostartchecker

"always show the sign column when ale is running
if g:autostartchecker
    set scl=yes
else
    set scl=auto
endif

"don't open the error list when detected (hitting leader twice will do this)
let g:ale_open_list = 0

"don't fix on save
let g:ale_fix_on_save = 0

"configure when to lint
let g:ale_lint_on_text_changed = 'normal'
let g:ale_lint_on_enter = 1
let g:ale_lint_on_filetype_changed = 1
let g:ale_lint_on_save = 1
let g:ale_lint_on_insert_leave = 1

"show which linter is complaining
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'

"list of ale fixers
let g:ale_fixers = {
    \     'javascript': [ 'eslint' ],
    \     'vue': [ 'eslint' ]
    \ }

"don't run ale on minified files
let g:ale_pattern_options = {
    \     '\.min\.[^\.]*$': { 'ale_linters': [], 'ale_fixers': [] },
    \ }
