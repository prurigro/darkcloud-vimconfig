"========================="
"                         "
"  Darkcloud Vim Config:  "
"  vimrc                  "
"                         "
"  Maintainer: Prurigro   "
"  License: MIT           "
"                         "
"========================="

"USER CONFIG SETTINGS: {{{
    "Darkcloud Vim Folder:
    let s:darkcloudpath="/etc/darkcloud-vimconfig"

    "Start With Syntax Checking: (1:start toggled on, 0:start toggled off)
    let g:autostartchecker=1

    "Powerline Font Support: (1:enabled, 0:disabled)
    let g:powerlinefonts=1

    "GVim Font Selection: (term font set by terminal)
    set guifont=Droid\ Sans\ Mono\ 12
"}}}

"LOAD DARKCLOUD CONFIG AND THEME FILES: {{{
    "Add Config Directory: (distro-agnostic system-wide)
    let &runtimepath=printf('%s,%s/vim,%s/vim/after',&runtimepath,s:darkcloudpath,s:darkcloudpath)

    "Load Settings:
    runtime config/settings.vim

    "Load Plugins:
    runtime bundle/vim-pathogen/autoload/pathogen.vim

    "Load Plugin Configuration:
    runtime config/plugins.vim

    "Load Keymappings:
    runtime config/keyboard.vim

    "Load Colour Scheme:
    colorscheme darkcloud
"}}}

"LOAD USER CONFIG FILE: {{{
    runtime vimrc.user
"}}}
