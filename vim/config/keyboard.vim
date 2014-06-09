"============================================================"
"                                                            "
"  Darkcloud Vim Config: keyboard settings                   "
"                                                            "
"  Maintainer: Kevin MacMartin (prurigro@gmail.com)          "
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
"  :wsudo & :sudow            | (C) -> write the file as root using sudo
"  :esudo & :sudoe            | (C) -> read a file as root using sudo
"
" Reference: (view plugin documentation for the full list of commands each offers)
"  (tcomment _ can also be -)
"   <Ctrl-_><Ctrl-_>          | (A) -> comment selection/create an empty comment
"   gc                        | (A) -> comment selection/create an empty comment
"   <Ctrl-_>b                 | (A) -> comment the current block(s)
"   <Ctrl-_>r                 | (A) -> comment everything on the line to the right
"   <Ctrl-_>p                 | (A) -> comment the current paragraph
"   +                         | (V) -> increase the selected region
"   _                         | (V) -> decrease the selected region
"   <Leader><Space>           | (N) -> center content and hide everything else
"
"  (surround)
"    S"                       | (V) -> surround selection with quotes
"    S<a href="">             | (V) -> surround <a href="">selection</a>
"    ds"                      | (N) -> delete surrounding ""
"    dst                      | (N) -> delete surrounding tag (ie: <strong></strong>)
"    cs'"                     | (N) -> change surrounding '' to "" (any delimiters work)
"    cs"<q>                   | (N) -> change surrounding "" to the tag: <q></q>
"    cst"                     | (N) -> change any surrounding tag to ""
"
" Mappings:
"  (mouse)
"    <Shift-MiddleClick>      | (A) -> unbind this from vim so xorg can paste
"
"    <Ctrl-ScrollUp>          | (A) -> scroll right a few characters at a time
"    <Ctrl-ScrollDown>        | (A) -> scroll left a few characters at a time
"    <Alt-ScrollUp>           | (A) -> scroll right one character at a time
"    <Alt-ScrollDown>         | (A) -> scroll left one character at a time
"
"    <MiddleClick>            | (A) -> behaves like right-click (selects to the cursor)
"
"    <Ctrl-RightClick>        | (A) -> copy selection or character under the cursor
"    <Ctrl-MiddleClick>       | (A) -> copy selection or character under the cursor
"    <Alt-RightClick>         | (A) -> cut selection or character under the cursor
"    <Alt-MiddleClick>        | (A) -> cut selection or character under the cursor
"    <Ctrl-Alt-RightClick>    | (A) -> paste at the cursor (not mouse)
"    <Ctrl-Alt-MiddleClick>   | (A) -> paste at the cursor (not mouse)
"
"    <Ctrl-LeftClick>         | (A) -> select the word being clicked
"    <Alt-LeftClick>          | (A) -> select the line being clicked
"    <Ctrl-Alt-LeftClick>     | (A) -> select the paragraph being clicked
"
"  (tabs)
"    <Alt-n>                  | (N) -> go to the next open tab
"    <Alt-p>                  | (N) -> go to the previous open tab
"    <Alt-t>                  | (N) -> open a new tab
"    <Alt-c>                  | (N) -> create a new tab with vimfiler
"    <Alt-d>                  | (N) -> create a new tab with a double pane vimfiler
"
"  (toggles)
"    ??                       | (N) -> toggle the quick reference sidebar
"    ?>                       | (N) -> toggle command reference sidebar
"    ?<                       | (N) -> toggle normal mode key bindings reference sidebar
"    ``                       | (N) -> toggle the vimfiler sidebar on the right
"    ~~                       | (N) -> toggle the vimfiler sidebar on the left
"    <Space>                  | (N) -> toggle folds
"    <F1>                     | (A) -> toggle line numbers
"    <F2>                     | (A) -> toggle row/column cursor highlighting
"    <F3>                     | (A) -> toggle line wrapping
"    <F4>                     | (A) -> toggle all folds
"    <F5>                     | (A) -> toggle spell check
"    <F6>                     | (A) -> toggle syntax checking
"    <F7>                     | (A) -> toggle version control differences
"    <Ctrl-F7>                | (A) -> toggle version control commit history
"    <F8>                     | (A) -> toggle the tagbar sidebar
"    <Ctrl-F8>                | (A) -> toggle the location list to check syntax errors
"    <F9>                     | (A) -> toggle the gundo undo history sidebar
"    <Ctrl-F9>                | (A) -> enable spellcheck & toggle list of spelling errors
"
"  (gvim toggles)
"    <Ctrl-F1>                | (A) -> toggle the menu
"    <Ctrl-F2>                | (A) -> toggle the toolbar
"    <Ctrl-F3>                | (A) -> toggle the scrollbar
"
"  (completion)
"    <Ctrl-\>,                | (A) -> enter after emmet 'word' (ie: html:5)
"    \\                       | (N) -> show spelling suggestions popup for word
"    \|                       | (N) -> add word to a local list of correct spellings
"    <Tab>                    | (I) -> (neocomp) autocomplete using common string
"    <Leader><Tab>            | (I) -> (neocomp) autocomplete the common string
"    <Enter>                  | (I) -> (neocomp) close the suggestion popup
"    <Leader><Backspace>      | (I) -> (neocomp) undo the most recent completion
"
"  (formatting)
"    <Backspace>              | (V) -> deletes currently selected text
"    <Leader><Ctrl-f>         | (N) -> format document and return to cursor
"    <Leader><Ctrl-f>         | (V) -> format the selection and return to cursor
"    <Leader><Leader><Ctrl-f> | (N) -> format document using :Autoformat
"    <Leader><Ctrl-l>         | (N) -> format document to a width of 79 characters
"    <Leader><Ctrl-l>         | (V) -> format selection to a width of 79 characters
"    <Leader><Ctrl-w>         | (N) -> remove whitespace
"    <Leader><Ctrl-t>         | (N) -> convert tabs into spaces
"    <Leader>\                | (N) -> remove search highlighting
"    <Leader><Esc>            | (N) -> an alt mapping to remove search highlighting
"    <Tab>                    | (V) -> indent all the lines currently selected
"    <Tab>                    | (N) -> indent the current line
"    <Shift-Tab>              | (V) -> unindent all the lines currently selected
"    <Shift-Tab>              | (N) -> unindent the current line
"
"  (movement)
"    =                        | (N) -> move to the first character on the next line
"    <Ctrl-Up>                | (N) -> move to the beginning of the document
"    <Ctrl-Down>              | (N) -> move to the end of the document
"    <Ctrl-Right>             | (N) -> move to the end of the line
"    <Ctrl-Left>              | (N) -> move to the beginning of the non-whitespace
"
"    <Shift-Up>               | (N) -> move a few lines up
"    <Shift-Down>             | (N) -> move a few lines down
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
"    <Leader>a                | (N) -> select all text
"    <Ctrl-a>                 | (V) -> select all text
"    <Leader>a                | (V) -> select all text
"
"    <Ctrl-Up>                | (V) -> select all text above
"    <Ctrl-Down>              | (V) -> select all text below
"    <Ctrl-Right>             | (V) -> select all text to the right
"    <Ctrl-Left>              | (V) -> select all text to the left up to the indent
"
"    <Shift-Up>               | (V) -> select a few lines up
"    <Shift-Down>             | (V) -> select a few lines down
"    <Shift-Right>            | (V) -> select a few lines right
"    <Shift-Left>             | (V) -> select a few lines left
"
"  (copy/paste and undo/redo)
"    <Leader>p                | (N) -> view the paste buffers and register contents
"    y                        | (N) -> copies the character at the cursor
"    P                        | (V) -> save selection to the buffer and paste over
"    p                        | (V) -> preserve the buffer pasting over selected text
"    <Ctrl-p>Direction        | (N) -> paste in the direction entered
"
"    (delete/cut functions)
"      <Leader>x              | (N) -> delete the char(s) under and the cursor
"      <Leader>x              | (V) -> delete the currently selected text
"      <Leader>X              | (N) -> delete the char(s) before the cursor
"      <Leader>X              | (V) -> delete the currently selected lines
"      <Leader>D              | (N) -> delete chars under and after the cursor on the line
"      <Leader>D              | (V) -> delete the currently selected lines
"      <Leader>dw             | (N) -> delete chars under and after the cursor in the word
"      <Leader>dd             | (N) -> delete lines under and after the one below
"      <Leader>d              | (V) -> delete the currently selected text
"
"    (typical copy and paste shortcuts)
"      <Ctrl-v>               | (N) -> paste from buffer
"      <Ctrl-v>               | (V) -> paste buffer in place of selection
"      <Ctrl-v>               | (I) -> paste from buffer then return to input
"      <Ctrl-c>               | (N) -> copy character
"      <Ctrl-c>               | (V) -> copy selection
"      <Ctrl-x>               | (N) -> cut character
"      <Ctrl-x>               | (V) -> cut selection
"
"    (remap dangerous functions that skip undo)
"      <Ctrl-u>               | (I) -> undo-able equivalent
"      <Ctrl-w>               | (I) -> undo-able equivalent
"
" Filetype Specific Mappings:
"  (breeze->html compat)
"    _                        | (N) -> move to the next sibling tag
"    +                        | (N) -> move to the previous sibling tag
"    <Leader>-                | (N) -> move to the first sibling tag
"    <Leader>=                | (N) -> move to the last sibling tag
"    <Leader>_                | (N) -> move to the first child tag
"    <Leader>+                | (N) -> move to the last child tag
"    <Leader><Backspace>      | (N) -> move to the parent tag
"
"  (extradite)
"    <C-F7>                   | (A) -> close the dialog
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
"    ??                       | (A) -> close the dialog
"    ?>                       | (A) -> close the dialog
"    ?<                       | (A) -> close the dialog
"
"  (markdown)
"    <F8>                     | (A) -> show heading TOC instead of the taglist
"
"  (markdown toc)
"    <LClick>                 | (A) -> left click + left justify the cursor
"    <MClick>                 | (A) -> same as the left click
"    <RClick>                 | (A) -> same as the left click
"    <LClick><LClick>         | (A) -> select heading to edit
"    <Space>                  | (A) -> select heading but remain in toc
"    <Left>                   | (A) -> up
"    <Right>                  | (A) -> down
"    h                        | (A) -> j
"    l                        | (A) -> k
"
"  (vimdiff)
"    <Leader><>               | (N) -> update differences
"    <Leader>><               | (N) -> update differences
"    <Leader>>                | (N) -> replace diff in other pane with current pane
"    <Leader<<                | (N) -> replace diff in current pane with other pane
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
    noremap > <Nop>
    noremap < <Nop>
