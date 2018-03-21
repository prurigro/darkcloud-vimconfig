"remove right-hand whitespace from all lines on uncomment
let g:tcomment#rstrip_on_uncomment = 2

"use // to comment in vue files
call tcomment#type#Define('vue', '// %s')
