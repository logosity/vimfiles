" Quit when a syntax file was already loaded.
if exists('b:current_syntax') | finish|  endif

syntax match fixVar "\k\+" nextgroup=fixOpenTag
syntax match fixOpenTag "<" nextgroup=fixNum
syntax match fixNum "\d\+" nextgroup=fixCloseTag
syntax match fixCloseTag ">" nextgroup=fixAssignment
syntax match fixAssignment "=" contained nextgroup=fixValue
syntax match fixValue "[^|]*" contained nextgroup=fixFieldSeparator
syntax match fixFieldSeparator "|" contained

hi def link fixVar Identifier
hi def link fixNum Number

highlight fixOpenTag guifg=Red
highlight fixCloseTag guifg=Red
highlight fixAssignment guifg=Cyan
highlight fixValue guifg=Magenta
highlight fixFieldSeparator guifg=DarkGrey

let b:current_syntax = 'fix'