"}}}

"ALIASES: COMMAND SHORTCUTS {{{
    cabbrev <expr><silent> GitLog ':Extradite<CR>:wincmd x<CR>:wincmd j<CR>:resize 10<CR>'
    cabbrev <expr><silent> gitlog ':Extradite<CR>:wincmd x<CR>:wincmd j<CR>:resize 10<CR>'
    cabbrev <expr><silent> GitDiff ':Gdiff<CR>'
    cabbrev <expr><silent> gitdiff ':Gdiff<CR>'
    cabbrev <expr><silent> GitStatus ':Gstatus<CR>'
    cabbrev <expr><silent> gitstatus ':Gstatus<CR>'
    cabbrev <expr><silent> GitCommit ':Gcommit<CR>'
    cabbrev <expr><silent> gitcommit ':Gcommit<CR>'

    cabbrev sudow SudoWrite
    cabbrev wsudo SudoWrite
    cabbrev sudoe SudoRead
    cabbrev esudo SudoRead
"}}}

"MAPPINGS: GENERAL KEYBINDINGS AND REBINDINGS {{{
    "MOUSE:{
        "configure middle click to paste from X
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

        "middle click behaves like right and selects from cursor
        noremap <MiddleMouse> <RightMouse>

        "ctrl+middle/right = copy line in normal and selection in visual
        nnoremap <C-RightMouse> <LeftMouse>Vy
        nnoremap <C-MiddleMouse> <LeftMouse>Vy
        vnoremap <C-RightMouse> y
        vnoremap <C-MiddleMouse> y
        inoremap <C-RightMouse> <Esc>p
        inoremap <C-MiddleMouse> <Esc>p

        "ctrl+alt+middle/right = paste
        nnoremap <A-RightMouse> x
        nnoremap <A-MiddleMouse> x
        xnoremap <A-RightMouse> x
        xnoremap <A-MiddleMouse> x
        inoremap <A-RightMouse> <C-O>x
        inoremap <A-MiddleMouse> <C-O>x

        "ctrl+alt+middle/right = paste
        nnoremap <C-A-RightMouse> p
        nnoremap <C-A-MiddleMouse> p
        xnoremap <C-A-RightMouse> p
        xnoremap <C-A-MiddleMouse> p
        inoremap <C-A-RightMouse> <C-O>p
        inoremap <C-A-MiddleMouse> <C-O>p

        "ctrl+left = word
        nnoremap <C-LeftMouse> <LeftMouse>bvw
        xnoremap <C-LeftMouse> <Esc><LeftMouse>bvw
        inoremap <C-LeftMouse> <Esc><LeftMouse>bvw

        "alt+left = line
        nnoremap <A-LeftMouse> <LeftMouse>V
        xnoremap <A-LeftMouse> <Esc><LeftMouse>V
        inoremap <A-LeftMouse> <Esc><LeftMouse>V

        "ctrl-alt+left = paragraph
        nnoremap <C-A-LeftMouse> <LeftMouse>vip
        xnoremap <C-A-LeftMouse> <Esc><LeftMouse>vip
        inoremap <C-A-LeftMouse> <Esc><LeftMouse>vip
    "}

    "TABS:{
        nnoremap <silent><expr> <A-n> ':tabnext<CR>'
        nnoremap <silent><expr> <A-p> ':tabprev<CR>'
        nnoremap <silent><expr> <A-t> ':tabnew<CR>'
        nnoremap <silent><expr> <A-c> ':VimFiler -tab -project<CR>'
        nnoremap <silent><expr> <A-d> ':VimFiler -tab -project -double<CR>'
    "}

    "TOGGLES:{
        "bindings to trigger vimfiler
        nnoremap <silent><expr> `` ':VimFiler -split -simple -toggle -no-quit -direction=botright -winwidth=45<CR>'
        nnoremap <silent><expr> ~~ ':VimFiler -split -simple -toggle -no-quit -direction=topleft -winwidth=45<CR>'

        nnoremap <silent><expr> ?? ':h quickref<CR>'
        nnoremap <silent><expr> ?> ':exusage<CR>'
        nnoremap <silent><expr> ?< ':viusage<CR>'

        "toggle folded code at foldpoints
        nnoremap <Space> za

        "unmap F1 from help then map it to toggle the display of line numbers
        nnoremap <silent><expr> <F1> ':set number!<CR>:echo "line numbers toggled"<CR>'
        xnoremap <silent><expr> <F1> '<Esc>:set number!<CR>gv'
        inoremap <silent><expr> <F1> '<C-O>:set number!<CR>'

        "toggle the cursor line and column
        nnoremap <silent><expr> <F2> ':set cursorline! cursorcolumn!<CR>:echo "cursor crosshair toggled"<CR>'
        xnoremap <silent><expr> <F2> '<Esc>:set cursorline! cursorcolumn!<CR>gv'
        inoremap <silent><expr> <F2> '<C-O>:set cursorline! cursorcolumn!<CR>'

        "toggle line wrapping (and bottom bar if using the gui)
        nnoremap <silent><expr> <F3> ':echo "line wrapping toggled"<CR>:set wrap!<CR>'
        xnoremap <silent><expr> <F3> '<Esc>:set wrap!<CR>gv'
        inoremap <silent><expr> <F3> '<C-O>:set wrap!<CR>'

        "toggle all folds
        nnoremap <F4> zi:echo "code folding toggled"<CR>
        xnoremap <F4> <Esc>zigv
        inoremap <F4> <C-O>zi

        "toggle spellcheck
        nnoremap <silent><expr> <F5> ':set spell!<CR>:echo "spell checking toggled"<CR>'
        xnoremap <silent><expr> <F5> '<Esc>:set spell!<CR>gv'
        inoremap <silent><expr> <F5> '<C-O>:set spell!<CR>'

        "toggle syntax checking
        nnoremap <silent><expr> <F6> ':SyntasticToggleMode<CR>'
        xnoremap <silent><expr> <F6> '<Esc>:SyntasticToggleMode<CR>gv'
        inoremap <silent><expr> <F6> '<C-O>:SyntasticToggleMode<CR>'

        "toggle signify and signify highlight
        let g:signify_mapping_toggle = '<F7>'
        nnoremap <expr><silent> <C-F7> ':Extradite<CR>:wincmd x<CR>:wincmd j<CR>:resize 10<CR>'
        xnoremap <expr><silent> <C-F7> '<Esc>:Extradite<CR>:wincmd x<CR>:wincmd j<CR>:resize 10<CR>v'
        inoremap <expr><silent> <C-F7> '<Esc>:Extradite<CR>:wincmd x<CR>:wincmd j<CR>:resize 10<CR>'

        "bindings to trigger the tagbar list of tags
        nnoremap <silent><expr> <F8> ':TagbarToggle<CR>:echo "tagbar toggled"<CR>'
        xnoremap <silent><expr> <F8> '<Esc>:TagbarToggle<CR>gv'
        inoremap <silent><expr> <F8> '<C-O>:TagbarToggle<CR>'

        "bindings to trigger the tagbar list of errors
        nmap <script> <silent> <C-F8> :call ToggleLocationList()<CR>:echo "error/location list toggled"<CR>

        "bindings to trigger the gundo undo history
        nnoremap <silent><expr> <F9> ':GundoToggle<CR>:echo "undo history sidebar toggled"<CR>'
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
        vnoremap <silent><expr> <C-F1> "<Esc>:if &go=~#'m'<Bar>set go-=m<Bar>else<Bar>set go+=m<Bar>endif<CR>gv"
        inoremap <silent><expr> <C-F1> "<C-O>:if &go=~#'m'<Bar>set go-=m<Bar>else<Bar>set go+=m<Bar>endif<CR>"

        nnoremap <silent><expr> <C-F2> ":if &go=~#'T'<Bar>set go-=T<Bar>else<Bar>set go+=T<Bar>endif<CR>:echo 'Toolbar toggled'<CR>"
        vnoremap <silent><expr> <C-F2> "<Esc>:if &go=~#'T'<Bar>set go-=T<Bar>else<Bar>set go+=T<Bar>endif<CR>gv"
        inoremap <silent><expr> <C-F2> "<C-O>:if &go=~#'T'<Bar>set go-=T<Bar>else<Bar>set go+=T<Bar>endif<CR>"

        nnoremap <silent><expr> <C-F3> ":if &go=~#'r'<Bar>set go-=r<Bar>set go-=L<Bar>set go-=b<Bar>else<Bar>set go+=r<Bar>set go+=L<Bar>set go+=b<Bar>endif<CR>:echo 'Scrollbars toggled'<CR>"
        vnoremap <silent><expr> <C-F3> "<Esc>:if &go=~#'r'<Bar>set go-=r<Bar>set go-=L<Bar>set go-=b<Bar>else<Bar>set go+=r<Bar>set go+=L<Bar>set go+=b<Bar>endif<CR>gv"
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

        "formatting options to apply to the whole document
        nnoremap <Leader><C-f> mzgg=G`z<CR>:echo "The document has been formatted"<CR>
        vnoremap <Leader><C-f> mz=`z<CR>:echo "The selection has been formatted"<CR>
        nnoremap <Leader><Leader><C-f> :Autoformat<CR><CR>:echo "The document has been formatted with :Autoformat"<CR>
        nnoremap <silent><expr> <Leader><C-l> ':set tw=79<CR>gggqG:set tw=0<CR>:echo "Document text has been formatted to a width of 79 characters"<CR>'
        vnoremap <silent><expr> <Leader><C-l> '<Esc>:set tw=79<CR>gvgq:set tw=0<CR>:echo "Selected text has been formatted to a width of 79 characters"<CR>'
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

        "map signify to ]c and [c
        let g:signify_mapping_next_hunk = ']c'
        let g:signify_mapping_prev_hunk = '[c'

        "move to next/previous difference (vimdiff/signify)
        nmap >> ]c
        nmap << [c
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

    "COPY PASTE AND UNDO REDO:{
        "display contents of paste buffers
        nnoremap <silent><expr> <Leader>p ':reg<CR>'

        "allow y to copy a single character in normal mode
        nnoremap y vy<Esc>

        "P pastes and replaces the buffer, p pastes and keeps it
        vnoremap P p
        xmap p <Plug>ReplaceWithRegisterVisual

        "Alternatives to cut/deletion commands that don't replace the buffer
        nnoremap <Leader>x "_x
        vnoremap <Leader>x "_x
        nnoremap <Leader>X "_X
        vnoremap <Leader>X "_X
        nnoremap <Leader>D "_D
        vnoremap <Leader>D "_D
        nnoremap <Leader>dd "_dd hello and good day
        nnoremap <Leader>dw "_dw
        vnoremap <Leader>d "_d

        "map copy/paste shortcuts to more typical ones
        nnoremap <C-v> P
        xmap <C-v> <Plug>ReplaceWithRegisterVisual
        inoremap <C-v> <C-O>p
        nnoremap <C-c> y
        vnoremap <C-c> y
        nnoremap <C-x> x
        vnoremap <C-x> x

        "remap ctrl-u and ctrl-w to safer alternatives
        inoremap <C-u> <C-g>u<c-u>
        inoremap <C-w> <C-g>u<c-w>
    "}
"}}}

"FILETYPE SPECIFIC MAPPINGS: {{{
    "breeze compatible formats
    autocmd BufNewFile,BufRead *.html,*.htm,*.xhtml,*.xml,*.php,*.aspx nmap <buffer> <silent><expr> _ ':BreezePrevSibling<CR>'
    autocmd BufNewFile,BufRead *.html,*.htm,*.xhtml,*.xml,*.php,*.aspx nmap <buffer> <silent><expr> + ':BreezeNextSibling<CR>'
    autocmd BufNewFile,BufRead *.html,*.htm,*.xhtml,*.xml,*.php,*.aspx nmap <buffer> <silent><expr> <Leader>- ':BreezeFirstSibling<CR>'
    autocmd BufNewFile,BufRead *.html,*.htm,*.xhtml,*.xml,*.php,*.aspx nmap <buffer> <silent><expr> <Leader>= ':BreezeLastSibling<CR>'
    autocmd BufNewFile,BufRead *.html,*.htm,*.xhtml,*.xml,*.php,*.aspx nmap <buffer> <silent><expr> <Leader>_ ':BreezeFirstChild<CR>'
    autocmd BufNewFile,BufRead *.html,*.htm,*.xhtml,*.xml,*.php,*.aspx nmap <buffer> <silent><expr> <Leader>+ ':BreezeLastChild<CR>'
    autocmd BufNewFile,BufRead *.html,*.htm,*.xhtml,*.xml,*.php,*.aspx nmap <buffer> <silent><expr> <Leader><Backspace> ':BreezeParent<CR>'

    "extradite
    autocmd FileType diff,extradite map <buffer> <silent><expr> <C-F7> ':Extradite<CR>'
    autocmd FileType extradite map <buffer> <Right> <Down>
    autocmd FileType extradite map <buffer> l j
    autocmd FileType extradite map <buffer> <Left> <Up>
    autocmd FileType extradite map <buffer> h k

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
        autocmd FileType help map <buffer> <silent><expr> ?? ':q<CR>'
        autocmd FileType help map <buffer> <silent><expr> ?> ':q<CR>'
        autocmd FileType help map <buffer> <silent><expr> ?< ':q<CR>'
    endif

    "markdown: launch table of contents instead of the tagbar
    autocmd FileType mkd map <buffer> <silent><expr> <F8> ':Toch<CR>'

    "markdown table of contents
    autocmd FileType qf map <buffer> <LeftMouse> <LeftMouse>0
    autocmd FileType qf map <buffer> <MiddleMouse> <LeftMouse>
    autocmd FileType qf map <buffer> <RightMouse> <LeftMouse>
    autocmd FileType qf map <buffer> <2-LeftMouse> <CR>
    autocmd FileType qf map <buffer> <Space> <CR><C-w>p
    autocmd FileType qf map <buffer> <Left> <Up>
    autocmd FileType qf map <buffer> <Right> <Down>
    autocmd FileType qf map <buffer> h j
    autocmd FileType qf map <buffer> l k

    "vimdiff
    autocmd FilterWritePre * if &diff|nnoremap <buffer> <silent><expr> <Leader><> ':diffu<CR>'|endif
    autocmd FilterWritePre * if &diff|nnoremap <buffer> <silent><expr> <Leader>>< ':diffu<CR>'|endif
    autocmd FilterWritePre * if &diff|nnoremap <buffer> <Leader>> dp|endif
    autocmd FilterWritePre * if &diff|nnoremap <buffer> <Leader>< do|endif
    autocmd FilterWritePre * if &diff|cabbrev q qall|endif
    autocmd FilterWritePre * if &diff|cabbrev q! qall!|endif

    "vimfiler
    autocmd FileType vimfiler map <buffer> <LeftMouse> <LeftMouse>0
    autocmd FileType vimfiler map <buffer> <MiddleMouse> <LeftMouse>
    autocmd FileType vimfiler map <buffer> <RightMouse> <LeftMouse>
    autocmd FileType vimfiler map <buffer> <2-LeftMouse> <Plug>(vimfiler_edit_file)
    autocmd FileType vimfiler map <buffer> <Right> l
    autocmd FileType vimfiler map <buffer> <Left> h
    autocmd FileType vimfiler map <buffer> ' e
    autocmd FileType vimfiler map <buffer> n q
"}}}

"DISABLED MAPPINGS: {{{
    "remove incompatible toggles from specific file types
    autocmd Filetype qf,gundo,vimfiler,extradite noremap <buffer> <F1> <Nop>
    autocmd Filetype qf,ggundo,vimfiler,extradite,tagbar,help noremap <buffer> <F2> <Nop>
    autocmd Filetype qf,ggundo,vimfiler,extradite,tagbar noremap <buffer> <F3> <Nop>
    autocmd Filetype qf,ggundo,vimfiler,extradite,tagbar,help noremap <buffer> <F4> <Nop>
    autocmd Filetype qf,ggundo,vimfiler,extradite,tagbar,help noremap <buffer> <F6> <Nop>
    autocmd Filetype qf,ggundo,vimfiler,extradite,tagbar,help noremap <buffer> <F7> <Nop>
    autocmd Filetype qf,ggundo,vimfiler,tagbar,help noremap <buffer> <C-F7> <Nop>
    autocmd Filetype ggundo,vimfiler,extradite,tagbar,help noremap <buffer> <F8> <Nop>
    autocmd Filetype ggundo,vimfiler,extradite,tagbar,help noremap <buffer> <C-F8> <Nop>
    autocmd Filetype qf,ggundo,vimfiler,extradite,tagbar,help noremap <buffer> <F9> <Nop>
    autocmd Filetype qf,ggundo,vimfiler,extradite,tagbar,help noremap <buffer> <C-F9> <Nop>
    autocmd Filetype qf,ggundo,vimfiler noremap <buffer> <C-Up> <Nop>
    autocmd Filetype qf,ggundo,vimfiler noremap <buffer> <C-k> <Nop>
    autocmd Filetype qf,ggundo,vimfiler noremap <buffer> <C-Down> <Nop>
    autocmd Filetype qf,ggundo,vimfiler noremap <buffer> <C-j> <Nop>
    autocmd Filetype qf,ggundo,vimfiler,extradite noremap <buffer> <C-Right> <Nop>
    autocmd Filetype qf,ggundo,vimfiler,extradite noremap <buffer> <C-l> <Nop>
    autocmd Filetype qf,ggundo,vimfiler,extradite noremap <buffer> <C-Left> <Nop>
    autocmd Filetype qf,ggundo,vimfiler,extradite noremap <buffer> <C-h> <Nop>
    autocmd Filetype qf,ggundo,vimfiler noremap <buffer> <S-Up> <Nop>
    autocmd Filetype qf,ggundo,vimfiler noremap <buffer> <S-k> <Nop>
    autocmd Filetype qf,ggundo,vimfiler noremap <buffer> <S-Down> <Nop>
    autocmd Filetype qf,ggundo,vimfiler noremap <buffer> <S-j> <Nop>
    autocmd Filetype qf,ggundo,vimfiler,extradite noremap <buffer> <S-Right> <Nop>
    autocmd Filetype qf,ggundo,vimfiler,extradite noremap <buffer> <S-l> <Nop>
    autocmd Filetype qf,ggundo,vimfiler,extradite noremap <buffer> <S-Left> <Nop>
    autocmd Filetype qf,ggundo,vimfiler,extradite noremap <buffer> <S-h> <Nop>
"}}}
