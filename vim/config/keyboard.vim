"============================================================"
"                                                            "
"  Darkcloud Vim Config: keyboard settings                   "
"                                                            "
"  By: Kevin MacMartin (prurigro@gmail.com)                  "
"  Website: https://github.com/prurigro/darkcloud-vimconfig  "
"                                                            "
"  License: MIT                                              "
"                                                            "
"============================================================"
"
"Aliases:
"  :GitLog & :gitlog          | (C) -> show a navigatable log of commit history
"  :GitDiff & :gitdiff        | (C) -> current file and last commit in vimdiff
"  :GitStatus & :gitstatus    | (C) -> shows the output of git status
"  :GitCommit & :gitcommit    | (C) -> commits changes to the current file
"  :git <file>                | (C) -> open a vert split with the file in diff mode
"
"  :vs33                      | (C) -> create a vertical split using 33% width
"  :vs66                      | (C) -> create a vertical split using 66% width
"  :sp33                      | (C) -> create a split using 33% of the height
"  :sp66                      | (C) -> create a split using 66% of the height
"  :diff                      | (C) -> open a new file in diff mode
"
"  :ik                        | (C) -> add following character to keywords
"  :iK                        | (C) -> remove following character from keywords
"
"Mappings:
"  (mouse)
"    <Ctrl-ScrollUp>          | (A) -> scroll left
"    <Alt-ScrollUp>           | (A) -> scroll left
"    <Shift-ScrollUp>         | (A) -> scroll left
"    <Ctrl-ScrollDown>        | (A) -> scroll right
"    <Alt-ScrollDown>         | (A) -> scroll right
"    <Shift-ScrollDown>       | (A) -> scroll right
"
"    <MiddleClick>            | (A) -> selects from the cursor
"    <Ctrl-LeftClick>         | (A) -> selects from the cursor
"    <Alt-LeftClick>          | (A) -> select the line being clicked
"    <Ctrl-Alt-LeftClick>     | (A) -> select the paragraph being clicked
"
"    <Ctrl-RightClick>        | (A) -> copy selection or character under cursor
"    <Ctrl-MiddleClick>       | (A) -> copy selection or character under cursor
"
"    <Alt-RightClick>         | (A) -> cut selection or character under cursor
"    <Alt-MiddleClick>        | (A) -> cut selection or character under cursor
"
"    <Ctrl-Alt-RightClick>    | (A) -> paste at the cursor (not mouse)
"    <Ctrl-Alt-MiddleClick>   | (A) -> paste at the cursor (not mouse)
"
"    <Shift-MiddleClick>      | (A) -> paste from xorg paste buffer
"
"  (tabs)
"    <Alt-n>                  | (N) -> go to the next open tab
"    <Alt-p>                  | (N) -> go to the previous open tab
"    <Alt-t>                  | (N) -> open a new tab
"    <Alt-c>                  | (N) -> create a new tab with vimfiler
"    <Alt-d>                  | (N) -> create a new tab with a double pane vimfiler
"
"  (split)
"    <Ctrl-w>{                | (N) -> rotate counter-clockwise
"    <Ctrl-w>}                | (N) -> rotate clockwise
"    <Ctrl-w>]                | (N) -> split vertically
"    <Ctrl-w>0                | (N) -> create a vertical split 33% of the window
"    <Ctrl-w>)                | (N) -> create a vertical split 66% of the window
"    <Ctrl-w>[                | (N) -> split horizontally
"    <Ctrl-w>9                | (N) -> create a horizontal split 33% of the window
"    <Ctrl-w>(                | (N) -> create a horizontal split 66% of the window
"
"  (display)
"    <Backspace>              | (N) -> reset window and clear search
"    //                       | (N) -> reset window and clear search
"    n                        | (N) -> center vertically on next search term
"    N                        | (N) -> center vertically on last search term
"    *                        | (N) -> center vertically on nth next search term
"    #                        | (N) -> center vertically on nth last search term
"
"  (toggles and features)
"    ik                       | (N) -> add cursor character as a keyword
"    iK                       | (N) -> remove cursor character as a keyword
"
"    ~                        | (N) -> popup a command reference
"    <Leader><F1>             | (N) -> toggle the vim reference manual
"    <Leader>?                | (N) -> toggle the vim reference manual
"    `                        | (A) -> toggle the gutter(numbers+folds+signify)
"
"    <Space><Space>           | (N) -> toggle selected fold
"
"    <F1>                     | (A) -> toggle line wrapping
"    <F2>                     | (A) -> toggle spell check
"    <F3>                     | (A) -> toggle external-paste mode
"    <F4>                     | (A) -> toggle syntax checking
"
"    <F9>                     | (A) -> toggle git commit history
"    <Leader>}                | (N) -> toggle git commit history
"    <F10>                    | (A) -> toggle the tagbar sidebar
"    <Leader>{                | (N) -> toggle the tagbar sidebar
"    <F11>                    | (A) -> toggle the location list
"    <Leader><Leader>         | (N) -> toggle the location list
"    <F12>                    | (A) -> toggle vimfiler sidebar
"    <Leader>[                | (N) -> toggle vimfiler sidebar
"
"  (gvim toggles)
"    <Leader><F1>             | (A) -> toggle the menubar
"    <Leader><F2>             | (A) -> toggle the toolbar
"    <Leader><F3>             | (A) -> toggle the scrollbars
"
"  (spellcheck)
"    ?+                       | (N) -> add the selected word to the local dictionary
"    ??                       | (N) -> show spelling suggestions for selected word
"    ?N                       | (N) -> go to the next spelling mistake
"    ?P                       | (N) -> go to the previous spelling mistake
"
"  (copy/paste and undo/redo)
"    <Leader>p                | (N) -> view the paste buffers and register contents
"    P                        | (V) -> save selection to the buffer and paste over
"    p                        | (V) -> preserve the buffer pasting over selected text
"    Y                        | (N) -> copy to the end of the line
"
"    (delete/cut operations that don't replace the paste buffer)
"      <Leader>x              | (N) -> delete the char(s) under and the cursor
"      <Leader>x              | (V) -> delete the currently selected text
"      <Leader>X              | (N) -> delete the char(s) before the cursor
"      <Leader>X              | (V) -> delete the currently selected lines
"      <Leader>D              | (N) -> delete from the cursor to EOL
"      <Leader>D              | (V) -> delete the currently selected lines
"      <Leader>dw             | (N) -> delete from the cursor to end of the word
"      <Leader>dd             | (N) -> delete current line
"      <Leader>d              | (V) -> delete selected text
"
"  (fixing-and-formatting)
"    <Leader>J                | (N) -> split document into lines of tw or 80
"    <Leader>J                | (V) -> split selection into lines of tw or 80
"    <Leader>f                | (N) -> format document and return to cursor
"    <Leader>f                | (V) -> format the selection and return to cursor
"    <Leader>F                | (N) -> run available ale fixers on the document
"    <Leader>t                | (N) -> convert tabs into spaces
"    <Leader>T                | (N) -> convert spaces into tabs
"    <Leader>w                | (N) -> remove whitespace
"    <Tab>                    | (V) -> indent all the lines currently selected
"    <Tab>                    | (N) -> indent the current line
"    <Leader>>                | (V) -> indent all the lines currently selected
"    <Leader>>                | (N) -> indent the current line
"    <Shift-Tab>              | (V) -> un-indent all the lines currently selected
"    <Shift-Tab>              | (N) -> un-indent the current line
"    <Leader><                | (V) -> un-indent all the lines currently selected
"    <Leader><                | (N) -> un-indent the current line
"
"  (macros)
"    '                        | (N) -> run a macro
"
"  (movement)
"    =                        | (N) -> go to the first char on the next line
"    _                        | (N) -> go to the first char on the previous line
"
"    <Ctrl-Up>                | (N) -> move four lines up
"    <Ctrl-Down>              | (N) -> move four lines down
"    <Ctrl-Right>             | (N) -> move one word right
"    <Ctrl-Left>              | (N) -> move one word left
"
"    <Alt-Up>                 | (A) -> move the screen up
"    <Alt-Down>               | (A) -> move the screen down
"    <Alt-Right>              | (A) -> move the screen to the right
"    <Alt-Left>               | (A) -> move the screen to the left
"
"    <Shift-Up>               | (N) -> move to the beginning of the document
"    <Shift-Down>             | (N) -> move to the end of the document
"    <Shift-Right>            | (N) -> move to the end of the line
"    <Shift-Left>             | (N) -> move to the beginning of the non-whitespace
"
"    <Shift-Ctrl-Up>          | (V) -> vim-move: move a block up one line
"    <Shift-Ctrl-Down>        | (V) -> vim-move: move a block down one line
"    <Shift-Ctrl-Up>          | (N) -> vim-move: move a line up one line
"    <Shift-Ctrl-Down>        | (N) -> vim-move: move a line down one line
"
"    >>                       | (N) -> next difference (vimdiff/signify)
"    <<                       | (N) -> previous difference (vimdiff/signify)
"
"  (selection)
"    <Ctrl-a>                 | (N) -> select all text
"    <Ctrl-a>                 | (V) -> select all text
"
"    <Shift-Up>               | (V) -> select all text above
"    <Shift-Down>             | (V) -> select all text below
"    <Shift-Right>            | (V) -> select all text to the right
"    <Shift-Left>             | (V) -> select all text to the left up to the indent
"
"    <Ctrl-Up>                | (V) -> select four lines up
"    <Ctrl-Down>              | (V) -> select four lines down
"    <Ctrl-Right>             | (V) -> select one word right
"    <Ctrl-Left>              | (V) -> select one word left
"
"Filetype Specific Mappings:
"  (help)
"    q                        | (A) -> close the dialog
"    <Leader>?                | (A) -> close the dialog
"    ?>                       | (A) -> close the dialog
"    ?<                       | (A) -> close the dialog
"
"  (error/location list)
"    <Left>                   | (A) -> up
"    <Right>                  | (A) -> down
"    l                        | (A) -> k
"    h                        | (A) -> j
"    <LClick><LClick>         | (A) -> select entry
"    <Space>                  | (A) -> select entry but remain in qf sidebar
"    q                        | (A) -> close the list
"
"  (vimdiff)
"    <Leader><>               | (N) -> update differences
"    <Leader>,.               | (N) -> update differences
"    <Leader>><               | (N) -> update differences
"    <Leader>.,               | (N) -> update differences
"    <Leader>>                | (N) -> replace diff in other pane with current pane
"    <Leader>.                | (N) -> replace diff in other pane with current pane
"    <Leader<<                | (N) -> replace diff in current pane with other pane
"    <Leader<,                | (N) -> replace diff in current pane with other pane
"
"  (vimfiler)
"    <LClick>                 | (A) -> left click + left justify the cursor
"    <MClick>                 | (A) -> same as the left click
"    <RClick>                 | (A) -> same as the left click
"    <LClick><LClick>         | (A) -> edit selected file
"    <Right>                  | (A) -> map to l, which opens a directory
"    <Left>                   | (A) -> map to h, which goes up one directory
"    '                        | (A) -> edit the selected file
"    n                        | (A) -> start editing a new file

