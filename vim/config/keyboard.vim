"=========================="
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
"  =                    | (N) -> move to the first character on the next line
"  <Ctrl-ScrollUp>      | (A) -> scroll right
"  <Ctrl-ScrollDown>    | (A) -> scroll left
"  <Shift-MiddleClick>  | (A) -> unbind this from vim so xorg can paste
"  <Ctrl-t>             | (A) -> open a new tab
"  <Ctrl-n>             | (A) -> go to the next open tab
"  <Ctrl-p>             | (A) -> go to the previous open tab
"  <Backspace>          | (V) -> deletes currently selected text
"  <Backspace>          | (N) -> deletes the character behind the cursor
"  <Tab>                | (V) -> indent all the lines currently selected
"  <Tab>                | (N) -> indent the current line
"  <Shift-Tab>          | (V) -> unindent all the lines currently selected
"  <Shift-Tab>          | (N) -> unindent the current line
"  \\                   | (N) -> show spelling suggestions popup for word
"  \|                   | (N) -> add word to a local list of correct spellings
"  `                    | (N) -> toggle the nerdtree sidebar
"  ~                    | (N) -> toggle the tagbar sidebar
"  p                    | (V) -> paste and replace the selection
"  <Shift-p>            | (N) -> paste and replace the current word
"  <F1>                 | (A) -> toggle line numbers
"  <F2>                 | (A) -> toggle line wrapping
"  <F3>                 | (A) -> toggle row/column highlighting
"  <F4>                 | (A) -> toggle spellcheck
"  <F12>                | (A) -> toggle collapsed/folded rows
"  <Leader><C-f>        | (N) -> format document and return to current line
"  <Leader><C-w>        | (N) -> remove whitespace
"  <Leader><C-t>        | (N) -> convert tabs into spaces
"  <Leader>\            | (N) -> remove search highlighting
"  <Ctrl-Up>            | (N) -> move to the beginning of the document
"  <Ctrl-k>             | (N) -> move to the beginning of the document
"  <Ctrl-Down>          | (N) -> move to the end of the document
"  <Ctrl-j>             | (N) -> move to the end of the document
"  <Ctrl-Right>         | (N) -> move to the end of the line
"  <Ctrl-l>             | (N) -> move to the end of the line
"  <Ctrl-Left>          | (N) -> move to the beginning of the non-whitespace
"  <Ctrl-h>             | (N) -> move to the beginning of the line
"  <Ctrl-a>             | (V) -> select all
"  <Ctrl-a>             | (N) -> select all
"  <Leader>a            | (V) -> select all
"  <Leader>a            | (N) -> select all
"  <Shift-Up>           | (V) -> toggle selection of all text above the cursor
"  <Shift-Up>           | (N) -> select all text above the cursor
"  <Shift-k>            | (V) -> toggle selection of all text above the cursor
"  <Shift-k>            | (N) -> select all text above the cursor
"  <Shift-Down>         | (V) -> toggle selection of all text below the cursor
"  <Shift-Down>         | (N) -> select all text below the cursor
"  <Shift-j>            | (V) -> toggle selection of all text below the cursor
"  <Shift-j>            | (N) -> select all text below the cursor
"  <Shift-Right>        | (V) -> toggle selection of all text to the right of the cursor
"  <Shift-Right>        | (N) -> select all text to the right of the cursor
"  <Shift-l>            | (V) -> toggle selection of all text to the right of the cursor
"  <Shift-l>            | (N) -> select all text to the right of the cursor
"  <Shift-Left>         | (V) -> toggle selection of all non-whitespace to the left
"  <Shift-Left>         | (N) -> select all non-whitespace to the left
"  <Shift-h>            | (V) -> toggle selection of all non-whitespace to the left
"  <Shift-h>            | (N) -> select to the beginning of the line
"
"  (neocomplcache)
"   <Tab>               | (I) -> write the part common to all suggestions
"   <Backspace>         | (I) -> cancle the match dialog (during suggestion)
"   <Leader><Backspace> | (N) -> undo the most recent match selection
"
" GVim Mappings:
"  <Ctrl-F1>            | (A) -> toggle the menu
"  <Ctrl-F2>            | (A) -> toggle the toolbar
"  <Ctrl-F3>            | (A) -> toggle the scrollbar
"
" Aliases:
"  :wsudo & :sudow      | (N) -> :SudoWrite (write the file as root using sudo)
"  :esudo & :sudoe      | (N) -> :SudoRead (read a file as root using sudo)
"
" Notes:
"  *by the default <Leader> key is: \
"

