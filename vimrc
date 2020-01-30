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

    "configure pythonx and the python_neovim variable to determine whether deoplete should be loaded
    if has('python3')
        if !has('nvim')
            set pyxversion=3
        endif

        redir => python_neovim_check
        silent python3 exec("import pkgutil\nneovim = pkgutil.find_loader('neovim')\nfound = neovim is not None\nprint(found)")
        redir END

        if substitute(python_neovim_check, '^\n*\([^\n]*\)\n*$', '\1', '') == 'True'
            let g:python_neovim = 1
        else
            let g:python_neovim = 0
        endif
    else
        let g:python_neovim = 0
    endif

    "disable incompatible/unnecessary plugins
    if has('nvim')
        call add(pathogen_disabled, 'vim-fixkey')
    endif

    if !has('python')
        call add(pathogen_disabled, 'MatchTagAlways')
    endif

    if !g:python_neovim
        call add(pathogen_disabled, 'deoplete.nvim')
        call add(pathogen_disabled, 'neco-syntax')
        call add(pathogen_disabled, 'nvim-yarp')
        call add(pathogen_disabled, 'vim-hug-neovim-rpc')
    elseif has('nvim')
        call add(pathogen_disabled, 'nvim-yarp')
        call add(pathogen_disabled, 'vim-hug-neovim-rpc')
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
