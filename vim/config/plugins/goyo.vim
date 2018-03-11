autocmd VimEnter,Filetype *
    \ let g:goyo_width = &textwidth |
    \ if (g:goyo_width == 0) |
    \     let g:goyo_width = max(map(getline(1,'$'), 'len(v:val)')) |
    \     if (g:goyo_width < 80) |
    \         let g:goyo_width = 80 |
    \     endif |
    \ endif