"MAPPINGS: GENERAL KEYBINDINGS AND REBINDINGS {{{
    "map = to + so shift doesn't need to be held to use its functionality
    nnoremap = +

    "hold shift to enable middle-click paste
    noremap <S-Insert> <MiddleMouse>
    noremap! <S-Insert> <MiddleMouse>

    "hold ctrl to scroll left/right instead of up/down
    noremap <C-ScrollWheelUp> 3zl
    noremap <C-ScrollWheelDown> 3zh

    "have backspace delete the highlighted selection in visual mode
    vnoremap <Backspace> x
    nnoremap <Backspace> i<Backspace><Esc>l

    "tab and untabbing selected blocks
    vnoremap <Tab> >gv
    vnoremap <S-Tab> <gv
    nnoremap <Tab> v>gv<Esc>
    nnoremap <S-Tab> v<gv<Esc>

    "press backslash twice on a mispelled word for suggestions
    nnoremap \\ ea<C-X><C-S>
    nnoremap \| zg

    "move to the next and previous tabs
    nnoremap <silent><expr> <C-t> ':tabnew<CR>'
    nnoremap <silent><expr> <C-n> ':tabnext<CR>'
    nnoremap <silent><expr> <C-p> ':tabprev<CR>'

    "map shift-p to paste over a word, and visual paste to replace selection
    vnoremap p "_d"0P
    nnoremap <S-p> "_diwP

    "unmap F1 from help then map it to toggle the display of line numbers
    nnoremap <silent><expr> <F1> ':set number!<CR>'
    inoremap <silent><expr> <F1> '<Esc>:set number!<CR>a'
    vnoremap <silent><expr> <F1> '<Esc>:set number!<CR>v'

    "toggle line wrapping (and bottom bar if using the gui)
    nnoremap <silent><expr> <F2> ':set wrap! go'.'-+'[&wrap]."=b\r"
    inoremap <silent><expr> <F2> '<Esc>:set wrap! go'.'-+'[&wrap]."=b\ra"
    vnoremap <silent><expr> <F2> '<Esc>:set wrap! go'.'-+'[&wrap]."=b\rv"

    "toggle the cursor line and column
    nnoremap <silent><expr> <F3> ':set cursorline! cursorcolumn!<CR>'
    inoremap <silent><expr> <F3> '<Esc>:set cursorline! cursorcolumn!<CR>a'
    vnoremap <silent><expr> <F3> '<Esc>:set cursorline! cursorcolumn!<CR>v'

    "toggle spellcheck
    nnoremap <silent><expr> <F4> ':set spell!<CR>'
    inoremap <silent><expr> <F4> '<Esc>:set spell!<CR>a'
    vnoremap <silent><expr> <F4> '<Esc>:set spell!<CR>a'

    "toggle folded code at foldpoints
    inoremap <F12> <C-O>za
    nnoremap <F12> za
    onoremap <F12> <C-C>za
    vnoremap <F12> <Esc>zav

    "format the document
    nnoremap <Leader><C-f> mzgg=G`z<CR>

    "remove trailing white space from the document
    nnoremap <silent><expr> <Leader><C-w> ':FixWhitespace<CR>'

    "convert tabs to spaces
    nnoremap <silent><expr> <Leader><C-t> ':retab<CR>:noh<CR>'

    "remove search highlight
    nnoremap <silent><expr> <Leader>/ ':noh<CR>'

    "remap keys to scroll through text
    nnoremap <C-Up> gg0
    nnoremap <C-k> gg0
    nnoremap <C-Down> G$
    nnoremap <C-j> G$
    nnoremap <C-Right> $
    nnoremap <C-l> $
    nnoremap <C-Left> ^
    nnoremap <C-h> ^

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

    "tmux will send xterm-style keys when xterm-keys is on
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

"GVIM: MAPPINGS FOR GUI ELEMENTS {{{
    "map toggles for the menu, toolbar and vertical scrollbar
    noremap <silent><expr> <C-F1> ":if &go=~#'m'<Bar>set go-=m<Bar>else<Bar>set go+=m<Bar>endif<CR>"
    noremap <silent><expr> <C-F2> ":if &go=~#'T'<Bar>set go-=T<Bar>else<Bar>set go+=T<Bar>endif<CR>"
    noremap <silent><expr> <C-F3> ":if &go=~#'r'<Bar>set go-=r<Bar>else<Bar>set go+=r<Bar>endif<CR>"
"}}}

"ALIASES: COMMAND SHORTCUTS {{{
    cabbrev sudow SudoWrite
    cabbrev wsudo SudoWrite
    cabbrev sudoe SudoRead
    cabbrev esudo SudoRead
"}}}
