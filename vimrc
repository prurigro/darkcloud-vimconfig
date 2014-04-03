"==============="
"               "
"  Vim Config:  "
"               "
"==============="
"
" Notes:
"  Tmux requires the '-2' flag to be set when
"  launched for vim to use more than just the
"  set of terminal colours.
"
"  The ctags package should be downloaded from
"  http://ctags.sourceforge.net and installed
"  to $PATH
"
"  To use lightline with powerline fonts, set
"  powerlinefonts=1 below, and ensure guifont is
"  set to a powerline patched font. For example:
"  guifont=Droid\ Sans\ Mono\ for\ Powerline\ 12

"Powerline Font Support: (1:enabled, 0:disabled)
let powerlinefonts=1

"Syntax Checking Enabled: (1:enabled, 0:must be toggled on)
let autochecksyntax=1

"GVim Font Selection: (term font set by terminal)
set guifont=Droid\ Sans\ Mono\ 12

"Add Config Directory: (distro-agnostic system-wide)
set runtimepath+=/etc/vim,/etc/vim/after

"Load Settings:
runtime config/settings.vim

"Load Plugins:
runtime bundle/vim-pathogen/autoload/pathogen.vim
runtime config/plugins.vim

"Configure Keymappings:
runtime config/keyboard.vim

"Load Theme:
colorscheme darkcloud
