"  This Tabular TableFormat() function is taken from the
"  vim-markdown project by plasticboy, which can be found
"  at https://github.com/plasticboy/vim-markdown and is
"  licensed with the MIT license.
function! s:TableFormat()
    let l:pos = getpos('.')
    normal! {
    call search('|')
    normal! j
    s/[^|]//g
    Tabularize /|
    s/ /-/g
    call setpos('.', l:pos)
endfunction

command! -buffer TableFormat call s:TableFormat()
