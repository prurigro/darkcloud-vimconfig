"==========================="
"  Keyboard Configuration:  "
"==========================="
"
" Note:
"  *The default <Leader> key is: \
"
" Reference: (view plugin documentation for the full list of commands each offers)
"    <Leader>q            | (N) -> toggle display of the quickfix list
"    <Leader>l            | (N) -> toggle display of the location list
"    cs'"                 | (N) -> change surrounding '' to "" (any delimiters work)
"    cs"<q>               | (N) -> change surrounding "" to the tag: <q></q>
"    cst"                 | (N) -> change any surrounding tag to ""
"    ds"                  | (N) -> delete surrounding ""
"
" Mappings:
"  (mouse)
"    <Ctrl-ScrollUp>      | (A) -> scroll right
"    <Ctrl-ScrollDown>    | (A) -> scroll left
"    <Shift-MiddleClick>  | (A) -> unbind this from vim so xorg can paste
"
"  (tabs)
"    <Ctrl-t>             | (A) -> open a new tab
"    <Ctrl-n>             | (A) -> go to the next open tab
"    <Ctrl-p>             | (A) -> go to the previous open tab
"
"  (toggles)
"    <Space>              | (N) -> toggle folds
"    <F1>                 | (A) -> toggle line numbers
"    <F2>                 | (A) -> toggle row/column highlighting
"    <F3>                 | (A) -> toggle line wrapping
"    <F4>                 | (A) -> toggle all folds
"    <F5>                 | (A) -> toggle spell check
"    <F6>                 | (A) -> toggle syntax checking
"    <F9>                 | (A) -> toggle the gundo undo history sidebar
"    <Shift-F9>           | (A) -> toggle the tagbar sidebar
"    <Ctrl-F9>            | (A) -> toggle the error list
"    ``                   | (N) -> toggle the filer explorer sidebar
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
"    <Leader><C-f>        | (N) -> format document and return to current line
"    <Leader><C-w>        | (N) -> remove whitespace
"    <Leader><C-t>        | (N) -> convert tabs into spaces
"    <Leader>\            | (N) -> remove search highlighting
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
"  (selection)
"    <Ctrl-a>             | (V) -> select all
"    <Ctrl-a>             | (N) -> select all
"    <Leader>a            | (V) -> select all
"    <Leader>a            | (N) -> select all
"    <Shift-Up>           | (V) -> toggle selection of all text above the cursor
"    <Shift-Up>           | (N) -> select all text above the cursor
"    <Shift-Down>         | (V) -> toggle selection of all text below the cursor
"    <Shift-Down>         | (N) -> select all text below the cursor
"    <Shift-Right>        | (V) -> toggle selection of all text to the right of the cursor
"    <Shift-Right>        | (N) -> select all text to the right of the cursor
"    <Shift-Left>         | (V) -> toggle selection of all non-whitespace to the left
"    <Shift-Left>         | (N) -> select all non-whitespace to the left
"
"  (vimdiff)
"    <Leader>>            | (N) -> update differences
"    >>                   | (N) -> next difference
"    <<                   | (N) -> previous difference
"    ><                   | (N) -> replace diff in current pane with other pane
"    <>                   | (N) -> replace diff in other pane with current pane
"
"  (paste)
"    y                    | (N) -> copies the character
"    p                    | (V) -> paste and replace the currently selected text
"    P                    | (V) -> paste and replace the currently selected text
"    <Leader>p            | (N) -> view the paste buffers and register contents
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
    noremap <C-ScrollWheelUp> 3zl
    noremap <C-ScrollWheelDown> 3zh
    inoremap <C-ScrollWheelUp> <C-O>3zl
    inoremap <C-ScrollWheelDown> <C-O>3zh
  "}

  "TABS:{
    "move to the next and previous tabs
    nnoremap <silent><expr> <C-t> ':tabnew<CR>'
    nnoremap <silent><expr> <C-n> ':tabnext<CR>'
    nnoremap <silent><expr> <C-p> ':tabprev<CR>'
  "}

  "TOGGLES:{
    "toggle folded code at foldpoints
    nnoremap <Space> za

    "unmap F1 from help then map it to toggle the display of line numbers
    nnoremap <silent><expr> <F1> ':set number!<CR>'
    vnoremap <silent><expr> <F1> '<Esc>:set number!<CR>v'
    inoremap <silent><expr> <F1> '<C-O>:set number!<CR>'

    "toggle the cursor line and column
    nnoremap <silent><expr> <F2> ':set cursorline! cursorcolumn!<CR>'
    vnoremap <silent><expr> <F2> '<Esc>:set cursorline! cursorcolumn!<CR>v'
    inoremap <silent><expr> <F2> '<C-O>:set cursorline! cursorcolumn!<CR>'

    "toggle line wrapping (and bottom bar if using the gui)
    nnoremap <silent><expr> <F3> ':set wrap! go'.'-+'[&wrap]."=b\r"
    vnoremap <silent><expr> <F3> '<Esc>:set wrap! go'.'-+'[&wrap]."=b\rv"
    inoremap <silent><expr> <F3> '<C-O>:set wrap! go'.'-+'[&wrap]."=b\r"

    "toggle all folds
    nnoremap <F4> zi
    vnoremap <F4> <Esc>ziv
    inoremap <F4> <C-O>zi

    "toggle spellcheck
    nnoremap <silent><expr> <F5> ':set spell!<CR>'
    vnoremap <silent><expr> <F5> '<Esc>:set spell!<CR>v'
    inoremap <silent><expr> <F5> '<C-O>:set spell!<CR>'

    "toggle syntax checking
    nnoremap <silent><expr> <F5> ':SyntasticToggleMode<CR>'
    vnoremap <silent><expr> <F5> '<Esc>:SyntasticToggleMode<CR>v'
    inoremap <silent><expr> <F5> '<C-O>:SyntasticToggleMode<CR>'

    "bindings to trigger the gundo undo history
    nnoremap <silent><expr> <F9> ':GundoToggle<CR>'
    vnoremap <silent><expr> <F9> '<Esc>:GundoToggle<CR>v'
    inoremap <silent><expr> <F9> '<C-O>:GundoToggle<CR>'

    "bindings to trigger the tagbar list of tags
    nnoremap <silent><expr> <S-F9> ':TagbarToggle<CR>'
    vnoremap <silent><expr> <S-F9> '<Esc>:TagbarToggle<CR>v'
    inoremap <silent><expr> <S-F9> '<C-O>:TagbarToggle<CR>'

    "bindings to trigger the tagbar list of errors
    nmap <script> <silent> <C-F9> :call ToggleLocationList()<CR>

    "bindings to trigger the filer explorer
    nnoremap <silent><expr> `` ':VimFilerExplorer -winwidth=30<CR>'
  "}

  "GVIM TOGGLES:{
    "map toggles for the menu, toolbar and vertical scrollbar
    nnoremap <silent><expr> <C-F1> ":if &go=~#'m'<Bar>set go-=m<Bar>else<Bar>set go+=m<Bar>endif<CR>"
    vnoremap <silent><expr> <C-F1> "<Esc>:if &go=~#'m'<Bar>set go-=m<Bar>else<Bar>set go+=m<Bar>endif<CR>v"
    inoremap <silent><expr> <C-F1> "<C-O>:if &go=~#'m'<Bar>set go-=m<Bar>else<Bar>set go+=m<Bar>endif<CR>"

    nnoremap <silent><expr> <C-F2> ":if &go=~#'T'<Bar>set go-=T<Bar>else<Bar>set go+=T<Bar>endif<CR>"
    vnoremap <silent><expr> <C-F2> "<Esc>:if &go=~#'T'<Bar>set go-=T<Bar>else<Bar>set go+=T<Bar>endif<CR>v"
    inoremap <silent><expr> <C-F2> "<C-O>:if &go=~#'T'<Bar>set go-=T<Bar>else<Bar>set go+=T<Bar>endif<CR>"

    nnoremap <silent><expr> <C-F3> ":if &go=~#'r'<Bar>set go-=r<Bar>else<Bar>set go+=r<Bar>endif<CR>"
    vnoremap <silent><expr> <C-F3> "<Esc>:if &go=~#'r'<Bar>set go-=r<Bar>else<Bar>set go+=r<Bar>endif<CR>v"
    inoremap <silent><expr> <C-F3> "<C-O>:if &go=~#'r'<Bar>set go-=r<Bar>else<Bar>set go+=r<Bar>endif<CR>"
  "}

  "SPELLING AND COMPLETION:{
    "emmet switch triggerkey from <Ctrl-Y>
    let g:user_emmet_leader_key='<Leader>,'

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
    vnoremap <Backspace> x
    nnoremap <Backspace> i<Backspace><Esc>l

    "formatting options to apply to the whole document
    nnoremap <Leader><C-f> mzgg=G`z<CR>
    nnoremap <silent><expr> <Leader><C-w> ':FixWhitespace<CR>'
    nnoremap <silent><expr> <Leader><C-t> ':retab<CR>:noh<CR>'
    nnoremap <silent><expr> <Leader>/ ':noh<CR>'

    "tab and untab the currently selected lines
    vnoremap <Tab> >gv
    nnoremap <Tab> v>gv<Esc>
    vnoremap <S-Tab> <gv
    nnoremap <S-Tab> v<gv<Esc>
  "}

  "MOVEMENT:{
    "additional mappings for easier access
    nnoremap = +

    "remap keys to scroll through text
    nnoremap <C-Up> gg0
    nnoremap <C-Down> G$
    nnoremap <C-Right> $
    nnoremap <C-Left> ^
  "}

  "SELECTION:{
    "map remap keys to select text
    vnoremap <C-a> <Esc>gg0vG$
    nnoremap <C-a> gg0vG$
    vnoremap <Leader>a <Esc>gg0vG$
    nnoremap <Leader>a gg0vG$
    vnoremap <S-Up> gg0
    nnoremap <S-Up> vgg0
    vnoremap <S-Down> G$
    nnoremap <S-Down> vG$
    vnoremap <S-Right> $
    nnoremap <S-Right> v$
    vnoremap <S-Left> ^
    nnoremap <S-Left> v^
  "}

  "VIMDIFF:{
    "map shortcuts for vimdiff
    nnoremap <silent><expr> <Leader>> ':diffu<CR>'
    nnoremap >> ]c
    nnoremap << [c
    nnoremap <> dp
    nnoremap >< do
  "}

  "PASTE:{
    "display contents of paste buffers
    nnoremap <silent><expr> <Leader>p ':reg<CR>'

    "allow y to copy in normal mode
    nnoremap y vy<Esc>

    "alternatives that preserve the paste buffer
    vnoremap p "_dP
    vnoremap P "_dP
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

"ALIASES: COMMAND SHORTCUTS {{{
    cabbrev sudow SudoWrite
    cabbrev wsudo SudoWrite
    cabbrev sudoe SudoRead
    cabbrev esudo SudoRead
"}}}

"TMUX AND SCREEN COMPATIBILITY: SOME HACKS TO MAKE THINGS WORK RIGHT {{{
    "general compatibility settings for both screen and tmux
    if $TERM =~ '^screen-256color'
        nmap <Esc>OH <Home>
        imap <Esc>OH <Home>
        nmap <Esc>OF <End>
        imap <Esc>OF <End>
    endif

    "full keyboard compatibility for tmux with xterm-keys enabled
    if &term =~ '^screen' && exists('$TMUX')
        execute "set <xUp>=\e[1;*A"
        execute "set <xDown>=\e[1;*B"
        execute "set <xRight>=\e[1;*C"
        execute "set <xLeft>=\e[1;*D"
        execute "set <xHome>=\e[1;*H"
        execute "set <xEnd>=\e[1;*F"
        execute "set <Insert>=\e[2;*~"
        execute "set <Delete>=\e[3;*~"
        execute "set <PageUp>=\e[5;*~"
        execute "set <PageDown>=\e[6;*~"
        execute "set <xF1>=\e[1;*P"
        execute "set <xF2>=\e[1;*Q"
        execute "set <xF3>=\e[1;*R"
        execute "set <xF4>=\e[1;*S"
        execute "set <F5>=\e[15;*~"
        execute "set <F6>=\e[17;*~"
        execute "set <F7>=\e[18;*~"
        execute "set <F8>=\e[19;*~"
        execute "set <F9>=\e[20;*~"
        execute "set <F10>=\e[21;*~"
        execute "set <F11>=\e[23;*~"
        execute "set <F12>=\e[24;*~"
    endif
"}}}
