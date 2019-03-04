set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_html_checkers = ['validator']

let g:syntastic_cpp_compiler_options = "-std=c++11 -Wall -Wextra -Wpedantic"

let g:syntastic_html_checkers = ['w3']
