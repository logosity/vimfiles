" Load Pathogen
call pathogen#incubate()
call pathogen#helptags()

set secure
set guifont=Inconsolata\ Regular:h18
set backupcopy=yes
set backupdir=~/.vim-backup,~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set splitright
set statusline=[%{fnamemodify(getcwd(),':t')}]\ %F%m%r%h%w\ [Line=%03l,Col=%03v][%p%%]\ [Type=%y]
set nocompatible
set hidden
set exrc
set path+=.,,**
set guioptions=aci
set history=10000
set sts=2
set smarttab
set shiftwidth=2
set autoindent
set expandtab
set backspace=start,eol,indent
set incsearch
set autoread
set autowrite
set ignorecase
set smartcase
set lazyredraw
set wildmenu
set wildmode=list:longest
set number
set nohlsearch
set wrap
set linebreak
set visualbell
set wildignore+=vendor,tmp,target,.privatebuild,*.class
set laststatus=2

" Load matchit
runtime macros/matchit.vim

:color blackboard

" Have to do this after loading pathogen, because ubuntu
" turns on filetype detection by default, and for
" pathogen to pick up the types properly, you have to turn
" filetype on _after_ loading pathogen
filetype off
filetype plugin indent on

syntax on
syntax sync fromstart

" Treat eco files as HTML
" This shouldn't be here...but not sure where it goes
au BufRead,BufNewFile *html.eco set filetype=html
" Even though this is in specky, if we don't do it here it doesn't take
au BufRead,BufNewFile *_spec.rb set filetype=rspec

let g:syntastic_python_checkers = []