"DISABLED DEFAULT MAPPING: UNSET SHORTCUTS {{{
    "-unmapping tabbing from < and > for use with diff
    "+these commands are replaced by tab and shift+tab
    noremap > <Nop>
    noremap < <Nop>

    "-unmapping help from F1 and Ctrl-F1 for use toggling the reference manual
    "+the :h topic feature works, and <Leader>? displays quickref
    map <F1> <Nop>
    map <A-F1> <Nop>
    map <C-F1> <Nop>

    "-unmap the suspend function
    map <C-z> <Nop>

    "-unmap ex mode
    nnoremap Q <Nop>

    "unmap shift+k opening help
    nnoremap <S-k> <Nop>
"}}}

"ALIASES: COMMAND SHORTCUTS {{{
    "shortcuts to git commands
    cabbrev <expr><silent> GitDiff ':Gdiff<CR>'
    cabbrev <expr><silent> gitdiff ':Gdiff<CR>'
    cabbrev <expr><silent> GitStatus ':Gstatus<CR>'
    cabbrev <expr><silent> gitstatus ':Gstatus<CR>'
    cabbrev <expr><silent> GitCommit ':Gcommit<CR>'
    cabbrev <expr><silent> gitcommit ':Gcommit<CR>'

    "create various sizes of splits
    cabbrev <expr><silent> vs33 ':VS33<CR>'
    cabbrev <expr><silent> vs66 ':VS66<CR>'
    cabbrev <expr><silent> sp33 ':SP33<CR>'
    cabbrev <expr><silent> sp66 ':SP66<CR>'
    cabbrev diff vertical diffsplit

    "add/remove character as keyword
    cabbrev ik setlocal iskeyword+=
    cabbrev iK setlocal iskeyword-=
