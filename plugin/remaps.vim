
" Edit or load .vimrc
nmap <silent> <leader>ev :tabe $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>

" Replace all instances of the word under the cursor
nnoremap <Leader>s :%s/\V\<<C-r><C-w>\>/
nnoremap <Leader>S :argdo :%s/\V\<<C-r><C-w>\>/
nnoremap <Leader>f :vimgrep <C-r><C-w> **/*.js<CR>:copen<CR>

" Disable F1 help
:nmap <F1> :echo<CR>
:imap <F1> <C-o>:echo<CR>

" map %% to expand to the current file's directory
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'

" Remap omni-completion to CTRL+Space
nmap <C-space> ea<C-n>
imap <C-space> <C-n>

" Shortcut to touch all files in a project
noremap <C-s> :!find src test -exec touch {} \;<CR><CR>

" Use * to search for the current selection in visual mode
xnoremap * :<C-u>call <SID>VSetSearch()<CR>/<C-R>=@/<CR><CR>
function! s:VSetSearch()
  let temp = @s
  norm! gv"sy
  let @/ = '\V' . substitute(escape(@s, '/\'), '\n', '\\n', 'g')
  let @s = temp
endfunction

" re-indent the whole file, remove unnecessary whitespace
map <leader>i :call<SID>ReformatAndClean()<CR>
function! <SID>ReformatAndClean()
  " Preparation: save last search, and cursor position.
  let _s=@/
  let l = line(".")
  let c = col(".")

  "Replace tabs with spaces
  :1,$retab
  "Removing Trailing whitespace
  %s/\s\+$//e
  "Reindent the file
  :normal gg=G

  " Clean up: restore previous search history, and cursor position
  let @/=_s
  call cursor(l, c)
endfunction

" Remap Ctrl-j to: Save All; Return to normal mode
imap <silent> <C-j> <Esc>:wa<CR>
nmap <silent> <C-j> <Esc>:wa<CR>
