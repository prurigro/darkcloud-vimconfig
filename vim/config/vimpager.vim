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
unmap v
unmap w
unmap <PageDown>
unmap <kPageDown>
unmap <PageUp>
unmap <kPageUp>

" Main Settings:
set nocursorline nocursorcolumn "disable cursor column/line highlighting
set nofoldenable "disable the fold column
set noru laststatus=0 noshowmode "remove statusline
set clipboard=autoselect "autocopy selection
set clipboard+=unnamed "use '*' reg
if has('unnamedplus')|set clipboard+=unnamedplus|endif "if exists, use '+' reg
set autoread "track file changes
autocmd CursorHold * checktime "use CursorHold events to trigger checktime

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

" Selection
nnoremap <C-a> gg0vG$
xnoremap <C-a> <Esc>gg0vG$
nnoremap <Leader>a gg0vG$
xnoremap <Leader>a <Esc>gg0vG$
nnoremap <silent><expr> <Leader>/ ':noh<CR>'
