"============================================================"
"                                                            "
"  Darkcloud Vim Config: vimpager.vim                        "
"                                                            "
"  By: Kevin MacMartin (prurigro@gmail.com)                  "
"  Website: https://github.com/prurigro/darkcloud-vimconfig  "
"                                                            "
"  License: MIT                                              "
"                                                            "
"============================================================"

" Undo unwanted less.vim keymappings
map v <Nop>
noremap w <S-Right>
noremap <PageDown> <C-F>
noremap <kPageDown> <C-F>
noremap <PageUp> <C-B>
noremap <kPageUp> <C-B>

" Main Settings:
set nocursorline nocursorcolumn "disable cursor column/line highlighting
set nofoldenable "disable the fold column
set noru laststatus=0 noshowmode "remove statusline
set clipboard=autoselect "autocopy selection
set clipboard+=unnamed "use '*' reg
if has('unnamedplus')|set clipboard+=unnamedplus|endif "if exists, use '+' reg
set autoread "track file changes
autocmd CursorHold * checktime "use CursorHold events to trigger checktime
set conceallevel=2 "enable the conceal feature to hide unnecessary elements
set concealcursor=n "conceal text in the cursor line while in normal mode

" Override Filetypes:
runtime bundle.pager/vim-markdown-concealed/ftdetect/mkdc.vim

" Mappings:
" Mouse
map <C-ScrollWheelUp> <Nop>
map <C-ScrollWheelDown> <Nop>
map <A-ScrollWheelUp> <Nop>
map <A-ScrollWheelDown> <Nop>
noremap <C-ScrollWheelUp> 4zl
noremap <C-ScrollWheelDown> 4zh
noremap <A-ScrollWheelUp> zl
noremap <A-ScrollWheelDown> zh

" Movement
noremap <Home> 0
noremap <kHome> <Home>
noremap <End> $
noremap <kEnd> <End>
noremap <Up> <C-P>
noremap <Down> <C-N>
noremap <Right> zL
noremap <Left> zH
noremap = +
noremap _ -
noremap <C-Up> 4k
noremap <C-Down> 4j
noremap <C-Right> <S-Right>
noremap <C-Left> <S-Left>
noremap <S-Up> gg0
noremap <S-Down> G$
noremap <S-Right> $
noremap <S-Left> ^

" Copy/Paste
nnoremap y vy<Esc>
vnoremap y y
nnoremap <C-c> y
vnoremap <C-c> y
nnoremap T vg_y
vnoremap T g_y

" Search
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)
nnoremap <silent><expr> // '<Esc>:noh<CR>'

" Selection
nnoremap <C-a> gg0vG$
xnoremap <C-a> <Esc>gg0vG$
nnoremap <Leader>a gg0vG$
xnoremap <Leader>a <Esc>gg0vG$

" Toggles
nnoremap <silent><expr> <F1> ':set wrap!<CR>:echo "line wrapping toggled"<CR>'
xnoremap <silent><expr> <F1> '<Esc>:set wrap!<CR>gv'
nnoremap <silent><expr> <F2> ':set spell!<CR>:echo "spell checking toggled"<CR>'
xnoremap <silent><expr> <F2> '<Esc>:set spell!<CR>gv'
