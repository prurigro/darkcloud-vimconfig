"==========================="
"                           "
"  Keyboard Configuration:  "
"                           "
"  Maintainer: Prurigro     "
"  License: MIT             "
"                           "
"==========================="
"
" Note:
"  *The default <Leader> key is: \
"
" Reference: (view plugin documentation for the full list of commands each offers)
"  (tcomment _ can also be -)
"   <Ctrl-_><Ctrl-_>      | (A) -> comment selection/create an empty comment
"   <Ctrl-_>b             | (A) -> comment the current block(s)
"   <Ctrl-_>r             | (A) -> comment everything on the line to the right
"   <Ctrl-_>p             | (A) -> comment the current paragraph
"   <Ctrl-enter>          | (I) -> add a close bracket following an open one
"   <Ctrl-c>              | (I) -> add a close bracket following an open one
"
"  (surround)
"    S"                   | (V) -> surround selection with quotes
"    S<a href="">         | (V) -> surround <a href="">selection</a>
"    ds"                  | (N) -> delete surrounding ""
"    dst                  | (N) -> delete surrounding tag (ie: <strong></strong>)
"    cs'"                 | (N) -> change surrounding '' to "" (any delimiters work)
"    cs"<q>               | (N) -> change surrounding "" to the tag: <q></q>
"    cst"                 | (N) -> change any surrounding tag to ""
"
"  (vim)
"    D                    | (N) -> delete/cut to the end of the line
"    S                    | (N) -> delete/cut a line up to the whitespace
"
" Mappings:
"  (mouse)
"    <Ctrl-ScrollUp>      | (A) -> scroll right a few characters at a time
"    <Ctrl-ScrollDown>    | (A) -> scroll left a few characters at a time
"    <Alt-ScrollUp>       | (A) -> scroll right one character at a time
"    <Alt-ScrollDown>     | (A) -> scroll left one character at a time
"    <Shift-MiddleClick>  | (A) -> unbind this from vim so xorg can paste
"
"  (tabs)
"    <Leader>9            | (A) -> go to the next open tab
"    <Leader>0            | (A) -> go to the previous open tab
"    <Leader>-            | (A) -> open a new tab
"    <Leader>=            | (A) -> create a new tab with vimfiler
"    <Leader>+            | (A) -> create a new tab with vimfiler
"
"  (toggles)
"    ??                   | (N) -> toggle the quick reference sidebar
"    ?>                   | (N) -> toggle command reference sidebar
"    ?<                   | (N) -> toggle normal mode key bindings reference sidebar
"    ``                   | (N) -> toggle the vimfiler sidebar on the right
"    ~~                   | (N) -> toggle the vimfiler sidebar on the left
"    <Space>              | (N) -> toggle folds
"    <F1>                 | (A) -> toggle line numbers
"    <F2>                 | (A) -> toggle row/column cursor highlighting
"    <F3>                 | (A) -> toggle line wrapping
"    <F4>                 | (A) -> toggle all folds
"    <F5>                 | (A) -> toggle spell check
"    <F6>                 | (A) -> toggle syntax checking
"    <F8>                 | (A) -> toggle the tagbar sidebar
"    <Ctrl-F8>            | (A) -> toggle the location list to check syntax errors
"    <F9>                 | (A) -> toggle the gundo undo history sidebar
"    <Ctrl-F9>            | (A) -> enable spellcheck & toggle list of spelling errors
"
"  (gvim toggles)
"    <Ctrl-F1>            | (A) -> toggle the menu
"    <Ctrl-F2>            | (A) -> toggle the toolbar
"    <Ctrl-F3>            | (A) -> toggle the scrollbar
"
"  (completion)
"    <Leader>,,           | (A) -> enter after emme 'word' (ie: html:5)
"    \\                   | (N) -> show spelling suggestions popup for word
"    \|                   | (N) -> add word to a local list of correct spellings
"    <Tab>                | (I) -> (neocomp) autocomplete using common string
"    <Leader><Tab>        | (I) -> (neocomp) autocomplete the common string
"    <Enter>              | (I) -> (neocomp) close the suggestion popup
"    <Leader><Backspace>  | (I) -> (neocomp) undo the most recent completion
"
"  (formatting)
"    <Backspace>          | (V) -> deletes currently selected text
"    <Backspace>          | (N) -> deletes the character behind the cursor
"    <Leader><C-f>        | (V) -> format the selection and return to cursor
"    <Leader><C-f>        | (N) -> format document and return to cursor
"    <Leader><C-w>        | (N) -> remove whitespace
"    <Leader><C-t>        | (N) -> convert tabs into spaces
"    <Leader>\            | (N) -> remove search highlighting
"    <Leader><Esc>        | (N) -> an alt mapping to remove search highlighting
"    <Tab>                | (V) -> indent all the lines currently selected
"    <Tab>                | (N) -> indent the current line
"    <Shift-Tab>          | (V) -> unindent all the lines currently selected
"    <Shift-Tab>          | (N) -> unindent the current line
"
"  (movement)
"    =                    | (N) -> move to the first character on the next line
"    <Ctrl-Up>            | (N) -> move to the beginning of the document
"    <Ctrl-Down>          | (N) -> move to the end of the document
"    <Ctrl-Right>         | (N) -> move to the end of the line
"    <Ctrl-Left>          | (N) -> move to the beginning of the non-whitespace
"
"    <Shift-Up>           | (N) -> move a few lines up
"    <Shift-Down>         | (N) -> move a few lines down
"    <Shift-Right>        | (N) -> move a few lines right
"    <Shift-Left>         | (N) -> move a few lines left
"
"    <Alt+Up>             | (V) -> move a block up one line
"    <Alt+Down>           | (V) -> move a block down one line
"    <Alt+Up>             | (N) -> move a line up one line
"    <Alt+Down>           | (N) -> move a line down one line
"
"    <Alt+Left>           | (V) -> move a block up a half page
"    <Alt+Right>          | (V) -> move a block down a half page
"    <Alt+Left>           | (N) -> move a line up a half page
"    <Alt+Right>          | (N) -> move a line down a half page
"    <Alt+h>              | (V) -> move a block up a half page
"    <Alt+l>              | (V) -> move a block down a half page
"    <Alt+h>              | (N) -> move a line up a half page
"    <Alt+l>              | (N) -> move a line down a half page
"
"  (selection)
"    <Ctrl-a>             | (N) -> select all text
"    <Leader>a            | (N) -> select all text
"    <Ctrl-a>             | (V) -> select all text
"    <Leader>a            | (V) -> select all text
"
"    <Ctrl-Up>            | (V) -> select all text above
"    <Ctrl-Down>          | (V) -> select all text below
"    <Ctrl-Right>         | (V) -> select all text to the right
"    <Ctrl-Left>          | (V) -> select all text to the left up to the indent
"
"    <Shift-Up>           | (V) -> select a few lines up
"    <Shift-Down>         | (V) -> select a few lines down
"    <Shift-Right>        | (V) -> select a few lines right
"    <Shift-Left>         | (V) -> select a few lines left
"
"  (vimdiff)
"    <Leader>>            | (N) -> update differences
"    <Leader><            | (N) -> an alt mapping to update differences
"    >>                   | (N) -> next difference
"    <<                   | (N) -> previous difference
"    ><                   | (N) -> replace diff in current pane with other pane
"    <>                   | (N) -> replace diff in other pane with current pane
"
"  (paste functions)
"    <Leader>p            | (N) -> view the paste buffers and register contents
"    <Leader>p<Direction> | (N) -> paste in the direction entered
"    y                    | (N) -> copies the character at the cursor
"    P                    | (V) -> save selection to the buffer and paste over
"    p                    | (V) -> preserve the buffer pasting over selected text
"
"  (delete/cut functions)
"    <Leader>d            | (V) -> delete the currently selected text
"    <Leader>x            | (V) -> delete the currently selected text
"    <Leader>x            | (N) -> delete the char(s) under and the cursor
"    <Leader>X            | (V) -> delete the currently selected lines
"    <Leader>X            | (N) -> delete the char(s) before the cursor
"    <Leader>D            | (V) -> delete the currently selected lines
"    <Leader>D            | (N) -> delete chars under and after the cursor on the line
"    <Leader>dw           | (N) -> delete chars under and after the cursor in the word
"    <Leader>dd           | (N) -> delete lines under and after the one below
"
" Filetype Specific Mappings:
"  (gundo)
"    <LMouse>             | (A) -> same as normal + justify one from the left
"    <MMouse>             | (A) -> same as the left mouse
"    <RMouse>             | (A) -> same as the left mouse
"    <Right>              | (A) -> same as j (down)
"    l                    | (A) -> same as j (down)
"    <Left>               | (A) -> same as k (up)
"    h                    | (A) -> same as k (up)
"
"  (help)
"    q                    | (N) -> close the dialog
"
"  (vimfiler)
"    <LMouse><LMouse>     | (N) -> edit selected file
"    <LMouse>             | (N) -> same as normal + justify on the left
"    <MMouse>             | (N) -> same as the left mouse
"    <RMouse>             | (N) -> same as the left mouse
"    <Right>              | (N) -> map to l, which opens a directory
"    <Left>               | (N) -> map to h, which goes up one directory
"    '                    | (N) -> edit the selected file
"
"  (gundo)
"    <LeftMouse>          | (N) -> same as normal + justify on the left
"    <MiddleMouse>        | (N) -> same as the left mouse
"    <RightMouse>         | (N) -> same as the left mouse
"    <Right>              | (N) -> same as down
"    l                    | (N) -> same as j
"    <Left>               | (N) -> same as Up
"    h                    | (N) -> same as k
"
"  Aliases:
"    :wsudo -and- :sudow  | (C) -> :SudoWrite (write the file as root using sudo)
"    :esudo -and- :sudoe  | (C) -> :SudoRead (read a file as root using sudo)
"

