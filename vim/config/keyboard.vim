"=========================="
"  Keyboard Configuration:  "
"==========================="
"
" Note:
"  *The default <Leader> key is: \
"
" Reference: (view plugin documentation for the full list of commands each offers)
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
"    <F1>                 | (A) -> toggle line numbers
"    <F2>                 | (A) -> toggle row/column highlighting
"    <F3>                 | (A) -> toggle spellcheck
"    <F4>                 | (A) -> toggle line wrapping
"    <F9>                 | (A) -> toggle the nerdtree sidebar
"    <Shift-F9>           | (A) -> toggle the tagbar sidebar
"    <F12>                | (A) -> toggle collapsed/folded rows
"    <Shift-F12>          | (A) -> toggle all folds
"    <Shift-F12>          | (A) -> toggle all folds
"
"  (gvim toggles)
"    <Ctrl-F1>            | (A) -> toggle the menu
"    <Ctrl-F2>            | (A) -> toggle the toolbar
"    <Ctrl-F3>            | (A) -> toggle the scrollbar
"
"  (spelling-and-completion)
"    <Ctrl-z>,            | (A) -> enter this following an emme 'word' (ie: html:5)
"    \\                   | (N) -> show spelling suggestions popup for word
"    \|                   | (N) -> add word to a local list of correct spellings
"    <Leader><Backspace>  | (N) -> undo the most recent match selection
"    <Tab>                | (I) -> write the part common to all suggestions
"    <Backspace>          | (I) -> cancle the match dialog (during suggestion)
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
"    <Ctrl-k>             | (N) -> move to the beginning of the document
"    <Ctrl-Down>          | (N) -> move to the end of the document
"    <Ctrl-j>             | (N) -> move to the end of the document
"    <Ctrl-Right>         | (N) -> move to the end of the line
"    <Ctrl-l>             | (N) -> move to the end of the line
"    <Ctrl-Left>          | (N) -> move to the beginning of the non-whitespace
"    <Ctrl-h>             | (N) -> move to the beginning of the line
"
"  (selection)
"    <Ctrl-a>             | (V) -> select all
"    <Ctrl-a>             | (N) -> select all
"    <Leader>a            | (V) -> select all
"    <Leader>a            | (N) -> select all
"    <Shift-Up>           | (V) -> toggle selection of all text above the cursor
"    <Shift-Up>           | (N) -> select all text above the cursor
"    <Shift-k>            | (V) -> toggle selection of all text above the cursor
"    <Shift-k>            | (N) -> select all text above the cursor
"    <Shift-Down>         | (V) -> toggle selection of all text below the cursor
"    <Shift-Down>         | (N) -> select all text below the cursor
"    <Shift-j>            | (V) -> toggle selection of all text below the cursor
"    <Shift-j>            | (N) -> select all text below the cursor
"    <Shift-Right>        | (V) -> toggle selection of all text to the right of the cursor
"    <Shift-Right>        | (N) -> select all text to the right of the cursor
"    <Shift-l>            | (V) -> toggle selection of all text to the right of the cursor
"    <Shift-l>            | (N) -> select all text to the right of the cursor
"    <Shift-Left>         | (V) -> toggle selection of all non-whitespace to the left
"    <Shift-Left>         | (N) -> select all non-whitespace to the left
"    <Shift-h>            | (V) -> toggle selection of all non-whitespace to the left
"    <Shift-h>            | (N) -> select to the beginning of the line
"
"  (vimdiff)
"    du                   | (N) -> update differences
"    <Ctrl-n>             | (N) -> next difference
"    <Ctrl-p>             | (N) -> previous difference
"    <                    | (N) -> replace diff in current pane with other pane
"    >                    | (N) -> replace diff in other pane with current pane
"
"  (paste-buffer-override)
"    p                    | (V) -> paste and replace the currently selected text
"    P                    | (V) -> paste and replace the currently selected text
"    \d                   | (V) -> delete the currently selected text
"    \x                   | (V) -> delete the currently selected text
"    \x                   | (N) -> delete the char(s) under and the cursor
"    \X                   | (V) -> delete the currently selected lines
"    \X                   | (N) -> delete the char(s) before the cursor
"    \D                   | (V) -> delete the currently selected lines
"    \D                   | (N) -> delete chars under and after the cursor on the line
"    \dw                  | (N) -> delete chars under and after the cursor in the word
"    \dd                  | (N) -> delete lines under and after the one below
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
  "}

  "TABS:{
    "move to the next and previous tabs
    nnoremap <silent><expr> <C-t> ':tabnew<CR>'
    nnoremap <silent><expr> <C-n> ':tabnext<CR>'
    nnoremap <silent><expr> <C-p> ':tabprev<CR>'
  "}

  "TOGGLES:{
    "unmap F1 from help then map it to toggle the display of line numbers
    nnoremap <silent><expr> <F1> ':set number!<CR>'
    vnoremap <silent><expr> <F1> '<Esc>:set number!<CR>v'
    inoremap <silent><expr> <F1> '<C-O>:set number!<CR>'

    "toggle the cursor line and column
    nnoremap <silent><expr> <F2> ':set cursorline! cursorcolumn!<CR>'
    vnoremap <silent><expr> <F2> '<Esc>:set cursorline! cursorcolumn!<CR>v'
    inoremap <silent><expr> <F2> '<C-O>:set cursorline! cursorcolumn!<CR>'

    "toggle spellcheck
    nnoremap <silent><expr> <F3> ':set spell!<CR>'
    vnoremap <silent><expr> <F3> '<Esc>:set spell!<CR>v'
    inoremap <silent><expr> <F3> '<C-O>:set spell!<CR>'

    "toggle line wrapping (and bottom bar if using the gui)
    nnoremap <silent><expr> <F4> ':set wrap! go'.'-+'[&wrap]."=b\r"
    vnoremap <silent><expr> <F4> '<Esc>:set wrap! go'.'-+'[&wrap]."=b\rv"
    inoremap <silent><expr> <F4> '<C-O>:set wrap! go'.'-+'[&wrap]."=b\r"

    "bindings to trigger the nerdtree and tagbar sidebars
    nnoremap <silent><expr> <F9> ':NERDTreeToggle<CR>'
    vnoremap <silent><expr> <F9> '<Esc>:NERDTreeToggle<CR>'
    inoremap <silent><expr> <F9> '<Esc>:NERDTreeToggle<CR>'
    nnoremap <silent><expr> <S-F9> ':TagbarToggle<CR>'
    vnoremap <silent><expr> <S-F9> '<Esc>:TagbarToggle<CR>v'
    inoremap <silent><expr> <S-F9> '<C-O>:TagbarToggle<CR>'

    "toggle folded code at foldpoints
    nnoremap <F12> za
    vnoremap <F12> <Esc>zav
    inoremap <F12> <C-O>za

    "toggle all folds
    nnoremap <S-F12> zi
    vnoremap <S-F12> <Esc>ziv
    inoremap <S-F12> <C-O>zi
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
    "emmet switch triggerkey from <Ctrl-Y> to <Ctrl-Z>
    let g:user_emmet_leader_key='<C-Z>'

    "press backslash twice on a mispelled word for suggestions
    nnoremap \\ ea<C-X><C-S>
    nnoremap \| zg

    "neocomplcache suggestions: cancel, autocomplete, scroll up and scroll down
    inoremap <expr><Leader><Backspace> neocomplcache#undo_completion()
    inoremap <expr><Tab> pumvisible() ? neocomplcache#complete_common_string() : "\<Tab>"
    inoremap <expr><Backspace> pumvisible() ? neocomplcache#close_popup() : "\<Backspace>"
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
    nnoremap <C-k> gg0
    nnoremap <C-Down> G$
    nnoremap <C-j> G$
    nnoremap <C-Right> $
    nnoremap <C-l> $
    nnoremap <C-Left> ^
    nnoremap <C-h> ^
  "}

  "SELECTION:{
    "map remap keys to select text
    vnoremap <C-a> <Esc>gg0vG$
    nnoremap <C-a> gg0vG$
    vnoremap <Leader>a <Esc>gg0vG$
    nnoremap <Leader>a gg0vG$
    vnoremap <S-Up> gg0
    nnoremap <S-Up> vgg0
    vnoremap <S-k> gg0
    nnoremap <S-k> vgg0
    vnoremap <S-Down> G$
    nnoremap <S-Down> vG$
    vnoremap <S-j> G$
    nnoremap <S-j> vG$
    vnoremap <S-Right> $
    nnoremap <S-Right> v$
    vnoremap <S-l> $
    nnoremap <S-l> v$
    vnoremap <S-Left> ^
    nnoremap <S-Left> v^
    vnoremap <S-h> ^
    nnoremap <S-h> v^
  "}

  "VIMDIFF:{
    "map shortcuts for vimdiff
    nnoremap <silent><expr> du ':diffu<CR>'
    nnoremap <C-n> ]c
    nnoremap <C-p> [c
    nnoremap < do
    nnoremap > dp
  "}

  "PASTE BUFFER OVERRIDE:{
    "alternatives that preserve the paste buffer
    vnoremap p "_d"0P
    vnoremap P "_d"0P
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
