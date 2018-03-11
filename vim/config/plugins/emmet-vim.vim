let g:use_emmet_complete_tag=1
let g:user_emmet_mode='a'

if filereadable("~/.vim/snippets.json")
    let g:user_emmet_settings = webapi#json#decode(join(readfile(expand('~/.vim/snippets.json')), "\n"))
endif
