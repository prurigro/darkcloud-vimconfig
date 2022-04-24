"============================================================"
"                                                            "
"  Darkcloud Vim Config: vimrc                               "
"                                                            "
"  By: Kevin MacMartin (prurigro@gmail.com)                  "
"  Website: https://github.com/prurigro/darkcloud-vimconfig  "
"                                                            "
"  License: MIT                                              "
"                                                            "
"============================================================"

"darkcloud vim config folder path: {{{
    "if you want to use darkcloud-vimconfig as a package without symlinking
    "the vim folder or placing it @ /etc/darkcloud-vimconfig, create a file
    "@ ~/.vim/darkcloud-path.vim and in it place the following, except with
    "the path pointing to the cloned repo:
    "
    "let g:darkcloudpath = "/etc/darkcloud-vimconfig"

    if filereadable(glob("~/.vim/darkcloud-path.vim"))
        source ~/.vim/darkcloud-path.vim
    else
        let g:darkcloudpath = "/etc/darkcloud-vimconfig"
    endif
"}}}

"LOAD DARKCLOUD CONFIG AND THEME FILES: {{{
    "Add Config Directory: (distro-agnostic system-wide)
    let &runtimepath = printf('%s,%s/vim,%s/vim/after',&runtimepath,g:darkcloudpath,g:darkcloudpath)

    "Load Colour Scheme:
    colorscheme default "hack to fix vimrc colorschemes in some versions of vim
    colorscheme darkcloud

    "Load Settings:
    runtime config/settings.vim

    "Initialize Plugins:
    let pathogen_disabled = []

    if has('python3')
        "configure pythonx and check for the python-neovim and python-msgpack libraries if python3 is found
        if !has('nvim')
            set pyxversion=3
        endif

        "check for python-neovim
        redir => python_neovim_check
        silent python3 exec("import pkgutil\nneovim = pkgutil.find_loader('neovim')\nfound = neovim is not None\nprint(found)")
        redir END

        if substitute(python_neovim_check, '^\n*\([^\n]*\)\n*$', '\1', '') == 'True'
            let g:python_neovim = 1
        else
            let g:python_neovim = 0
        endif

        "check for python-msgpack
        redir => python_msgpack_check
        silent python3 exec("import pkgutil\nmsgpack = pkgutil.find_loader('msgpack')\nfound = msgpack is not None\nprint(found)")
        redir END

        if substitute(python_msgpack_check, '^\n*\([^\n]*\)\n*$', '\1', '') == 'True'
            let g:python_msgpack = 1
        else
            let g:python_msgpack = 0
        endif
    else
        "if python isn't available disable plugins that depend on it and set library variables to false
        call add(pathogen_disabled, 'MatchTagAlways')
        let g:python_neovim = 0
        let g:python_msgpack = 0
    endif

    "don't load vim-gutentags if ctags can't be found
    if !executable('ctags')
        call add(pathogen_disabled, 'vim-gutentags')
    endif

    if !g:python_neovim || !g:python_msgpack
        "don't load deoplete if either of its python dependencies are missing
        call add(pathogen_disabled, 'deoplete.nvim')
        call add(pathogen_disabled, 'neco-syntax')
        call add(pathogen_disabled, 'nvim-yarp')
        call add(pathogen_disabled, 'vim-hug-neovim-rpc')
    elseif has('nvim')
        "don't load the neovim compatibility plugins required by deoplete if actually running neovim
        call add(pathogen_disabled, 'nvim-yarp')
        call add(pathogen_disabled, 'vim-hug-neovim-rpc')
    endif

    "if neovim is being used we should disable plugins that aren't compatible or necessary
    if has('nvim')
        call add(pathogen_disabled, 'vim-fixkey')
    endif

    "use pathogen to load plugins that haven't been disabled
    runtime bundle/vim-pathogen/autoload/pathogen.vim

    "Load Keymappings:
    runtime config/keyboard.vim

    "Load User Config:
    runtime vimrc.user

    "Load Plugin Configuration:
    runtime config/plugins.vim

    "Load After Config:
    runtime config/after.vim
"}}}
