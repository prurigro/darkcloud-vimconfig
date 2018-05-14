"remove right-hand whitespace from all lines on uncomment
let g:tcomment#rstrip_on_uncomment = 2

"configure custom comment styles
call tcomment#type#Define('vue', '// %s')
call tcomment#type#Define('blade', '{{-- %s --}}')
