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
" Note:
"  *The default <Leader> key is: \
"
"  Aliases:
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
"  :wsudo & :sudow            | (C) -> write the file as root using sudo
"  :esudo & :sudoe            | (C) -> read a file as root using sudo
"
"  :ik                        | (C) -> add following character to keywords
"  :iK                        | (C) -> remove following character from keywords
"
" Reference: (view plugin documentation for the full list of commands each offers)
"   <Ctrl-_><Ctrl-_>          | (A) -> comment selection/create an empty comment
"   <Ctrl-_>b                 | (A) -> comment the current block(s)
"   <Ctrl-_>r                 | (A) -> comment everything on the line to the right
"   <Ctrl-_>p                 | (A) -> comment the current paragraph
"
"  (surround)
"    S"                       | (V) -> surround selection with quotes
"    S<a href="">             | (V) -> surround <a href="">selection</a>
"    ds"                      | (N) -> delete surrounding ""
"    dst                      | (N) -> delete surrounding tag (ie: <strong></strong>)
"    cs'"                     | (N) -> change surrounding '' to "" (any delimiters)
"    cs"<q>                   | (N) -> change surrounding "" to the tag: <q></q>
"    cst"                     | (N) -> change any surrounding tag to ""
"    ysiw'                    | (N) -> surround the current word with ''
"    yss'                     | (N) -> surround non-whitespace of current line with ''
"
" Mappings:
"  (mouse)
"    <Ctrl-ScrollUp>          | (A) -> scroll right quickly
"    <Ctrl-ScrollDown>        | (A) -> scroll left quickly
"    <Alt-ScrollUp>           | (A) -> scroll right slowly
"    <Alt-ScrollDown>         | (A) -> scroll left slowly
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
"    ,                        | (N) -> display tag information in echo area
"    <Leader><F1>             | (N) -> toggle the vim reference manual
"    <Leader>?                | (N) -> toggle the vim reference manual
"    `                        | (A) -> toggle the gutter(numbers+folds+signify)
"
"    <Space><Space>           | (N) -> toggle selected fold
"    <Space>=                 | (N) -> open all folds
"    <Space>+                 | (N) -> open all folds
"    <Space>-                 | (N) -> unopen all folds
"    <Space>_                 | (N) -> unopen all folds
"    <Space>0                 | (N) -> reset all folds using default fold level
"
"    <Ctrl-F1>                | (A) -> toggle vimfiler sidebar
"    <Alt-F1>                 | (A) -> toggle vimfiler sidebar
"    <Leader>[                | (A) -> toggle vimfiler sidebar
"    <Ctrl-F2>                | (A) -> toggle the tagbar sidebar
"    <Alt-F2>                 | (A) -> toggle the tagbar sidebar
"    <Leader>]                | (A) -> toggle the tagbar sidebar
"    <Ctrl-F3>                | (A) -> toggle the gundo sidebar
"    <Alt-F3>                 | (A) -> toggle the gundo sidebar
"    <Leader>{                | (A) -> toggle the gundo sidebar
"    <Ctrl-F4>                | (A) -> toggle extradite git commit history
"    <Alt-F4>                 | (A) -> toggle extradite git commit history
"    <Leader>}                | (A) -> toggle extradite git commit history
"
"    <F1>                     | (A) -> toggle line wrapping
"    <F2>                     | (A) -> toggle spell check
"    <F3>                     | (A) -> toggle external-paste mode
"    <F4>                     | (A) -> toggle syntax checking
"
"    <Ctrl-F12>               | (A) -> toggle goyo (distraction-free mode)
"    <Alt-F12>                | (A) -> toggle goyo (distraction-free mode)
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
"    y                        | (N) -> copy the character the cursor is on
"    <Ctrl-p>Direction        | (N) -> paste in the direction entered
"    T                        | (N) -> copy to the end of the line
"    T                        | (V) -> copy to the end of the line
"
"    (delete/cut functions)
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
"    (improved copy and paste shortcuts)
"      <Ctrl-v>               | (N) -> paste from buffer
"      <Ctrl-v>               | (V) -> paste buffer in place of selection
"      <Ctrl-v>               | (I) -> paste from buffer then return to input
"      <Ctrl-c>               | (N) -> copy character
"      <Ctrl-c>               | (V) -> copy selection
"      <Ctrl-x>               | (N) -> cut character
"      <Ctrl-x>               | (V) -> cut selection
"      <Ctrl-W>               | (I) -> cut previous word during input
"      <Ctrl-D>               | (I) -> cut line before cursor during input
"      <Ctrl-Y>               | (I) -> paste what's been cut during input
"
"  (autocompletion)
"    <Alt-m>,                 | (A) -> enter after emmet 'word' (ie: html:5)
"    <Enter>                  | (I) -> (neocomp) close the popup and <Enter>
"    <Tab>                    | (I) -> (neocomp) select/cycle popup completion
"    <Backspace>              | (I) -> (neocomp) close the popup and <Backspace>
"    <Ctrl-u>                 | (I) -> (neocomp) undo the most recent completion
"
"  (formatting)
"    <Backspace>              | (V) -> deletes currently selected text
"    <Leader>J                | (N) -> split document into lines of tw or 80
"    <Leader>J                | (V) -> split selection into lines of tw or 80
"    <Leader>f                | (N) -> format document and return to cursor
"    <Leader>f                | (V) -> format the selection and return to cursor
"    <Leader>F                | (N) -> format document using :Autoformat
"    <Leader>t                | (N) -> convert tabs into spaces
"    <Leader>T                | (N) -> convert spaces into tabs
"    <Leader>w                | (N) -> remove whitespace
"    <Leader>c                | (N) -> comment/uncomment current line
"    <Leader>c                | (V) -> comment/uncomment selection
"    <Leader>A                | (N) -> aligns comments using the comment symbol
"    <Leader>A                | (V) -> aligns selected comments
"    <Leader>a                | (N) -> aligns all comments after text
"    <Leader>a                | (V) -> aligns selected comments after text
"    <Tab>                    | (V) -> indent all the lines currently selected
"    <Tab>                    | (N) -> indent the current line
"    <Leader>>                | (V) -> indent all the lines currently selected
"    <Leader>>                | (N) -> indent the current line
"    <Shift-Tab>              | (V) -> un-indent all the lines currently selected
"    <Shift-Tab>              | (N) -> un-indent the current line
"    <Leader><                | (V) -> un-indent all the lines currently selected
"    <Leader><                | (N) -> un-indent the current line
"
"  (movement)
"    =                        | (N) -> go to the first char on the next line
"    _                        | (N) -> go to the first char on the previous line
"    <Shift-Up>               | (N) -> move to the beginning of the document
"    <Shift-Down>             | (N) -> move to the end of the document
"    <Shift-Right>            | (N) -> move to the end of the line
"    <Shift-Left>             | (N) -> move to the beginning of the non-whitespace
"
"    <Ctrl-Up>                | (N) -> move four lines up
"    <Ctrl-Down>              | (N) -> move four lines down
"    <Ctrl-Right>             | (N) -> move one word right
"    <Ctrl-Left>              | (N) -> move one word left
"
"    <Alt+Up>                 | (V) -> move a block up one line
"    <Alt+Down>               | (V) -> move a block down one line
"    <Alt+Up>                 | (N) -> move a line up one line
"    <Alt+Down>               | (N) -> move a line down one line
"
"    <Alt+Left>               | (V) -> move a block up a half page
"    <Alt+Right>              | (V) -> move a block down a half page
"    <Alt+Left>               | (N) -> move a line up a half page
"    <Alt+Right>              | (N) -> move a line down a half page
"    <Alt+h>                  | (V) -> move a block up a half page
"    <Alt+l>                  | (V) -> move a block down a half page
"    <Alt+h>                  | (N) -> move a line up a half page
"    <Alt+l>                  | (N) -> move a line down a half page
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
"    (remap dangerous functions that skip undo)
"      <Ctrl-u>               | (I) -> undo-able equivalent
"      <Ctrl-w>               | (I) -> undo-able equivalent
"
" Filetype Specific Mappings:
"  (extradite)
"    <Ctrl-F4>                | (A) -> close the dialog
"    <Alt-F4>                 | (A) -> close the dialog
"    <Right>                  | (A) -> same as down
"    l                        | (A) -> same as j
"    <Left>                   | (A) -> same as Up
"    h                        | (A) -> same as k
"
"  (gundo)
"    <LeftClick>              | (A) -> same as normal + justify on the left
"    <MiddleClick>            | (A) -> same as the left mouse
"    <RightClick>             | (A) -> same as the left mouse
"    <Right>                  | (A) -> same as down
"    l                        | (A) -> same as j
"    <Left>                   | (A) -> same as Up
"    h                        | (A) -> same as k
"
"  (help)
"    q                        | (A) -> close the dialog
"    <Leader><F1>             | (A) -> close the dialog
"    ?>                       | (A) -> close the dialog
"    ?<                       | (A) -> close the dialog
"
"  (qf sidebar mappings)
"    <LClick>                 | (A) -> left click + left justify the cursor
"    <MClick>                 | (A) -> same as the left click
"    <RClick>                 | (A) -> same as the left click
"    <LClick><LClick>         | (A) -> select entry
"    <Space>                  | (A) -> select entry but remain in qf sidebar
"    <Left>                   | (A) -> up
"    <Right>                  | (A) -> down
"    h                        | (A) -> j
"    l                        | (A) -> k
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
"

