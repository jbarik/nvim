" Vim universal .txt syntax file
" Language:     txt 1.2
" Maintainer:   Tomasz Kalkosiński <spoonman@op.pl>
" Last change:  3 Jan 2007
"
" This is an universal syntax script for all text documents, logs, changelogs, readmes
" and all other strange and undetected filetypes.
" The goal is to keep it very simple. It colors numbers, operators, signs,
" cites, brackets, delimiters, comments, TODOs, errors, debug, changelog tags
" and basic smileys ;]
"
" Changelog:
" 1.2 (03-01-2007)
"                       Add: Changelog tags: add, chg, fix, rem, del linked with Keyword
"                       Add: note to txtTodo group
"
" 1.1 (01-07-2006)	Add: International cites
" 			Chg: txtString color to Normal
"	 		Chg: Simplified number coloring working better now
"
" 1.0 (28-04-2006)	Initial upload
"
" Quit when a syntax file was already loaded
if exists("b:current_syntax")
  finish
endif

syn case ignore


" Integer with - + or nothing in front
syn match txtNumber '\d\+'
syn match txtNumber '[-+]\d\+'

" Floating point number with decimal no E or e
syn match txtNumber '[-+]\d\+\.\d*'

" Floating point like number with E and no decimal point (+,-)
syn match txtNumber '[-+]\=\d[[:digit:]]*[eE][\-+]\=\d\+'
syn match txtNumber '\d[[:digit:]]*[eE][\-+]\=\d\+'

" Floating point like number with E and decimal point (+,-)
syn match txtNumber '[-+]\=\d[[:digit:]]*\.\d*[eE][\-+]\=\d\+'
syn match txtNumber '\d[[:digit:]]*\.\d*[eE][\-+]\=\d\+'

" Hexadecimal number
syn match txtNumber '0[xX][0-9a-fA-F]*'
hi txtNumber guifg=#ff54b0
hi txtNumber guifg=#AF7AC5
hi txtNumber guifg=#DC80F4

syntax region infoString start=/\v"/ skip=/\v(\\[\\"]){-1}/ end=/\v"/
syntax region infoString start=/\v'/ end=/\v'/
hi infoString guifg=#90D56E

"highlight infoIdentifier gui=underline guifg=#77b5fe
highlight infoIdentifier guifg=#77b5fe
syn match infoIdentifier 'SUBSYS_GRAPH_PTR:'
syn match infoIdentifier 'TYPE_STRING:'
syn match infoIdentifier 'BLOCK_NAME:'
syn match infoIdentifier 'POINTER:'
syn match infoIdentifier 'SID:'
syn match infoIdentifier 'START:'
syn match infoIdentifier 'END:'

let b:current_syntax = "info"
