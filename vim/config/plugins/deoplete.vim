"disable completion (default: 0)
if !exists("g:disablecompletion")
    let g:disablecompletion = 0
endif

if !g:disablecompletion && g:python_neovim
    let g:deoplete#enable_at_startup = 1
endif