"MAPPINGS: GENERAL KEYBINDINGS AND REBINDINGS {{{
    "MOUSE:{
        "hold shift to enable middle-click paste
        noremap <S-Insert> <MiddleMouse>
        noremap! <S-Insert> <MiddleMouse>

        "hold ctrl to scroll left/right instead of up/down
        noremap <C-ScrollWheelUp> 4zl
        noremap <C-ScrollWheelDown> 4zh
        inoremap <C-ScrollWheelUp> <C-O>4zl
        inoremap <C-ScrollWheelDown> <C-O>4zh

        "hold alt to scroll left/right more precisely
        noremap <A-ScrollWheelUp> zl
        noremap <A-ScrollWheelDown> zh
        inoremap <A-ScrollWheelUp> <C-O>zl
        inoremap <A-ScrollWheelDown> <C-O>zh
    "}

    "TABS:{
        nnoremap <silent><expr> <Leader>0 ':tabnext<CR>'
        inoremap <silent><expr> <Leader>0 '<C-O>:tabnext<CR>'
        xnoremap <silent><expr> <Leader>0 '<Esc>:tabnext<CR>'
        nnoremap <silent><expr> <Leader>9 ':tabprev<CR>'
        inoremap <silent><expr> <Leader>9 '<Esc>:tabprev<CR>'
        xnoremap <silent><expr> <Leader>9 '<Esc>:tabprev<CR>'
        nnoremap <silent><expr> <Leader>- ':tabnew<CR>'
        inoremap <silent><expr> <Leader>- '<Esc>:tabnew<CR>'
        xnoremap <silent><expr> <Leader>- '<Esc>:tabnew<CR>'
        nnoremap <silent><expr> <leader>= ':VimFiler -tab -project<CR>'
        inoremap <silent><expr> <leader>= '<Esc>:VimFiler -tab -project<CR>'
        xnoremap <silent><expr> <leader>= '<Esc>:VimFiler -tab -project<CR>'
        nnoremap <silent><expr> <leader>+ ':VimFiler -tab -project -double<CR>'
        inoremap <silent><expr> <leader>+ '<Esc>:VimFiler -tab -project -double<CR>'
        xnoremap <silent><expr> <leader>+ '<Esc>:VimFiler -tab -project -double<CR>'
    "}

    "TOGGLES:{
        "bindings to trigger vimfiler
        nnoremap <silent><expr> `` ':VimFilerExplorer -direction=botright -winwidth=45<CR>'
        nnoremap <silent><expr> ~~ ':VimFilerExplorer -direction=topleft -winwidth=45<CR>'

        nnoremap <silent><expr> ?? ':h quickref<CR>'
        nnoremap <silent><expr> ?> ':exusage<CR>'
        nnoremap <silent><expr> ?< ':viusage<CR>'

        "toggle folded code at foldpoints
        nnoremap <Space> za

        "unmap F1 from help then map it to toggle the display of line numbers
        nnoremap <silent><expr> <F1> ':set number!<CR>:echo "Line numbers toggled"<CR>'
        xnoremap <silent><expr> <F1> '<Esc>:set number!<CR>v'
        inoremap <silent><expr> <F1> '<C-O>:set number!<CR>'

        "toggle the cursor line and column
        nnoremap <silent><expr> <F2> ':set cursorline! cursorcolumn!<CR>:echo "Cursor crosshair toggled"<CR>'
        xnoremap <silent><expr> <F2> '<Esc>:set cursorline! cursorcolumn!<CR>v'
        inoremap <silent><expr> <F2> '<C-O>:set cursorline! cursorcolumn!<CR>'

        "toggle line wrapping (and bottom bar if using the gui)
        nnoremap <silent><expr> <F3> ':echo "Line wrapping toggled"<CR>:set wrap!<CR>'
        xnoremap <silent><expr> <F3> '<Esc>:set wrap!<CR>v'
        inoremap <silent><expr> <F3> '<C-O>:set wrap!<CR>'

        "toggle all folds
        nnoremap <F4> zi:echo "Code Folding Toggled"<CR>
        xnoremap <F4> <Esc>ziv
        inoremap <F4> <C-O>zi

        "toggle spellcheck
        nnoremap <silent><expr> <F5> ':set spell!<CR>:echo "Spell checking toggled"<CR>'
        xnoremap <silent><expr> <F5> '<Esc>:set spell!<CR>v'
        inoremap <silent><expr> <F5> '<C-O>:set spell!<CR>'

        "toggle syntax checking
        nnoremap <silent><expr> <F6> ':SyntasticToggleMode<CR>'
        xnoremap <silent><expr> <F6> '<Esc>:SyntasticToggleMode<CR>v'
        inoremap <silent><expr> <F6> '<C-O>:SyntasticToggleMode<CR>'

        "bindings to trigger the tagbar list of tags
        nnoremap <silent><expr> <F8> ':TagbarToggle<CR>:echo "Code tagbar toggled"<CR>'
        xnoremap <silent><expr> <F8> '<Esc>:TagbarToggle<CR>v'
        inoremap <silent><expr> <F8> '<C-O>:TagbarToggle<CR>'

        "bindings to trigger the tagbar list of errors
        nmap <script> <silent> <C-F8> :call ToggleLocationList()<CR>:echo "Error/Location list toggled"<CR>

        "bindings to trigger the gundo undo history
        nnoremap <silent><expr> <F9> ':GundoToggle<CR>:echo "Undo history sidebar toggled"<CR>'
        xnoremap <silent><expr> <F9> '<Esc>:GundoToggle<CR>v'
        inoremap <silent><expr> <F9> '<C-O>:GundoToggle<CR>'

        "bindings to trigger spellcheck
        nnoremap <silent><expr> <C-F9> ':UpdateAndSpellCheck<CR>:call ToggleQuickfixList()<CR>'
        xnoremap <silent><expr> <C-F9> '<Esc>:UpdateAndSpellCheck<CR>:call ToggleQuickfixList()<CR>'
        inoremap <silent><expr> <C-F9> '<Esc>:UpdateAndSpellCheck<CR>:call ToggleQuickfixList()<CR>'
    "}

    "GVIM TOGGLES:{
        "map toggles for the menu, toolbar and vertical scrollbar
        nnoremap <silent><expr> <C-F1> ":if &go=~#'m'<Bar>set go-=m<Bar>else<Bar>set go+=m<Bar>endif<CR>:echo 'Menu bar toggled'<CR>"
        vnoremap <silent><expr> <C-F1> "<Esc>:if &go=~#'m'<Bar>set go-=m<Bar>else<Bar>set go+=m<Bar>endif<CR>v"
        inoremap <silent><expr> <C-F1> "<C-O>:if &go=~#'m'<Bar>set go-=m<Bar>else<Bar>set go+=m<Bar>endif<CR>"

        nnoremap <silent><expr> <C-F2> ":if &go=~#'T'<Bar>set go-=T<Bar>else<Bar>set go+=T<Bar>endif<CR>:echo 'Toolbar toggled'<CR>"
        vnoremap <silent><expr> <C-F2> "<Esc>:if &go=~#'T'<Bar>set go-=T<Bar>else<Bar>set go+=T<Bar>endif<CR>v"
        inoremap <silent><expr> <C-F2> "<C-O>:if &go=~#'T'<Bar>set go-=T<Bar>else<Bar>set go+=T<Bar>endif<CR>"

        nnoremap <silent><expr> <C-F3> ":if &go=~#'r'<Bar>set go-=r<Bar>set go-=L<Bar>set go-=b<Bar>else<Bar>set go+=r<Bar>set go+=L<Bar>set go+=b<Bar>endif<CR>:echo 'Scrollbars toggled'<CR>"
        vnoremap <silent><expr> <C-F3> "<Esc>:if &go=~#'r'<Bar>set go-=r<Bar>set go-=L<Bar>set go-=b<Bar>else<Bar>set go+=r<Bar>set go+=L<Bar>set go+=b<Bar>endif<CR>v"
        inoremap <silent><expr> <C-F3> "<C-O>:if &go=~#'r'<Bar>set go-=r<Bar>set go-=L<Bar>set go-=b<Bar>else<Bar>set go+=r<Bar>set go+=L<Bar>set go+=b<Bar>endif<CR>"
    "}

    "COMPLETION:{
        "emmet switch triggerkey from <Ctrl-Y>
        let g:user_emmet_leader_key='<C-\>'

        "press backslash twice on a mispelled word for suggestions
        nnoremap \\ hei<C-X><C-S>
        nnoremap \| zg

        "neocomplcache: scroll through completion list
        inoremap <expr><Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
        "neocomplcache: complete the common part of the string
        inoremap <expr><Leader><Tab> neocomplcache#complete_common_string()
        "neocomplcache: close popup and delete backward char
        inoremap <expr><CR> pumvisible() ? neocomplcache#smart_close_popup() : "\<CR>"
        "neocomplcache : undo completion
        inoremap <expr><Leader><Backspace> "<Backspace>" . neocomplcache#undo_completion()
    "}

    "FORMATTING:{
        "have backspace delete the selected text
        vnoremap <Backspace> "_x
        nnoremap <Backspace> i<Backspace><Esc>l

        "formatting options to apply to the whole document
        nnoremap <Leader><C-f> mzgg=G`z<CR>:echo "The document has been formatted"<CR>
        vnoremap <Leader><C-f> mz=`z<CR>:echo "The selection has been formatted"<CR>
        nnoremap <silent><expr> <Leader><C-w> ':FixWhitespace<CR>:echo "Trailing whitespace has been removed"<CR>'
        nnoremap <silent><expr> <Leader><C-t> ':retab<CR>:noh<CR>:echo "Tabs have been converted to spaces"<CR>'
        nnoremap <silent><expr> <Leader>/ ':noh<CR>:echo "Search results have been cleared"<CR>'
        nnoremap <silent><expr> <Leader><Esc> ':noh<CR>:echo "Search results have been cleared"<CR>'

        "tab and untab the currently selected lines
        vnoremap <Tab> >gv
        nnoremap <Tab> v>gv<Esc>
        vnoremap <S-Tab> <gv
        nnoremap <S-Tab> v<gv<Esc>
    "}

    "MOVEMENT:{
        "additional mappings for easier access
        nnoremap = +

        "remap keys for speedier movement
        nnoremap <S-Up> 4k
        nnoremap <S-Down> 4j
        nnoremap <S-Right> 6l
        nnoremap <S-Left> 6h

        "remap keys to scroll to the end in a direction
        nnoremap <C-Up> gg0
        nnoremap <C-Down> G$
        nnoremap <C-Right> $
        nnoremap <C-Left> ^

        "remap alt+up/down to move blocks up/down a line
        vmap <A-Up> <Plug>MoveBlockUp
        vmap <A-Down> <Plug>MoveBlockDown
        nmap <A-Up> <Plug>MoveLineUp
        nmap <A-Down> <Plug>MoveLineDown

        "remap alt+left/right/h/l to move blocks up/down a half page
        vmap <A-Left> <Plug>MoveBlockHalfPageUp
        vmap <A-Right> <Plug>MoveBlockHalfPageDown
        nmap <A-Left> <Plug>MoveLineHalfPageUp
        nmap <A-Right> <Plug>MoveLineHalfPageDown
        vmap <A-h> <Plug>MoveBlockHalfPageUp
        vmap <A-l> <Plug>MoveBlockHalfPageDown
        nmap <A-h> <Plug>MoveLineHalfPageUp
        nmap <A-l> <Plug>MoveLineHalfPageDown
    "}

    "SELECTION:{
        "ctrl-a to select all (and an alt for screen users)
        nnoremap <C-a> gg0vG$
        xnoremap <C-a> <Esc>gg0vG$
        nnoremap <Leader>a <Esc>gg0vG$
        xnoremap <Leader>a gg0vG$

        "map remap keys for speedier text selection
        xnoremap <S-Up> 4k
        xnoremap <S-Down> 4j
        xnoremap <S-Right> 6l
        xnoremap <S-Left> 6h

        "remap keys to select all text in one direction
        xnoremap <C-Up> gg0
        xnoremap <C-Down> G$
        xnoremap <C-Right> $
        xnoremap <C-Left> ^
    "}

    "VIMDIFF:{
        "map shortcuts for vimdiff
        nnoremap <silent><expr> <Leader>> ':diffu<CR>'
        nnoremap <silent><expr> <Leader>< ':diffu<CR>'
        nnoremap >> ]c
        nnoremap << [c
        nnoremap <> dp
        nnoremap >< do
    "}

    "PASTE:{
        "display contents of paste buffers
        nnoremap <silent><expr> <Leader>p ':reg<CR>'

        "allow y to copy a single character in normal mode
        nnoremap y vy<Esc>

        "P puts text it replaces in the buffer and p does not
        vnoremap P p
        xmap p <Plug>ReplaceWithRegisterVisual
        nmap <C-p> <Plug>ReplaceWithRegisterOperator

        "Alternatives to deletion commands that don't replace the buffer
        vnoremap <Leader>x "_x
        nnoremap <Leader>x "_x
        vnoremap <Leader>X "_X
        nnoremap <Leader>X "_X
        vnoremap <Leader>D "_D
        nnoremap <Leader>D "_D
        vnoremap <Leader>d "_d
        nnoremap <Leader>dd "_dd
        nnoremap <Leader>dw "_dw
    "}
"}}}

"FILETYPE SPECIFIC MAPPINGS: {{{
    "help
    autocmd FileType help nnoremap <buffer> <silent><expr> q ':q<CR>'
    autocmd FileType help nnoremap <buffer> <silent><expr> ?? ':q<CR>'
    autocmd FileType help nnoremap <buffer> <silent><expr> ?> ':q<CR>'
    autocmd FileType help nnoremap <buffer> <silent><expr> ?< ':q<CR>'

    "vimfiler
    autocmd FileType vimfiler nmap <buffer> <2-LeftMouse> <Plug>(vimfiler_edit_file)
    autocmd FileType vimfiler nmap <buffer> <LeftMouse> <LeftMouse>0
    autocmd FileType vimfiler nmap <buffer> <MiddleMouse> <LeftMouse>
    autocmd FileType vimfiler nmap <buffer> <RightMouse> <LeftMouse>
    autocmd FileType vimfiler nmap <Right> l
    autocmd FileType vimfiler nmap <Left> h
    autocmd FileType vimfiler nmap ' e

    "gundo
    autocmd FileType gundo nmap <buffer> <LeftMouse> <LeftMouse>0l
    autocmd FileType gundo nmap <buffer> <MiddleMouse> <LeftMouse>
    autocmd FileType gundo nmap <buffer> <RightMouse> <LeftMouse>
    autocmd FileType gundo nmap <Right> <Down>
    autocmd FileType gundo nmap l j
    autocmd FileType gundo nmap <Left> <Up>
    autocmd FileType gundo nmap h k
"}}}

"DISABLED MAPPINGS: {{{
    "remove incompatible toggles from gundo and filer
    autocmd Filetype gundo,vimfiler noremap <F1> <Nop>
    autocmd Filetype gundo,vimfiler noremap <F2> <Nop>
    autocmd Filetype gundo,vimfiler noremap <F3> <Nop>
    autocmd Filetype gundo,vimfiler noremap <C-Up> <Nop>
    autocmd Filetype gundo,vimfiler noremap <C-k> <Nop>
    autocmd Filetype gundo,vimfiler noremap <C-Down> <Nop>
    autocmd Filetype gundo,vimfiler noremap <C-j> <Nop>
    autocmd Filetype gundo,vimfiler noremap <C-Right> <Nop>
    autocmd Filetype gundo,vimfiler noremap <C-l> <Nop>
    autocmd Filetype gundo,vimfiler noremap <C-Left> <Nop>
    autocmd Filetype gundo,vimfiler noremap <C-h> <Nop>
    autocmd Filetype gundo,vimfiler noremap <S-Up> <Nop>
    autocmd Filetype gundo,vimfiler noremap <S-k> <Nop>
    autocmd Filetype gundo,vimfiler noremap <S-Down> <Nop>
    autocmd Filetype gundo,vimfiler noremap <S-j> <Nop>
    autocmd Filetype gundo,vimfiler noremap <S-Right> <Nop>
    autocmd Filetype gundo,vimfiler noremap <S-l> <Nop>
    autocmd Filetype gundo,vimfiler noremap <S-Left> <Nop>
    autocmd Filetype gundo,vimfiler noremap <S-h> <Nop>
"}}}

"ALIASES: COMMAND SHORTCUTS {{{
    cabbrev sudow SudoWrite
    cabbrev wsudo SudoWrite
    cabbrev sudoe SudoRead
    cabbrev esudo SudoRead
"}}}
