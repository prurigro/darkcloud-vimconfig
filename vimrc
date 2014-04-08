"========================="
"                         "
"  Darkcloud Vim Config:  "
"  vimrc                  "
"                         "
"  Maintainer: Prurigro   "
"  License: MIT           "
"                         "
"========================="

"DARKCLOUD VIM CONFIG FOLDER PATH: {{{
    " If you want to use darkcloud-vimconfig as a package without symlinking
    " the vim folder or placing it @ /etc/darkcloud-vimconfig, create a file
    " @ ~/.vim/darkcloud-path.vim and in it place the following, except with
    " the path pointing to the cloned repo:
    "
    " let g:darkcloudpath="/etc/darkcloud-vimconfig"

    if filereadable(glob("~/.vim/darkcloud-path.vim"))
        source ~/.vim/darkcloud-path.vim
    else
        let g:darkcloudpath="/etc/darkcloud-vimconfig"
    endif
"}}}

"USER CONFIG SETTINGS: {{{
    " If vim/vimrc.user doesn't already exist, run the 'update' script to have
    " it created, then toggle these settings there to override these and no
    " avoid conflicting with updates.

    "Syntax Checking Autostart: (1:start toggled on | 0: start toggled off)
    let g:autostartchecker=1

    "Vim Starts With The Tagbar Open: (1:start open | 0:start closed)
    let g:autostarttagbar=0

    "Powerline Font Support: (1:enabled | 0:disabled)
    let g:powerlinefonts=1

    "GVim Font Selection: (term font set by terminal)
    set guifont=Droid\ Sans\ Mono\ 12
"}}}

"LOAD DARKCLOUD CONFIG AND THEME FILES: {{{
    "Add Config Directory: (distro-agnostic system-wide)
    let &runtimepath=printf('%s,%s/vim,%s/vim/after',&runtimepath,g:darkcloudpath,g:darkcloudpath)

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
