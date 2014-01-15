
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

function Send_to_Screen(text)
  let escaped_text = substitute(shellescape(a:text), "\\\\\n", "\n", "g")

  call system("screen -S " . b:slime["sessionname"] . " -p " . b:slime["windowname"] . " -X stuff " . escaped_text)
endfunction

function Send_to_Repl(text)
  let b:slime = {"sessionname": "repl", "windowname": "0"}
  call Send_to_Screen(a:text)
endfunction

function Screen_Session_Names(A,L,P)
  return system("screen -ls | awk '/Attached/ {print $1}'")
endfunction

function Run_tests()
  call system("touch src/**/*")
endfunction

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

vmap <C-c><C-c> "ry:call Send_to_Repl(@r)<CR>
nmap <C-c><C-c> vip<C-c><C-c>

imap <C-s><C-s> <Esc>:wa<CR>:call Run_tests()<CR>
nmap <C-s><C-s> :wa<CR>:call Run_tests()<CR>

imap <C-c><C-s> <Esc>:wa<CR>:call Run_tests()<CR>
nmap <C-c><C-s> :wa<CR>:call Run_tests()<CR>
