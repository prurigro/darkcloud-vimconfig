"==========================="
"  Keyboard Configuration:  "
"==========================="
"
" Reference: (view plugin documentation for the full list of commands each offers)
"  <Ctrl-z>,            | (A) -> follows an emme term to expand it (ie: 'html:5')
"  <Leader><F2>         | (N) -> toggle hexhighlight's hexcode to colours in :gui
"  cs'"                 | (N) -> change surrounding '' to "" (any delimiters work)
"  cs"<q>               | (N) -> change surrounding "" to the tag: <q></q>
"  cst"                 | (N) -> change any surrounding tag to ""
"  ds"                  | (N) -> delete surrounding ""
"
" Mappings:
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
"  <Leader><C-f>        | (N) -> format document and return to current line
"  <Leader><C-w>        | (N) -> remove whitespace
"  <Shift-p>            | (N) -> paste and replace the current word
"  <Shift-p>            | (V) -> paste and replace the selection
"  <Ctrl-Up>            | (A) -> move up a chunk of text
"  <Ctrl-Down>          | (A) -> move down a chunk of text
"  <Shift-Left>         | (N) -> move to the start of the text
"  <Shift-Right>        | (N) -> move to the end of the line
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
    "tab and untabbing selected blocks
    vmap <Tab> >gv
    vmap <S-Tab> <gv

    "move to the next and previous tabs
    nnoremap <silent><expr> <Leader>n ':tabn<CR>'
    nnoremap <silent><expr> <Leader>p ':tabp<CR>'

    "toggle the cursor line and column
    nnoremap <silent><expr> <F3> ':set cursorline! cursorcolumn!<CR>'

    "toggle the display of line numbers
    nnoremap <silent><expr> <F4> ':set number!<CR>'

    "toggle line wrapping (and bottom bar if using the gui)
    if !has("gui_running")
        nnoremap <silent><expr> <F5> ':set wrap!<CR>'
    else
        nnoremap <silent><expr> <F5> ':set wrap! go'.'-+'[&wrap]."=b\r"
    endif

    "toggle the display of whitespace
    nnoremap <silent><expr> <F6> ':set list!<CR>'

    "toggle folded code at foldpoints
    inoremap <F12> <C-O>za
    nnoremap <F12> za
    onoremap <F12> <C-C>za
    vnoremap <F12> zf

    "format document then return to current line
    nnoremap <Leader><C-f> mzgg=G`z<CR>

    "remove trailing white space
    nnoremap <silent><expr> <Leader><C-w> ':FixWhitespace<CR>'

    "map shift to enable middle-click paste while being held
    map <S-Insert> <MiddleMouse>
    map! <S-Insert> <MiddleMouse>

    "map shift-p to paste and replace the current word or selection
    nnoremap <S-p> "_diwP
    vnoremap <S-p> "_d"0P

    "map ctrl-up/down to moving up/down by a block of text
    map <C-Up> <C-U>
    map <C-Down> <C-D>

    "map shift-left/right to move to the start/end of the line's text
    nmap <S-Left> ^
    nmap <S-Right> $
"}}}

"PLUGIN KEYBINDINGS {{{
    "toggle the nerd tree sidebar
    nnoremap <silent><expr> <F1> ':NERDTree<CR>'

    "toggle the tagbar sidebar
    nnoremap <silent><expr> <F2> ':TagbarToggle<CR>'

    "neocomplcache suggestions: cancel, autocomplete, scroll up and scroll down
    inoremap <expr><Tab> pumvisible() ? neocomplcache#complete_common_string() : "\<Tab>"
    inoremap <expr><Backspace> pumvisible() ? neocomplcache#close_popup() : "\<Backspace>"
    inoremap <expr><Leader><Backspace> neocomplcache#undo_completion()

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
    noremap <silent><expr> <C-F1> ":if &go=~#'m'<Bar>set go-=m<Bar>else<Bar>set go+=m<Bar>endif<CR>"
    noremap <silent><expr> <C-F2> ":if &go=~#'T'<Bar>set go-=T<Bar>else<Bar>set go+=T<Bar>endif<CR>"
    noremap <silent><expr> <C-F3> ":if &go=~#'r'<Bar>set go-=r<Bar>else<Bar>set go+=r<Bar>endif<CR>"
"}}}

"ALIASES: COMMAND SHORTCUTS {{{
    cabbrev wsudo SudoWrite
    cabbrev esudo SudoRead
"}}}
