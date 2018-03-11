"autostart tagbar when vim opens to a compatible filetype (default: 0)
if !exists("g:autostarttagbar")
    let g:autostarttagbar=0
endif

if !&diff && (g:autostarttagbar == 1)
    autocmd VimEnter * nested :call tagbar#autoopen(1)
endif

let g:tagbar_sort=0
let g:tagbar_compact=1
let g:tagbar_singleclick=1
let g:tagbar_width=35
let g:tagbar_autofocus=1

autocmd FileType tagbar setlocal nocursorcolumn
