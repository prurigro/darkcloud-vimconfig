"autostart filer when vim opens to an empty buffer (default: 1)
if !exists("g:autostartfiler")
    let g:autostartfiler=1
endif

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
