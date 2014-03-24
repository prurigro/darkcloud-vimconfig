"==========================="
"  Keyboard Configuration:  "
"==========================="
"
" Reference: (view plugin documentation for the full list of commands each offers)
"  <Ctrl-z>,            | (A) -> enter this following an emme 'word' (ie: html:5)
"  <Leader><F2>         | (N) -> toggle hexhighlight's hexcode to colours in :gui
"  cs'"                 | (N) -> change surrounding '' to "" (any delimiters work)
"  cs"<q>               | (N) -> change surrounding "" to the tag: <q></q>
"  cst"                 | (N) -> change any surrounding tag to ""
"  ds"                  | (N) -> delete surrounding ""
"
" Mappings:
"  <Ctrl-ScrollUp>      | (A) -> scroll right
"  <Ctrl-ScrollDown>    | (A) -> scroll left
"  <Shift-MiddleClick>  | (A) -> unbind this from vim so xorg can paste
"  <Leader><n>          | (A) -> go to the next open tab
"  <Leader><p>          | (A) -> go to the previous open tab
"  <Tab>                | (V) -> indent a block in visual mode
"  <Shift-Tab>          | (V) -> unindent a block in visual mod
"  <F1>                 | (N) -> toggle the nerdtree sidebar
"  <F2>                 | (N) -> toggle the tagbar sidebar
"  <F3>                 | (A) -> toggle row/column highlighting
"  <F4>                 | (A) -> toggle line numbers
"  <F5>                 | (N) -> toggle line wrapping
"  <F6>                 | (A) -> toggle visible trailing whitespace
"  <F12>                | (A) -> toggle collapsed/folded rows
"  <Shift-p>            | (V) -> paste and replace the selection
"  <Shift-p>            | (N) -> paste and replace the current word
"  <Leader><C-f>        | (N) -> format document and return to current line
"  <Leader><C-w>        | (N) -> remove whitespace
"  <Ctrl-Up>            | (N) -> move to the beginning of the document
"  <Ctrl-Down>          | (N) -> move to the end of the document
"  <Ctrl-Right>         | (N) -> move to the end of the line
"  <Ctrl-Left>          | (N) -> move to the beginning of the non-whitespace
"  <Ctrl-\>             | (N) -> move to the beginning of the line
"  <Ctrl-a>             | (N) -> select all
"  <Shift-Up>           | (N) -> select all text above the cursor
"  <Shift-Down>         | (N) -> select all text below the cursor
"  <Shift-Right>        | (N) -> select all text to the right of the cursor
"  <Shift-Left>         | (N) -> select to the beginning of the non-whitespace
"  <Shift-\>            | (N) -> select to the beginning of the line
"
"  (neocomplcache)
"   <Tab>               | (I) -> write the part common to all suggestions
"   <Backspace>         | (I) -> cancle the match dialog (during suggestion)
"   <Leader><Backspace> | (N) -> undo the most recent match selection
"
" GVim Mappings:
"  <Ctrl-F10>           | (A) -> toggle the menu
"  <Ctrl-F11>           | (A) -> toggle the toolbar
"  <Ctrl-F12>           | (A) -> toggle the scrollbar
"
" Aliases:
"  :wsudo               | (N) -> :SudoWrite (write the file as root using sudo)
"  :esudo               | (N) -> :SudoRead (read a file as root using sudo)
"
" Notes:
"  *by the default <Leader> key is: \
"

