
" Enable tag lookup with CTRL-P
let g:ctrlp_extensions = ['tag']
nmap <silent> <C-l> :CtrlPTag<CR>

let g:ctrlp_cmd='CtrlP :pwd'

let g:ctrlp_root_markers = ['.version'] 

let g:ctrlp_cache_dir = $HOME . '/.cache/ctrlp'
if executable('ag')
  let g:ctrlp_user_command = 'ag %s -i --nocolor --nogroup --hidden
      \ --ignore .git
      \ --ignore .svn
      \ --ignore .hg
      \ --ignore .DS_Store
      \ --ignore "**/*.pyc"
      \ --ignore "**/node_modules/*"
      \ -g ""'
endif

let g:ctrlp_working_path_mode = 'ra'