"DISABLED DEFAULT MAPPING: UNSET SHORTCUTS {{{
    "-unmapping tabbing from < and > for use with diff
    "+these commands are replaced by tab and shift+tab
    noremap > <Nop>
    noremap < <Nop>

    "-unmapping help from F1 and Ctrl-F1 for use toggling the reference manual
    "+the :h topic feature works, and <Leader><F1> displays quickref
    map <F1> <Nop>
    map <A-F1> <Nop>
    map <C-F1> <Nop>

    "-unmap the suspend function
    map <C-z> <Nop>
"}}}

"ALIASES: COMMAND SHORTCUTS {{{
    "shortcuts to git commands
    cabbrev <expr><silent> GitLog ':Extradite<CR>:wincmd x<CR>:wincmd j<CR>:resize 10<CR>'
    cabbrev <expr><silent> gitlog ':Extradite<CR>:wincmd x<CR>:wincmd j<CR>:resize 10<CR>'
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

    "read/write file with sudo
    cabbrev sudow SudoWrite
    cabbrev wsudo SudoWrite
    cabbrev sudoe SudoRead
    cabbrev esudo SudoRead

    "add/remove character as keyword
    cabbrev ik setlocal iskeyword+=
    cabbrev iK setlocal iskeyword-=
"}}}

