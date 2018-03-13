"autostart syntax checking when vim opens to a compatible filetype (default: 0)
if !exists("g:autostartchecker") || &diff
    let g:autostartchecker = 0
endif

let g:ale_enabled = g:autostartchecker

" open list of warnings and errors when they exist
let g:ale_open_list = 1

" don't fix on save
let g:ale_fix_on_save = 0

" list of ale fixers
let g:ale_fixers = {
    \     'javascript': [ 'eslint' ]
    \ }

" don't run ale on minified files
let g:ale_pattern_options = {
    \     '\.min\.[^\.]*$': { 'ale_linters': [], 'ale_fixers': [] },
    \ }
