"==========================="
"                           "
"  Keyboard Configuration:  "
"                           "
"==========================="
"
" Reference: (view plugin documentation for the full list of commands each offers)
"  <Ctrl-y>,            | (A) -> follows an emme term to expand it (ie: 'html:5')
"  <Leader><F2>         | (N) -> toggle hexhighlight's hexcode to colours in :gui
"  cs'"                 | (N) -> replace surrounding '' with "" (other delims work)
"  cs"<q>               | (N) -> replace surrounding "" with <q></q> tags
"  cst"                 | (N) -> replace any tag (ie: <q></q>) with quotes
"  ds                   | (N) -> removes delimiters
"  <Ctrl-n>             | (N) -> mark for multiple cursors, or select the next match
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
"  <Leader><C-w>        | (N) -> format document and return to current line
"
"  (git-fugitive)
"   <Leader>G           | (N) -> Git     : view the menu
"   <Leader>gc          | (N) -> Gcommit : make a commit
"   <Leader>gd          | (N) -> Gdiff * : show differences since the last commit
"   <Leader>ge          | (N) -> Gedit   : edit the git metadata
"   <Leader>gl          | (N) -> Glog    : view the commit and differences log
"   <Leader>gs          | (N) -> Gstatus : view status info about the git repo
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
"  :mc                  | (N) -> :MultipleCursorsFind (multiple cursors via regex)
"  :wsudo               | (N) -> :SudoWrite (write the file as root using sudo)
"  :rsudo               | (N) -> :SudoRead (read a file as root using sudo)
"
" Notes:
"  *by the default <Leader> key is: \
"

"==========="
" Mappings: "
"==========="
"tab and untabbing selected blocks
vmap <Tab> >gv
vmap <S-Tab> <gv

"move to the next and previous tabs
nnoremap <silent><expr> <Leader>n ':tabn<CR>'
nnoremap <silent><expr> <Leader>p ':tabp<CR>'

"toggle the nerd tree sidebar
nnoremap <silent><expr> <F1> ':NERDTree<CR>'

"toggle the tagbar sidebar
nnoremap <silent><expr> <F2> ':TagbarToggle<CR>'

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

"various git fugitive functions
nnoremap <silent><expr> <Leader>G ':Git<CR>'
nnoremap <silent><expr> <Leader>gc ':Gcommit<CR>'
nnoremap <silent><expr> <Leader>gd ':Gdiff *<CR>'
nnoremap <silent><expr> <Leader>ge ':Gedit<CR>'
nnoremap <silent><expr> <Leader>gl ':Glog<CR>'
nnoremap <silent><expr> <Leader>gs ':Gstatus<CR>'

"neocomplcache suggestions: cancel, autocomplete, scroll up and scroll down
inoremap <expr><Tab> pumvisible() ? neocomplcache#complete_common_string() : "\<Tab>"
inoremap <expr><Backspace> pumvisible() ? neocomplcache#close_popup() : "\<Backspace>"
inoremap <expr><Leader><Backspace> neocomplcache#undo_completion()

"compatibility hack for proper keyboard config in screen/tmux
if $TERM =~ '^screen-256color'
    nmap <Esc>OH <Home>
    imap <Esc>OH <Home>
    nmap <Esc>OF <End>
    imap <Esc>OF <End>
endif

"================"
" GVim Mappings: "
"================"
"map toggles for the menu, toolbar and scrollbar
noremap <silent><expr> <C-F1> ":if &go=~#'m'<Bar>set go-=m<Bar>else<Bar>set go+=m<Bar>endif<CR>"
noremap <silent><expr> <C-F2> ":if &go=~#'T'<Bar>set go-=T<Bar>else<Bar>set go+=T<Bar>endif<CR>"
noremap <silent><expr> <C-F3> ":if &go=~#'r'<Bar>set go-=r<Bar>else<Bar>set go+=r<Bar>endif<CR>"

"enable middle-click paste while holding shift
map <S-Insert> <MiddleMouse>
map! <S-Insert> <MiddleMouse>

"=========="
" Aliases: "
"=========="
cabbrev mc MultipleCursorsFind
cabbrev wsudo SudoWrite
cabbrev rsudo SudoRead
