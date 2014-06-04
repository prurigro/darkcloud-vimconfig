"============================================================"
"                                                            "
"  Darkcloud Vim Config: vimrc                               "
"                                                            "
"  Maintainer: Kevin MacMartin (prurigro@gmail.com)          "
"  Website: https://github.com/prurigro/darkcloud-vimconfig  "
"                                                            "
"  License: MIT                                              "
"                                                            "
"============================================================"

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

"LOAD DARKCLOUD CONFIG AND THEME FILES: {{{
    "Add Config Directory: (distro-agnostic system-wide)
    let &runtimepath=printf('%s,%s/vim,%s/vim/after',&runtimepath,g:darkcloudpath,g:darkcloudpath)

    "Load Settings:
    runtime config/settings.vim

    "Load Plugins:
    runtime bundle/vim-pathogen/autoload/pathogen.vim

    "Load Keymappings:
    runtime config/keyboard.vim

    "Load After Config:
    runtime config/after.vim

    "Load User Config:
    runtime vimrc.user

    "Load Plugin Configuration:
    runtime config/plugins.vim

    "Load Colour Scheme:
    colorscheme darkcloud
"}}}