"MAPPINGS: GENERAL KEYBINDINGS AND REBINDINGS {{{
    "hold shift to enable middle-click paste
    noremap <S-Insert> <MiddleMouse>
    noremap! <S-Insert> <MiddleMouse>

    "hold ctrl to scroll left/right instead of up/down
    noremap <C-ScrollWheelUp> 3zl
    noremap <C-ScrollWheelDown> 3zh

    "tab and untabbing selected blocks
    vnoremap <Tab> >gv
    vnoremap <S-Tab> <gv

    "move to the next and previous tabs
    nnoremap <Silent><Expr> <Leader>n ':tabn<CR>'
    nnoremap <Silent><Expr> <Leader>p ':tabp<CR>'

    "toggle the cursor line and column
    nnoremap <Silent><Expr> <F3> ':set cursorline! cursorcolumn!<CR>'

    "toggle the display of line numbers
    nnoremap <Silent><Expr> <F4> ':set number!<CR>'

    "toggle line wrapping (and bottom bar if using the gui)
    if !has("gui_running")
        nnoremap <Silent><Expr> <F5> ':set wrap!<CR>'
    else
        nnoremap <Silent><Expr> <F5> ':set wrap! go'.'-+'[&wrap]."=b\r"
    endif

    "toggle the display of whitespace
    nnoremap <Silent><Expr> <F6> ':set list!<CR>'

    "toggle folded code at foldpoints
    inoremap <F12> <C-O>za
    nnoremap <F12> za
    onoremap <F12> <C-C>za
    vnoremap <F12> zf

    "map shift-p to paste and replace the current word or selection
    vnoremap <S-p> "_d"0P
    nnoremap <S-p> "_diwP

    "format document then return to current line
    nnoremap <Leader><C-f> mzgg=G`z<CR>

    "remove trailing white space
    nnoremap <Silent><Expr> <Leader><C-w> ':FixWhitespace<CR>'

    "remap keys to scroll through text
    nnoremap <C-Up> gg0
    nnoremap <C-Down> G$
    nnoremap <C-Right> $
    nnoremap <C-Left> ^
    nnoremap <C-\> 0

    "map remap keys to select text
    nnoremap <C-a> ggvG
    nnoremap <S-Up> vgg0
    nnoremap <S-Down> vG$
    nnoremap <S-Right> v$
    nnoremap <S-Left> v^
    nnoremap <S-\> v0
"}}}

"PLUGIN KEYBINDINGS {{{
    "toggle the nerd tree sidebar
    nnoremap <Silent><Expr> <F1> ':NERDTree<CR>'

    "toggle the tagbar sidebar
    nnoremap <Silent><Expr> <F2> ':TagbarToggle<CR>'

    "neocomplcache suggestions: cancel, autocomplete, scroll up and scroll down
    inoremap <Expr><Tab> pumvisible() ? neocomplcache#complete_common_string() : "\<Tab>"
    inoremap <Expr><Backspace> pumvisible() ? neocomplcache#close_popup() : "\<Backspace>"
    inoremap <Expr><Leader><Backspace> neocomplcache#undo_completion()

    "emmet switch triggerkey from <Ctrl-Y> to <Ctrl-Z>
    let g:user_emmet_leader_key='<C-Z>'
"}}}

"TMUX AND SCREEN COMPATIBILITY: SOME HACKS TO MAKE THINGS WORK RIGHT {{{
    if $TERM =~ '^screen-256color'
        nmap <Esc>OH <Home>
        imap <Esc>OH <Home>
        nmap <Esc>OF <End>
        imap <Esc>OF <End>
    endif
"}}}

"GVIM: MAPPINGS FOR GUI ELEMENTS {{{
    "map toggles for the menu, toolbar and scrollbar
    noremap <Silent><Expr> <C-F1> ":if &go=~#'m'<Bar>set go-=m<Bar>else<Bar>set go+=m<Bar>endif<CR>"
    noremap <Silent><Expr> <C-F2> ":if &go=~#'T'<Bar>set go-=T<Bar>else<Bar>set go+=T<Bar>endif<CR>"
    noremap <Silent><Expr> <C-F3> ":if &go=~#'r'<Bar>set go-=r<Bar>else<Bar>set go+=r<Bar>endif<CR>"
"}}}

"ALIASES: COMMAND SHORTCUTS {{{
    cabbrev wsudo SudoWrite
    cabbrev esudo SudoRead
"}}}
