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
"  <Ctrl-t>             | (A) -> open a new tab
"  <Ctrl-n>             | (A) -> go to the next open tab
"  <Ctrl-p>             | (A) -> go to the previous open tab
"  <Tab>                | (V) -> indent a block in visual mode
"  <Shift-Tab>          | (V) -> unindent a block in visual mod
"  `                    | (N) -> toggle the nerdtree sidebar
"  ~                    | (N) -> toggle the tagbar sidebar
"  p                    | (V) -> paste and replace the selection
"  <Shift-p>            | (N) -> paste and replace the current word
"  <F1>                 | (A) -> toggle line numbers
"  <F2>                 | (N) -> toggle line wrapping
"  <F3>                 | (A) -> toggle row/column highlighting
"  <F12>                | (A) -> toggle collapsed/folded rows
"  <Leader><C-f>        | (N) -> format document and return to current line
"  <Leader><C-w>        | (N) -> remove whitespace
"  <Ctrl-Up>            | (N) -> move to the beginning of the document
"  <Ctrl-k>             | (N) -> move to the beginning of the document
"  <Ctrl-Down>          | (N) -> move to the end of the document
"  <Ctrl-j>             | (N) -> move to the end of the document
"  <Ctrl-Right>         | (N) -> move to the end of the line
"  <Ctrl-l>             | (N) -> move to the end of the line
"  <Ctrl-Left>          | (N) -> move to the beginning of the non-whitespace
"  <Ctrl-h>             | (N) -> move to the beginning of the line
"  <Ctrl-a>             | (N) -> select all
"  <Shift-Up>           | (N) -> select all text above the cursor
"  <Shift-k>            | (N) -> select all text above the cursor
"  <Shift-Down>         | (N) -> select all text below the cursor
"  <Shift-j>            | (N) -> select all text below the cursor
"  <Shift-Right>        | (N) -> select all text to the right of the cursor
"  <Shift-l>            | (N) -> select all text to the right of the cursor
"  <Shift-Left>         | (N) -> select to the beginning of the non-whitespace
"  <Shift-h>            | (N) -> select to the beginning of the line
"
"  (neocomplcache)
"   <Tab>               | (I) -> write the part common to all suggestions
"   <Backspace>         | (I) -> cancle the match dialog (during suggestion)
"   <Leader><Backspace> | (N) -> undo the most recent match selection
"
" GVim Mappings:
"  <Ctrl-F1>           | (A) -> toggle the menu
"  <Ctrl-F2>           | (A) -> toggle the toolbar
"  <Ctrl-F3>           | (A) -> toggle the scrollbar
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
    nnoremap <silent><expr> <C-t> ':tabnew<CR>'
    nnoremap <silent><expr> <C-n> ':tabnext<CR>'
    nnoremap <silent><expr> <C-p> ':tabprev<CR>'

    "map shift-p to paste over a word, and visual paste to replace selection
    vnoremap p "_d"0P
    nnoremap <S-p> "_diwP

    "unmap F1 from help then map it to toggle the display of line numbers
    nmap <F1> <nop>
    nnoremap <silent><expr> <F1> ':set number!<CR>'

    "toggle line wrapping (and bottom bar if using the gui)
    if !has("gui_running")
        nnoremap <silent><expr> <F2> ':set wrap!<CR>'
    else
        nnoremap <silent><expr> <F2> ':set wrap! go'.'-+'[&wrap]."=b\r"
    endif

    "toggle the cursor line and column
    nnoremap <silent><expr> <F3> ':set cursorline! cursorcolumn!<CR>'

    "toggle folded code at foldpoints
    inoremap <F12> <C-O>za
    nnoremap <F12> za
    onoremap <F12> <C-C>za
    vnoremap <F12> zf

    "format the document
    nnoremap <Leader><C-f> mzgg=G`z<CR>

    "remove trailing white space from the document
    nnoremap <silent><expr> <Leader><C-w> ':FixWhitespace<CR>'

    "remap keys to scroll through text
    nnoremap <C-Up> gg
    nnoremap <C-k> gg0
    nnoremap <C-Down> G
    nnoremap <C-j> G$
    nnoremap <C-Right> $
    nnoremap <C-l> $
    nnoremap <C-Left> ^
    nnoremap <C-h> 0

    "map remap keys to select text
    nnoremap <C-a> ggvG
    nnoremap <S-Up> vgg
    nnoremap <S-k> vgg0
    nnoremap <S-Down> vG
    nnoremap <S-j> vG$
    nnoremap <S-Right> v$
    nnoremap <S-l> v$
    nnoremap <S-Left> v^
    nnoremap <S-h> v0
"}}}

"PLUGIN KEYBINDINGS {{{
    "toggle the nerd tree sidebar
    nnoremap <silent><expr> ` ':NERDTree<CR>'

    "toggle the tagbar sidebar
    nnoremap <silent><expr> ~ ':TagbarToggle<CR>'

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