"}}}

"MAPPINGS: GENERAL KEYBINDINGS AND REBINDINGS {{{
    "MOUSE:{
        "hold ctrl to scroll left/right instead of up/down
        noremap <C-ScrollWheelUp> 4zh
        nnoremap <C-ScrollWheelUp> 4zh
        xnoremap <C-ScrollWheelUp> 4zh
        snoremap <C-ScrollWheelUp> 4zh
        vnoremap <C-ScrollWheelUp> 4zh
        inoremap <C-ScrollWheelUp> <C-O>4zh

        noremap <A-ScrollWheelUp> 4zh
        nnoremap <A-ScrollWheelUp> 4zh
        xnoremap <A-ScrollWheelUp> 4zh
        snoremap <A-ScrollWheelUp> 4zh
        vnoremap <A-ScrollWheelUp> 4zh
        inoremap <A-ScrollWheelUp> <C-O>4zh

        noremap <S-ScrollWheelUp> 4zh
        nnoremap <S-ScrollWheelUp> 4zh
        xnoremap <S-ScrollWheelUp> 4zh
        snoremap <S-ScrollWheelUp> 4zh
        vnoremap <S-ScrollWheelUp> 4zh
        inoremap <S-ScrollWheelUp> <C-O>4zh

        noremap <C-ScrollWheelDown> 4zl
        nnoremap <C-ScrollWheelDown> 4zl
        xnoremap <C-ScrollWheelDown> 4zl
        snoremap <C-ScrollWheelDown> 4zl
        vnoremap <C-ScrollWheelDown> 4zl
        inoremap <C-ScrollWheelDown> <C-O>4zl

        noremap <A-ScrollWheelDown> 4zl
        nnoremap <A-ScrollWheelDown> 4zl
        xnoremap <A-ScrollWheelDown> 4zl
        snoremap <A-ScrollWheelDown> 4zl
        vnoremap <A-ScrollWheelDown> 4zl
        inoremap <A-ScrollWheelDown> <C-O>4zl

        noremap <S-ScrollWheelDown> 4zl
        nnoremap <S-ScrollWheelDown> 4zl
        xnoremap <S-ScrollWheelDown> 4zl
        snoremap <S-ScrollWheelDown> 4zl
        vnoremap <S-ScrollWheelDown> 4zl
        inoremap <S-ScrollWheelDown> <C-O>4zl

        "middle & ctrl+left = select from cursor
        nnoremap <MiddleMouse> <RightMouse>
        xnoremap <MiddleMouse> <RightMouse>
        snoremap <MiddleMouse> <RightMouse>
        vnoremap <MiddleMouse> <RightMouse>
        inoremap <MiddleMouse> <RightMouse>

        nnoremap <C-LeftMouse> <RightMouse>
        xnoremap <C-LeftMouse> <RightMouse>
        snoremap <C-LeftMouse> <RightMouse>
        vnoremap <C-LeftMouse> <RightMouse>
        inoremap <C-LeftMouse> <RightMouse>

        "alt+left = line
        nnoremap <A-LeftMouse> <LeftMouse>V
        xnoremap <A-LeftMouse> <RightMouse>$
        snoremap <A-LeftMouse> <RightMouse>$
        vnoremap <A-LeftMouse> <RightMouse>$
        inoremap <A-LeftMouse> <Esc><LeftMouse>V

        "ctrl+alt+left = select paragraph
        nnoremap <C-A-LeftMouse> <LeftMouse>vip
        xnoremap <C-A-LeftMouse> <RightMouse>ip$
        snoremap <C-A-LeftMouse> <RightMouse>ip$
        vnoremap <C-A-LeftMouse> <RightMouse>ip$
        inoremap <C-A-LeftMouse> <Esc><LeftMouse>vip

        "ctrl+(middle/right) = copy
        nnoremap <C-RightMouse> <LeftMouse>Vy
        xnoremap <C-RightMouse> y
        snoremap <C-RightMouse> y
        vnoremap <C-RightMouse> y
        inoremap <C-RightMouse> <C-0>y

        nnoremap <C-MiddleMouse> <LeftMouse>Vy
        xnoremap <C-MiddleMouse> y
        snoremap <C-MiddleMouse> y
        vnoremap <C-MiddleMouse> y
        inoremap <C-MiddleMouse> <C-0>y

        "alt+(middle/right) = cut
        nnoremap <A-RightMouse> x
        xnoremap <A-RightMouse> x
        snoremap <A-RightMouse> x
        vnoremap <A-RightMouse> x
        inoremap <A-RightMouse> <C-O>x

        nnoremap <A-MiddleMouse> x
        xnoremap <A-MiddleMouse> x
        snoremap <A-MiddleMouse> x
        vnoremap <A-MiddleMouse> x
        inoremap <A-MiddleMouse> <C-O>x

        "ctrl+alt+(middle/right) = paste
        nnoremap <C-A-RightMouse> p
        xnoremap <C-A-RightMouse> p
        snoremap <C-A-RightMouse> p
        vnoremap <C-A-RightMouse> p
        inoremap <C-A-RightMouse> <C-O>p

        nnoremap <C-A-MiddleMouse> p
        xnoremap <C-A-MiddleMouse> p
        snoremap <C-A-MiddleMouse> p
        vnoremap <C-A-MiddleMouse> p
        inoremap <C-A-MiddleMouse> <C-O>p

        "configure middle click to paste from X
        noremap <S-Insert> <MiddleMouse>
        noremap! <S-Insert> <MiddleMouse>
    "}

    "TABS:{
        nnoremap <silent><expr> <A-n> ':tabnext<CR>'
        nnoremap <silent><expr> <A-p> ':tabprev<CR>'
        nnoremap <silent><expr> <A-t> ':tabnew<CR>'
        nnoremap <silent><expr> <A-c> ':VimFiler -tab -project<CR>'
        nnoremap <silent><expr> <A-d> ':VimFiler -tab -project -double<CR>'
    "}

    "SPLIT:{
        nmap <expr><silent> <C-w>{ ':wincmd R<CR>'
        nmap <expr><silent> <C-w>} ':wincmd r<CR>'
        nmap <expr><silent> <C-w>] ':vs<CR>'
        nmap <expr><silent> <C-w>0 ':VS33<CR>'
        nmap <expr><silent> <C-w>) ':VS66<CR>'
        nmap <expr><silent> <C-w>[ ':sp<CR>:wincmd j<CR>'
        nmap <expr><silent> <C-w>9 ':SP33<CR>'
        nmap <expr><silent> <C-w>( ':SP66<CR>'
    "}

    "DISPLAY:{
        "clear search and reset buffer
        nnoremap <silent><expr> <BackSpace> ':noh<CR>:redraw!<CR>'
        nnoremap <silent><expr> // ':noh<CR>:redraw!<CR>'

        "keep the currently highlighted term in a search vertically centered
        nnoremap <silent>n nzz
        nnoremap <silent>N Nzz
        nnoremap <silent>* *zz
        nnoremap <silent># #zz
    "}

    "TOGGLES AND FEATURES:{
        "add/remove cursor character as a keyword
        nmap <expr><silent> <Leader>k ':execute "setlocal iskeyword+=".getline(".")[col(".")-1]<CR>:echo "The character ".getline(".")[col(".")-1]." has been added to iskeyword"<CR>'
        nmap <expr><silent> <Leader>K ':execute "setlocal iskeyword-=".getline(".")[col(".")-1]<CR>:echo "The character ".getline(".")[col(".")-1]." has been removed from iskeyword"<CR>'

        "toggle the command reference box
        nnoremap <silent><expr> ~ ':TCommand<CR>'

        "toggle the vim reference manual
        nnoremap <silent><expr> <Leader>? ':h index.txt<CR>'

        "toggle the display of the left gutter
        nnoremap <silent><expr> ` ':if (&number)<Bar>set nonumber<Bar>if exists("b:sy")<Bar>SignifyDisable<Bar>endif<Bar>else<Bar>set number<Bar>if exists("b:sy")<Bar>SignifyEnable<Bar>endif<Bar>endif<CR>:echo "gutter visibility toggled"<CR>'

        "toggle folded code at foldpoints
        nnoremap <Space><Space> za

        "toggle line wrapping (and bottom bar if using the gui)
        nnoremap <silent><expr> <F1> ':set wrap!<CR>:echo "line wrapping toggled"<CR>'
        xnoremap <silent><expr> <F1> '<Esc>:set wrap!<CR>gv'
        inoremap <silent><expr> <F1> '<C-O>:set wrap!<CR>'

        "toggle show spelling errors
        nnoremap <silent><expr> <F2> ':set spell!<CR>:if &spell =~ "0"<Bar>echo "spellcheck toggled off"<Bar>else<Bar>echo "spellcheck toggled on"<Bar>endif<CR>'
        xnoremap <silent><expr> <F2> '<Esc>:set spell!<CR>gv'
        inoremap <silent><expr> <F2> '<C-O>:set spell!<CR>'

        "toggle external-paste mode
        nnoremap <silent><expr> <F3> ':if &paste<Bar>set paste!<Bar>else<Bar>set paste<Bar>endif<CR>'

        "toggle syntax checking
        function! ToggleAle()
            ALEToggle

            if g:ale_enabled
                set scl=yes
            else
                set scl=auto
            endif
        endfunction

        nnoremap <silent><expr> <F4> ':call ToggleAle()<CR>'
        xnoremap <silent><expr> <F4> '<Esc>:call ToggleAle()<CR>gv'
        inoremap <silent><expr> <F4> '<C-O>:call ToggleAle()<CR>'

        "view commit history and diffs
        nnoremap <expr><silent> <F9> ':vs<CR>:0Gclog<CR>:wincmd b<CR>'
        xnoremap <expr><silent> <F9> '<Esc>:vs<CR>:0Gclog<CR>:wincmd b<CR>'
        inoremap <expr><silent> <F9> '<Esc>:vs<CR>:0Gclog<CR>:wincmd b<CR>'
        nnoremap <silent><expr> <Leader>} ':vs<CR>:0Gclog<CR>:wincmd b<CR>'

        "bindings to trigger the tagbar list of tags
        nnoremap <silent><expr> <F10> ':TagbarToggle<CR>:echo "tagbar toggled"<CR>'
        xnoremap <silent><expr> <F10> '<Esc>:TagbarToggle<CR>gv'
        inoremap <silent><expr> <F10> '<C-O>:TagbarToggle<CR>'
        nnoremap <silent><expr> <Leader>{ ':TagbarToggle<CR>:echo "tagbar toggled"<CR>'

        "toggle the location list
        nnoremap <silent><expr> <F11> ':call ToggleLocationList()<CR>'
        xnoremap <silent><expr> <F11> '<Esc>:call ToggleLocationList()<CR>'
        inoremap <silent><expr> <F11> '<C-O>:call ToggleLocationList()<CR>'
        nnoremap <silent><expr> <Leader><Leader> ':call ToggleLocationList()<CR>'

        "trigger vimfiler
        nnoremap <silent><expr> <F12> ':VimFiler -split -simple -toggle -no-quit -direction=topleft -winwidth=45<CR>'
        xnoremap <silent><expr> <F12> '<Esc>:VimFiler -split -simple -toggle -no-quit -direction=topleft -winwidth=45<CR>'
        inoremap <silent><expr> <F12> '<Esc>:VimFiler -split -simple -toggle -no-quit -direction=topleft -winwidth=45<CR>'
        nnoremap <silent><expr> <Leader>[ ':VimFiler -split -simple -toggle -no-quit -direction=topleft -winwidth=45<CR>'
    "}

    "GVIM TOGGLES:{
        "toggle the menu
        nnoremap <silent><expr> <Leader><F1> ":if &go=~#'m'<Bar>set go-=m<Bar>else<Bar>set go+=m<Bar>endif<CR>:echo 'Menu bar toggled'<CR>"
        vnoremap <silent><expr> <Leader><F1> "<Esc>:if &go=~#'m'<Bar>set go-=m<Bar>else<Bar>set go+=m<Bar>endif<CR>gv"
        inoremap <silent><expr> <Leader><F1> "<C-O>:if &go=~#'m'<Bar>set go-=m<Bar>else<Bar>set go+=m<Bar>endif<CR>"

        "toggle the toolbar
        nnoremap <silent><expr> <Leader><F2> ":if &go=~#'T'<Bar>set go-=T<Bar>else<Bar>set go+=T<Bar>endif<CR>:echo 'Toolbar toggled'<CR>"
        vnoremap <silent><expr> <Leader><F2> "<Esc>:if &go=~#'T'<Bar>set go-=T<Bar>else<Bar>set go+=T<Bar>endif<CR>gv"
        inoremap <silent><expr> <Leader><F2> "<C-O>:if &go=~#'T'<Bar>set go-=T<Bar>else<Bar>set go+=T<Bar>endif<CR>"

        "toggle the scrollbars
        nnoremap <silent><expr> <Leader><F3> ":if &go=~#'l'<Bar>set go-=lRb<Bar>else<Bar>set go+=lRb<Bar>endif<CR>:echo 'Scrollbars toggled'<CR>"
        vnoremap <silent><expr> <Leader><F3> "<Esc>:if &go=~#'l'<Bar>set go-=lRb<Bar>else<Bar>set go+=lRb<Bar>endif<CR>gv"
        inoremap <silent><expr> <Leader><F3> "<C-O>:if &go=~#'l'<Bar>set go-=lRb<Bar>else<Bar>set go+=lRb<Bar>endif<CR>"
    "}

    "SPELLCHECK:{
        "add the selected mispelled word to the local dictionary
        nnoremap ?+ zg

        "display a list of suggestions for the selected mispelled word
        nnoremap ?? hea<C-X>s

        "go to the next mispelled word
        nnoremap ?N ]s

        "go to the previous mispelled word
        nnoremap ?P [s
    "}

    "COPY PASTE AND UNDO REDO:{
        "display contents of paste buffers
        nnoremap <silent><expr> <Leader>p ':reg<CR>'

        "P pastes and replaces the buffer, p pastes and keeps it
        vnoremap P p
        xmap p <Plug>ReplaceWithRegisterVisual

        "copy to the end of the line
        nnoremap Y vg_y

        "delete/cut operations that don't replace the paste buffer
        nnoremap <Leader>x "_x
        vnoremap <Leader>x "_x
        nnoremap <Leader>X "_X
        vnoremap <Leader>X "_X
        nnoremap <Leader>D "_D
        vnoremap <Leader>D "_D
        nnoremap <Leader>dd "_dd
        nnoremap <Leader>dw "_dw
        vnoremap <Leader>d "_d
    "}

    "FIXING AND FORMATTING:{
        "format width to text width (or 80 chars if text width is 0)
        nnoremap <silent><expr> <Leader>J ':let b:tw=&textwidth<CR>:if (b:tw == 0)<Bar>set tw=80<Bar>endif<CR>gg0vG$gq:if (b:tw == 0)<Bar>set tw=0<Bar>let b:tw=80<Bar>endif<CR>:echo "Document has been formatted to a width of ".b:tw." characters"<CR>'
        vnoremap <silent><expr> <Leader>J '<Esc>:let b:tw=&textwidth<CR>:if (b:tw == 0)<Bar>set tw=80<Bar>endif<CR>gvgq:if (b:tw == 0)<Bar>set tw=0<Bar>let b:tw=80<Bar>endif<CR>:echo "Selection has been formatted to a width of ".b:tw." characters"<CR>'

        "format by Vim syntax
        nnoremap <Leader>f mzgg=G`z<CR>:echo "The document has been formatted"<CR>
        vnoremap <Leader>f mz=`z<CR>:echo "The selection has been formatted"<CR>

        "fix with ale
        nnoremap <silent><expr> <Leader>F ':ALEFix<CR>:echo "Available ale fixers have been run on the document"<CR>'

        "convert tabs to spaces and spaces to tabs
        nnoremap <silent><expr> <Leader>t ':let b:et=&expandtab<CR>:set expandtab<CR>:retab!<CR>:let &expandtab=b:et<CR>:echo "Tabs have been converted to spaces"<CR>'
        nnoremap <silent><expr> <Leader>T ':let b:et=&expandtab<CR>:set noexpandtab<CR>:%retab!<CR>:let &expandtab=b:et<CR>:echo "Spaces have been converted to tabs"<CR>'

        "remove trailing whitespace
        nnoremap <silent><expr> <Leader>w ':FixWhitespace<CR>:echo "Trailing whitespace has been removed"<CR>'

        "tab/<Leader>> and untab/<Leader>< the currently selected lines
        vnoremap <Tab> >gv
        nnoremap <Tab> v>gv<Esc>
        vnoremap <Leader>> >gv
        nnoremap <Leader>> v>gv<Esc>
        vnoremap <S-Tab> <gv
        nnoremap <S-Tab> v<gv<Esc>
        vnoremap <Leader>< <gv
        nnoremap <Leader>< v<gv<Esc>
    "}

    "MACROS:{
        nnoremap ' @
    "}

    "MOVEMENT:{
        "additional mappings for easier access
        nnoremap = +
        nnoremap _ -

        "map ctrl+direction to shifting the screen in that direction
        nnoremap <C-Up> 4k
        nnoremap <C-Down> 4j
        nnoremap <C-Right> <S-Right>
        nnoremap <C-Left> <S-Left>

        noremap <A-Up> <ScrollWheelUp>
        nnoremap <A-Up> <ScrollWheelUp>
        xnoremap <A-Up> <ScrollWheelUp>
        snoremap <A-Up> <ScrollWheelUp>
        vnoremap <A-Up> <ScrollWheelUp>
        inoremap <A-Up> <ScrollWheelUp>
        noremap <A-Down> <ScrollWheelDown>
        nnoremap <A-Down> <ScrollWheelDown>
        xnoremap <A-Down> <ScrollWheelDown>
        snoremap <A-Down> <ScrollWheelDown>
        vnoremap <A-Down> <ScrollWheelDown>
        inoremap <A-Down> <ScrollWheelDown>
        noremap <A-Right> 4zl
        nnoremap <A-Right> 4zl
        xnoremap <A-Right> 4zl
        snoremap <A-Right> 4zl
        vnoremap <A-Right> 4zl
        inoremap <A-Right> <C-O>4zl
        noremap <A-Left> 4zh
        nnoremap <A-Left> 4zh
        xnoremap <A-Left> 4zh
        snoremap <A-Left> 4zh
        vnoremap <A-Left> 4zh
        inoremap <A-Left> <C-O>4zh

        "remap keys to scroll to the end in a direction
        nnoremap <S-Up> gg0
        nnoremap <S-Down> G$
        nnoremap <S-Right> $
        nnoremap <S-Left> ^

        "remap shift+ctrl+up/down to move blocks up/down a line with vim-move
        vmap <S-C-Up> <Plug>MoveBlockUp
        vmap <S-C-Down> <Plug>MoveBlockDown
        nmap <S-C-Up> <Plug>MoveLineUp
        nmap <S-C-Down> <Plug>MoveLineDown

        "map signify to ]c and [c
        let g:signify_mapping_next_hunk = ']c'
        let g:signify_mapping_prev_hunk = '[c'

        "move to next/previous difference (vimdiff/signify)
        nmap >> ]c
        nmap << [c
    "}

    "SELECTION:{
        "ctrl-a to select all
        nnoremap <C-a> gg0vG$
        xnoremap <C-a> <Esc>gg0vG$

        "map remap keys for speedier text selection
        xnoremap <C-Up> 4k
        xnoremap <C-Down> 4j
        xnoremap <C-Right> <S-Right>
        xnoremap <C-Left> <S-Left>

        "remap keys to select all text in one direction
        xnoremap <S-Up> gg0
        xnoremap <S-Down> G$
        xnoremap <S-Right> $
        xnoremap <S-Left> ^
    "}
"}}}

"FILETYPE SPECIFIC MAPPINGS: {{{
    "help
    if !&diff
        autocmd FileType help map <buffer> <silent><expr> q ':q<CR>'
        autocmd FileType help map <buffer> <silent><expr> <Leader><F1> ':q<CR>'
        autocmd FileType help map <buffer> <silent><expr> <Leader>? ':q<CR>'
    endif

    "error/location list
    autocmd FileType qf map <buffer> <Left> <Up>
    autocmd FileType qf map <buffer> <Right> <Down>
    autocmd FileType qf map <buffer> l j
    autocmd FileType qf map <buffer> h k
    autocmd FileType qf map <buffer> <2-LeftMouse> <CR>
    autocmd FileType qf map <buffer> <Space> <CR><C-w>p
    autocmd FileType qf if getwininfo(win_getid())[0]['loclist'] == 0|map <buffer> <silent><expr> q ':call ToggleQuickfixList()<CR>'|else|map <buffer> <silent><expr> q ':call ToggleLocationList()<CR>'|endif

    "vimdiff
    autocmd FilterWritePre * if &diff|nmap <buffer> <silent><expr> <Leader><> ':diffu<CR>'|endif
    autocmd FilterWritePre * if &diff|nmap <buffer> <silent><expr> <Leader>,. ':diffu<CR>'|endif
    autocmd FilterWritePre * if &diff|nmap <buffer> <silent><expr> <Leader>>< ':diffu<CR>'|endif
    autocmd FilterWritePre * if &diff|nmap <buffer> <silent><expr> <Leader>., ':diffu<CR>'|endif
    autocmd FilterWritePre * if &diff|nmap <buffer> <Leader>> dp|endif
    autocmd FilterWritePre * if &diff|nmap <buffer> <Leader>. dp|endif
    autocmd FilterWritePre * if &diff|nmap <buffer> <Leader>< do|endif
    autocmd FilterWritePre * if &diff|nmap <buffer> <Leader>, do|endif
    autocmd FilterWritePre * if &diff|cabbrev q! qall!|endif

    "vimfiler
    autocmd FileType vimfiler map <buffer> <LeftMouse> <LeftMouse>0
    autocmd FileType vimfiler map <buffer> <MiddleMouse> <LeftMouse>
    autocmd FileType vimfiler map <buffer> <RightMouse> <LeftMouse>
    autocmd FileType vimfiler map <buffer> <2-LeftMouse> <Plug>(vimfiler_edit_file)
    autocmd FileType vimfiler map <buffer> <Right> l
    autocmd FileType vimfiler map <buffer> <Left> h
    autocmd FileType vimfiler map <buffer> ' e
"}}}

"MAPPINGS DISABLED FOR GIVEN FILETYPES: {{{
    "remove incompatible toggles from specific file types
    autocmd Filetype help,tagbar,qf,vimfiler noremap <buffer> ` <Nop>
    autocmd Filetype help,tagbar,qf,vimfiler,diff noremap <buffer> <F9> <Nop>
    autocmd Filetype help,tagbar,qf,vimfiler,diff noremap <buffer> <C-F9> <Nop>
    autocmd Filetype help,tagbar,qf,vimfiler,diff noremap <buffer> <A-F9> <Nop>
    autocmd Filetype help,tagbar,qf,vimfiler,diff noremap <buffer> <Leader>} <Nop>
    autocmd Filetype help,qf,vimfiler noremap <buffer> <F10> <Nop>
    autocmd Filetype help,qf,vimfiler noremap <buffer> <C-F10> <Nop>
    autocmd Filetype help,qf,vimfiler noremap <buffer> <A-F10> <Nop>
    autocmd Filetype help,qf,vimfiler noremap <buffer> <Leader>{ <Nop>
    autocmd Filetype help,tagbar,qf,vimfiler noremap <buffer> <F11> <Nop>
    autocmd Filetype help,tagbar,qf,vimfiler noremap <buffer> <C-F11> <Nop>
    autocmd Filetype help,tagbar,qf,vimfiler noremap <buffer> <A-F11>] <Nop>
    autocmd Filetype help,tagbar,qf,vimfiler noremap <buffer> <Leader> <Nop>
    autocmd Filetype help,tagbar,qf noremap <buffer> <F12> <Nop>
    autocmd Filetype help,tagbar,qf noremap <buffer> <C-F12> <Nop>
    autocmd Filetype help,tagbar,qf noremap <buffer> <A-F12> <Nop>
    autocmd Filetype help,tagbar,qf noremap <buffer> <Leader>[ <Nop>

    "disable modifier keys with directions that would interfere with logic
    autocmd Filetype qf,vimfiler noremap <buffer> <C-Up> <Nop>
    autocmd Filetype qf,vimfiler noremap <buffer> <C-k> <Nop>
    autocmd Filetype qf,vimfiler noremap <buffer> <C-Down> <Nop>
    autocmd Filetype qf,vimfiler noremap <buffer> <C-j> <Nop>
    autocmd Filetype qf,vimfiler noremap <buffer> <C-Right> <Nop>
    autocmd Filetype qf,vimfiler noremap <buffer> <C-l> <Nop>
    autocmd Filetype qf,vimfiler noremap <buffer> <C-Left> <Nop>
    autocmd Filetype qf,vimfiler noremap <buffer> <C-h> <Nop>
    autocmd Filetype qf,vimfiler noremap <buffer> <A-Up> <Nop>
    autocmd Filetype qf,vimfiler noremap <buffer> <A-k> <Nop>
    autocmd Filetype qf,vimfiler noremap <buffer> <A-Down> <Nop>
    autocmd Filetype qf,vimfiler noremap <buffer> <A-j> <Nop>
    autocmd Filetype qf,vimfiler noremap <buffer> <A-Right> <Nop>
    autocmd Filetype qf,vimfiler noremap <buffer> <A-l> <Nop>
    autocmd Filetype qf,vimfiler noremap <buffer> <A-Left> <Nop>
    autocmd Filetype qf,vimfiler noremap <buffer> <A-h> <Nop>
    autocmd Filetype qf,vimfiler noremap <buffer> <S-Up> <Nop>
    autocmd Filetype qf,vimfiler noremap <buffer> <S-k> <Nop>
    autocmd Filetype qf,vimfiler noremap <buffer> <S-Down> <Nop>
    autocmd Filetype qf,vimfiler noremap <buffer> <S-j> <Nop>
    autocmd Filetype qf,vimfiler noremap <buffer> <S-Right> <Nop>
    autocmd Filetype qf,vimfiler noremap <buffer> <S-l> <Nop>
    autocmd Filetype qf,vimfiler noremap <buffer> <S-Left> <Nop>
    autocmd Filetype qf,vimfiler noremap <buffer> <S-h> <Nop>
"}}}