"MAPPINGS: GENERAL KEYBINDINGS AND REBINDINGS {{{
    "MOUSE:{
        "hold ctrl to scroll left/right instead of up/down
        nnoremap <C-ScrollWheelUp> 4zl
        xnoremap <C-ScrollWheelUp> 4zl
        snoremap <C-ScrollWheelUp> 4zl
        vnoremap <C-ScrollWheelUp> 4zl
        inoremap <C-ScrollWheelUp> <C-O>4zl

        nnoremap <C-ScrollWheelDown> 4zh
        xnoremap <C-ScrollWheelDown> 4zh
        snoremap <C-ScrollWheelDown> 4zh
        vnoremap <C-ScrollWheelDown> 4zh
        inoremap <C-ScrollWheelDown> <C-O>4zh

        "hold alt to scroll left/right more precisely
        nnoremap <A-ScrollWheelUp> zl
        xnoremap <A-ScrollWheelUp> zl
        snoremap <A-ScrollWheelUp> zl
        vnoremap <A-ScrollWheelUp> zl
        inoremap <A-ScrollWheelUp> <C-O>zl

        nnoremap <A-ScrollWheelDown> zh
        xnoremap <A-ScrollWheelDown> zh
        snoremap <A-ScrollWheelDown> zh
        vnoremap <A-ScrollWheelDown> zh
        inoremap <A-ScrollWheelDown> <C-O>zh

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

        "display tag information in the gutter
        noremap <buffer> <silent><expr> , ':TTagechoWord<CR>'

        "toggle the vim reference manual
        nnoremap <silent><expr> <Leader><F1> ':h index.txt<CR>'
        nnoremap <silent><expr> <Leader>? ':h index.txt<CR>'

        "toggle the display of the left gutter
        nnoremap <silent><expr> ` ':if (&number)<Bar>set nonumber<Bar>if (&foldenable)<Bar>set nofoldenable<Bar>endif<Bar>if exists("b:sy")<Bar>if (b:sy.active)<Bar>SignifyToggle<Bar>endif<Bar>endif<Bar>else<Bar>set number<Bar>if !(&foldenable)<Bar>set foldenable<Bar>endif<Bar>if exists("b:sy")<Bar>if !(b:sy.active)<Bar>SignifyToggle<Bar>endif<Bar>endif<Bar>endif<CR>:echo "gutter visibility toggled"<CR>'

        "toggle folded code at foldpoints
        nnoremap <Space><Space> za

        "open all folds
        nnoremap <silent><expr> <Space>= 'zn:echo "all folds have been opened"<CR>'
        nnoremap <silent><expr> <Space>+ 'zn:echo "all folds have been opened"<CR>'

        "close folds set to be closed
        nnoremap <silent><expr> <Space>- 'zN:echo "all opened folds have been closed"<CR>'
        nnoremap <silent><expr> <Space>_ 'zN:echo "all opened folds have been closed"<CR>'

        "reset all folds to the default fold level
        nnoremap <silent><expr> <Space>0 'zX:echo "all folds have been reset"<CR>'

        "trigger vimfiler
        nnoremap <silent><expr> <C-F1> ':VimFiler -split -simple -toggle -no-quit -direction=topleft -winwidth=45<CR>'
        xnoremap <silent><expr> <C-F1> '<Esc>:VimFiler -split -simple -toggle -no-quit -direction=topleft -winwidth=45<CR>'
        inoremap <silent><expr> <C-F1> '<Esc>:VimFiler -split -simple -toggle -no-quit -direction=topleft -winwidth=45<CR>'
        nnoremap <silent><expr> <A-F1> ':VimFiler -split -simple -toggle -no-quit -direction=topleft -winwidth=45<CR>'
        xnoremap <silent><expr> <A-F1> '<Esc>:VimFiler -split -simple -toggle -no-quit -direction=topleft -winwidth=45<CR>'
        inoremap <silent><expr> <A-F1> '<Esc>:VimFiler -split -simple -toggle -no-quit -direction=topleft -winwidth=45<CR>'
        nnoremap <silent><expr> <Leader>[ ':VimFiler -split -simple -toggle -no-quit -direction=topleft -winwidth=45<CR>'

        "bindings to trigger the tagbar list of tags
        nnoremap <silent><expr> <C-F2> ':TagbarToggle<CR>:echo "tagbar toggled"<CR>'
        xnoremap <silent><expr> <C-F2> '<Esc>:TagbarToggle<CR>gv'
        inoremap <silent><expr> <C-F2> '<C-O>:TagbarToggle<CR>'
        nnoremap <silent><expr> <A-F3> ':TagbarToggle<CR>:echo "tagbar toggled"<CR>'
        xnoremap <silent><expr> <A-F3> '<Esc>:TagbarToggle<CR>gv'
        inoremap <silent><expr> <A-F3> '<C-O>:TagbarToggle<CR>'
        nnoremap <silent><expr> <Leader>] ':TagbarToggle<CR>:echo "tagbar toggled"<CR>'

        "bindings to trigger the gundo undo history
        nnoremap <silent><expr> <C-F3> ':GundoToggle<CR>:echo "undo history sidebar toggled"<CR>'
        xnoremap <silent><expr> <C-F3> '<Esc>:GundoToggle<CR>'
        inoremap <silent><expr> <C-F3> '<Esc>:GundoToggle<CR>'
        nnoremap <silent><expr> <A-F2> ':GundoToggle<CR>:echo "undo history sidebar toggled"<CR>'
        xnoremap <silent><expr> <A-F2> '<Esc>:GundoToggle<CR>'
        inoremap <silent><expr> <A-F2> '<Esc>:GundoToggle<CR>'
        nnoremap <silent><expr> <Leader>{ ':GundoToggle<CR>:echo "undo history sidebar toggled"<CR>'

        "view commit history and diffs
        nnoremap <expr><silent> <C-F4> ':SyntasticToggleOff<CR>:Extradite!<CR>:resize 10<CR>:wincmd x<CR>:wincmd b<CR>:wincmd H<CR>:wincmd b<CR>'
        xnoremap <expr><silent> <C-F4> '<Esc>:SyntasticToggleOff<CR>:Extradite!<CR>:resize 10<CR>:wincmd x<CR>:wincmd b<CR>:wincmd H<CR>:wincmd b<CR>'
        inoremap <expr><silent> <C-F4> '<Esc>:SyntasticToggleOff<CR>:Extradite!<CR>:resize 10<CR>:wincmd x<CR>:wincmd b<CR>:wincmd H<CR>:wincmd b<CR>'
        nnoremap <expr><silent> <A-F4> ':SyntasticToggleOff<CR>:Extradite!<CR>:resize 10<CR>:wincmd x<CR>:wincmd b<CR>:wincmd H<CR>:wincmd b<CR>'
        xnoremap <expr><silent> <A-F4> '<Esc>:SyntasticToggleOff<CR>:Extradite!<CR>:resize 10<CR>:wincmd x<CR>:wincmd b<CR>:wincmd H<CR>:wincmd b<CR>'
        inoremap <expr><silent> <A-F4> '<Esc>:SyntasticToggleOff<CR>:Extradite!<CR>:resize 10<CR>:wincmd x<CR>:wincmd b<CR>:wincmd H<CR>:wincmd b<CR>'
        nnoremap <silent><expr> <Leader>} ':SyntasticToggleOff<CR>:Extradite!<CR>:resize 10<CR>:wincmd x<CR>:wincmd b<CR>:wincmd H<CR>:wincmd b<CR>'

        "toggle line wrapping (and bottom bar if using the gui)
        nnoremap <silent><expr> <F1> ':set wrap!<CR>:echo "line wrapping toggled"<CR>'
        xnoremap <silent><expr> <F1> '<Esc>:set wrap!<CR>gv'
        inoremap <silent><expr> <F1> '<C-O>:set wrap!<CR>'

        "toggle show spelling errors
        nnoremap <silent><expr> <F2> ':set spell!<CR>:echo "spell checking toggled"<CR>'
        xnoremap <silent><expr> <F2> '<Esc>:set spell!<CR>gv'
        inoremap <silent><expr> <F2> '<C-O>:set spell!<CR>'

        "toggle external-paste mode
        set pastetoggle=<F3>

        "toggle syntax checking
        nnoremap <silent><expr> <F4> ':SyntasticToggleAll<CR>'
        xnoremap <silent><expr> <F4> '<Esc>:SyntasticToggleAll<CR>gv'
        inoremap <silent><expr> <F4> '<C-O>:SyntasticToggleAll<CR>'

        "toggle goyo
        nnoremap <silent><expr> <C-F12> ':Goyo<CR>'
        nnoremap <silent><expr> <A-F12> ':Goyo<CR>'
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
        nnoremap ?? hei<C-X><C-S>

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

        "copy the current character in normal mode
        nnoremap y vy

        "copy to the end of the line
        nnoremap T vg_y
        vnoremap T g_y

        "Alternatives to cut/deletion commands that don't replace the buffer
        nnoremap <Leader>x "_x
        vnoremap <Leader>x "_x
        nnoremap <Leader>X "_X
        vnoremap <Leader>X "_X
        nnoremap <Leader>D "_D
        vnoremap <Leader>D "_D
        nnoremap <Leader>dd "_dd
        nnoremap <Leader>dw "_dw
        vnoremap <Leader>d "_d

        "map copy/paste shortcuts to more typical ones
        nnoremap <C-v> P
        xmap <C-v> <Plug>ReplaceWithRegisterVisual
        inoremap <C-v> <C-O>p
        nnoremap <C-c> vy
        vnoremap <C-c> y
        nnoremap <C-x> x
        vnoremap <C-x> x
        inoremap <silent> <C-W> <C-\><C-O>db
        inoremap <silent> <C-D> <C-\><C-O>d0
        inoremap <silent> <C-Y> <C-R>"

        "remap ctrl-u and ctrl-w to safer alternatives
        inoremap <C-u> <C-g>u<C-u>
        inoremap <C-w> <C-g>u<C-w>
    "}

    "AUTOCOMPLETION:{
        "emmet switch triggerkey from ctrl-y
        let g:user_emmet_leader_key='<C-m>'

        "neocomplcache close popup and save indent
        inoremap <silent> <CR> <C-r>=<SID>neocompl_cr()<CR>
        function! s:neocompl_cr()
            return pumvisible() ? neocomplcache#close_popup() : "\<CR>"
        endfunction

        "neocomplcache tab completion
        inoremap <expr><Tab> pumvisible() ? "\<C-n>" : "\<Tab>"

        "neocomplcache : undo completion
        inoremap <expr><Backspace> neocomplcache#smart_close_popup()."\<C-h>"

        "neocomplcache undo completion
        inoremap <expr><C-u> neocomplcache#undo_completion()
    "}

    "FORMATTING:{
        "have backspace delete the selected text
        vnoremap <Backspace> "_x

        "format width to text width (or 80 chars if text width is 0)
        nnoremap <silent><expr> <Leader>J ':let b:tw=&textwidth<CR>:if (b:tw == 0)<Bar>set tw=80<Bar>endif<CR>gg0vG$gq:if (b:tw == 0)<Bar>set tw=0<Bar>let b:tw=80<Bar>endif<CR>:echo "Document has been formatted to a width of ".b:tw." characters"<CR>'
        vnoremap <silent><expr> <Leader>J '<Esc>:let b:tw=&textwidth<CR>:if (b:tw == 0)<Bar>set tw=80<Bar>endif<CR>gvgq:if (b:tw == 0)<Bar>set tw=0<Bar>let b:tw=80<Bar>endif<CR>:echo "Selection has been formatted to a width of ".b:tw." characters"<CR>'

        "format by Vim syntax + by Autoformat tool syntax
        nnoremap <Leader>f mzgg=G`z<CR>:echo "The document has been formatted"<CR>
        vnoremap <Leader>f mz=`z<CR>:echo "The selection has been formatted"<CR>
        nnoremap <silent><expr> <Leader>F ':Autoformat<CR>:echo "The document has been formatted with :Autoformat"<CR>'

        "convert tabs to spaces and spaces to tabs
        nnoremap <silent><expr> <Leader>t ':set expandtab<CR>:retab!<CR>:echo "Tabs have been converted to spaces"<CR>'
        nnoremap <silent><expr> <Leader>T ':set noexpandtab<CR>:%retab!<CR>:echo "Spaces have been converted to tabs"<CR>'

        "remove trailing whitespace
        nnoremap <silent><expr> <Leader>w ':FixWhitespace<CR>:echo "Trailing whitespace has been removed"<CR>'

        "commant/uncomment current line/selection using tcomment
        nmap <Leader>c gcc
        vmap <Leader>c gc

        "align comments
        nnoremap <Leader>A :exe "%Tabular" '/^[^'.matchstr(&commentstring, '[^%]*').']*\zs'.matchstr(&commentstring, '[^%]*').'.*'<CR>:redraw!<CR>
        vnoremap <Leader>A <C-u>:exe "'<,'>Tabular" '/^[^'.matchstr(&commentstring, '[^%]*').']*\zs'.matchstr(&commentstring, '[^%]*').'.*'<CR>:redraw!<CR>

        "align only comments following non-comments
        nnoremap <Leader>a :exe "%Tabular" '/^ *[^'.matchstr(&commentstring, '[^%]*').' ][^\'.matchstr(&commentstring, '[^%]*').']*\zs'.matchstr(&commentstring, '[^%]*').'.*'<CR>:redraw!<CR>
        vnoremap <Leader>a <C-u>:exe "'<,'>Tabular" '/^ *[^'.matchstr(&commentstring, '[^%]*').' ][^\'.matchstr(&commentstring, '[^%]*').']*\zs'.matchstr(&commentstring, '[^%]*').'.*'<CR>:redraw!<CR>

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

    "MOVEMENT:{
        "additional mappings for easier access
        nnoremap = +
        nnoremap _ -

        "remap keys for speedier movement
        nnoremap <C-Up> 4k
        nnoremap <C-Down> 4j
        nnoremap <C-Right> <S-Right>
        nnoremap <C-Left> <S-Left>

        "remap keys to scroll to the end in a direction
        nnoremap <S-Up> gg0
        nnoremap <S-Down> G$
        nnoremap <S-Right> $
        nnoremap <S-Left> ^

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
    "extradite
    autocmd FileType extradite map <buffer> <Right> <Down>
    autocmd FileType extradite map <buffer> l j
    autocmd FileType extradite map <buffer> <Left> <Up>
    autocmd FileType extradite map <buffer> h k
    autocmd FileType extradite map <buffer> <C-F4> q
    autocmd FileType extradite map <buffer> <A-F4> q

    "gundo
    autocmd FileType gundo map <buffer> <LeftMouse> <LeftMouse>0l
    autocmd FileType gundo map <buffer> <MiddleMouse> <LeftMouse>
    autocmd FileType gundo map <buffer> <RightMouse> <LeftMouse>
    autocmd FileType gundo map <buffer> <Right> <Down>
    autocmd FileType gundo map <buffer> l j
    autocmd FileType gundo map <buffer> <Left> <Up>
    autocmd FileType gundo map <buffer> h k

    "help
    if !&diff
        autocmd FileType help map <buffer> <silent><expr> q ':q<CR>'
        autocmd FileType help map <buffer> <silent><expr> <Leader><F1> ':q<CR>'
        autocmd FileType help map <buffer> <silent><expr> <Leader>? ':q<CR>'
    endif

    "html
    "after running autoformat, remove linebreaks that aren't between tags
    autocmd FileType html,xhtml nnoremap <buffer> <silent><expr> <Leader>F ':Autoformat<CR>:%s/\n\s*\([^<\ ]\)/ \1/g<CR>:echo "The document has been formatted with :Autoformat"<CR>'

    "markdown
    autocmd FileType mkd nnoremap <buffer> <silent><expr> <Leader>F ':TableFormat<CR>'
    autocmd FileType mkd xnoremap <buffer> <silent><expr> <Leader>F '<Esc>:TableFormat<CR>gv'

    "qf-sidebar
    autocmd FileType qf map <buffer> <LeftMouse> <LeftMouse>0
    autocmd FileType qf map <buffer> <MiddleMouse> <LeftMouse>
    autocmd FileType qf map <buffer> <RightMouse> <LeftMouse>
    autocmd FileType qf map <buffer> <2-LeftMouse> <CR>
    autocmd FileType qf map <buffer> <Space> <CR><C-w>p
    autocmd FileType qf map <buffer> <Left> <Up>
    autocmd FileType qf map <buffer> <Right> <Down>
    autocmd FileType qf map <buffer> h j
    autocmd FileType qf map <buffer> l k
    autocmd FileType qf map <buffer> <silent><expr> q ':call ToggleQuickfixList()<CR>'
    autocmd FileType qf map <buffer> <silent><expr> <C-F2> ':call ToggleQuickfixList()<CR>'
    autocmd FileType qf map <buffer> <silent><expr> <A-F3> ':call ToggleQuickfixList()<CR>'

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
    autocmd Filetype qf,gundo,vimfiler,tagbar,extradite,help noremap <buffer> ` <Nop>
    autocmd Filetype qf,vimfiler,extradite,help noremap <buffer> <C-F3> <Nop>
    autocmd Filetype qf,vimfiler,extradite,help noremap <buffer> <A-F2> <Nop>
    autocmd Filetype gundo,vimfiler,extradite,help noremap <buffer> <C-F2> <Nop>
    autocmd Filetype gundo,vimfiler,extradite,help noremap <buffer> <A-F3> <Nop>
    autocmd Filetype qf,gundo,vimfiler,tagbar,help,diff noremap <buffer> <C-F4> <Nop>
    autocmd Filetype qf,gundo,vimfiler,tagbar,help,diff noremap <buffer> <A-F4> <Nop>

    "disable modifier keys with directions that would interfere with logic
    autocmd Filetype qf,gundo,vimfiler noremap <buffer> <C-Up> <Nop>
    autocmd Filetype qf,gundo,vimfiler noremap <buffer> <C-k> <Nop>
    autocmd Filetype qf,gundo,vimfiler noremap <buffer> <C-Down> <Nop>
    autocmd Filetype qf,gundo,vimfiler noremap <buffer> <C-j> <Nop>
    autocmd Filetype qf,gundo,vimfiler,extradite noremap <buffer> <C-Right> <Nop>
    autocmd Filetype qf,gundo,vimfiler,extradite noremap <buffer> <C-l> <Nop>
    autocmd Filetype qf,gundo,vimfiler,extradite noremap <buffer> <C-Left> <Nop>
    autocmd Filetype qf,gundo,vimfiler,extradite noremap <buffer> <C-h> <Nop>
    autocmd Filetype qf,gundo,vimfiler,extradite noremap <buffer> <A-Up> <Nop>
    autocmd Filetype qf,gundo,vimfiler,extradite noremap <buffer> <A-k> <Nop>
    autocmd Filetype qf,gundo,vimfiler,extradite noremap <buffer> <A-Down> <Nop>
    autocmd Filetype qf,gundo,vimfiler,extradite noremap <buffer> <A-j> <Nop>
    autocmd Filetype qf,gundo,vimfiler,extradite noremap <buffer> <A-Right> <Nop>
    autocmd Filetype qf,gundo,vimfiler,extradite noremap <buffer> <A-l> <Nop>
    autocmd Filetype qf,gundo,vimfiler,extradite noremap <buffer> <A-Left> <Nop>
    autocmd Filetype qf,gundo,vimfiler,extradite noremap <buffer> <A-h> <Nop>
    autocmd Filetype qf,gundo,vimfiler noremap <buffer> <S-Up> <Nop>
    autocmd Filetype qf,gundo,vimfiler noremap <buffer> <S-k> <Nop>
    autocmd Filetype qf,gundo,vimfiler noremap <buffer> <S-Down> <Nop>
    autocmd Filetype qf,gundo,vimfiler noremap <buffer> <S-j> <Nop>
    autocmd Filetype qf,gundo,vimfiler,extradite noremap <buffer> <S-Right> <Nop>
    autocmd Filetype qf,gundo,vimfiler,extradite noremap <buffer> <S-l> <Nop>
    autocmd Filetype qf,gundo,vimfiler,extradite noremap <buffer> <S-Left> <Nop>
    autocmd Filetype qf,gundo,vimfiler,extradite noremap <buffer> <S-h> <Nop>
"}}}
