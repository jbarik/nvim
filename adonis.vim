" Vim color file

set bg=dark
hi clear
if exists("syntax_on")
   syntax reset
endif

let colors_name = "adonis"

"hi Normal	guifg=#f8f8f2 guibg=#333333
hi Normal   guifg=#DAD3A9 guibg=#333333
hi Error    guifg=#ea445d guibg=#333333 gui=bold,underline,italic
hi ErrorMsg guifg=#ea445d guibg=#333333 gui=bold
"hi LineNr   guifg=#8b8bcd guibg=#333431
hi LineNr   guifg=#9696d2 guibg=#383937

" filler lines (~) after the last line in the buffer
hi EndOfBuffer guifg=#333431 guibg=#333431

" Visual block
hi Visual       gui=none   guifg=#eeeeee   guibg=#4e4e8f
hi VisualNOS	guifg=#8080ff guibg=fg	gui=reverse,underline
"hi Todo	gui=bold guifg=#d14a14 guibg=#333333
hi Todo		gui=bold guifg=#fc6a7f guibg=#333333
hi Search	gui=bold guifg=#1e1e27 guibg=#5499C7
hi IncSearch	guifg=#b0ffff guibg=#2050d0
hi MatchParen   gui=bold guifg=#1e1e27 guibg=#5499C7

hi SpecialKey	guifg=#32c6d8 gui=none
"hi Directory	guifg=#46cbdb gui=none
hi Directory	guifg=#39e5e5 gui=none
hi Title	guifg=magenta gui=none
hi WarningMsg	guifg=#eb3e6b gui=none
hi WildMenu	guifg=#333333 guibg=#9fd6ff
hi ModeMsg	guifg=#22cce2
hi MoreMsg	guifg=#eb3e6b
hi Question	guifg=#73d216 gui=bold
hi NonText	guifg=#0030ff
hi StatusLine	guifg=#5b5b5b guibg=#dad3a9
hi StatusLineNC	guifg=black guibg=darkgray gui=none
"hi VertSplit	guifg=#333333 guibg=#9fd6ff
"hi VertSplit	guifg=#333333 guibg=#c756ff
"hi VertSplit	guifg=#333333 guibg=#7256ff
hi VertSplit	guifg=#333333 guibg=#8066ff

hi Folded      guifg=#808080 guibg=#333431
hi FoldColumn  guifg=#808080 guibg=#333431
hi SignColumn  guifg=#808080 guibg=#2e2e2e

hi DiffAdd     guibg=darkblue
hi DiffChange  guibg=darkmagenta
hi DiffDelete  gui=bold guifg=Blue guibg=DarkCyan
hi DiffText    gui=bold guibg=Red

hi Cursor      gui=bold  guifg=black  guibg=yellow
hi lCursor     gui=none  guifg=#404040  guibg=#8fff8b
hi iCursor     gui=bold  guifg=black    guibg=yellow
hi CursorIM    gui=bold  guifg=#404040  guibg=#8b8bff
hi CursonLine  guifg=#DAD3A9 guibg=#333333
"hi CursorLineNr guifg=#7800f0 guibg=#333431
hi CursorLineNr guifg=#f42069 guibg=#333431

""================ Buffer explorer settings star ================
hi MBENormal          guifg=#8ac5f3 guibg=#333333
hi MBEChanged         guifg=#ff0000 guibg=#333333
hi MBEVisibleChanged  guifg=#ff0000 guibg=#333333

" The file which is visible and active(the curosor is in)
hi MBEVisibleActiveNormal  guifg=#05A543 guibg=#333333 gui=underline,bold

" File is visible but not the active one
hi MBEVisibleNormal guifg=#05A543 guibg=#333333 gui=none

" Changed and is the active window
hi MBEVisibleActiveChanged  guifg=#ff0000 guibg=#333333 gui=underline,bold

""================ Buffer explorer settings end ================

hi type		guifg=#73D216 gui=none
hi Ignore	guifg=bg
hi Special	guifg=Orange
hi Comment	gui=bold guifg=#85929E
hi PreProc	guifg=#ff80ff gui=none cterm=none
hi Constant	guifg=#ffa0a0
"hi Constant	guifg=#ff96ca
hi Statement	guifg=#EAEA0E gui=none
hi Identifier	guifg=#39e5e5 cterm=none
hi Underlined	cterm=underline term=underline

" Popup menu
"hi Pmenu guifg=#eeeeee guibg=#42428f
"hi PmenuSel guifg=#eeeeee guibg=#6D36B2 blend=0
"hi PmenuSbar guifg=blue guibg=#AF89BA
"hi PmenuThumb guifg=#c0c0c0

hi Pmenu      guifg=#eeeeee guibg=#34495e
hi PmenuSel   guifg=#eeeeee guibg=#2471a3 blend=0
hi PmenuSbar  guibg=#48c9b0
hi PmenuThumb guifg=#bdc3c7

"hi Pmenu guifg=#eeeeee guibg=#3e4452
"hi PmenuSel guifg=#eeeeee guibg=#5791c3 blend=0

" Customization JP
hi ColorColumn ctermbg=235 guibg=#51534F
"hi def link cCustomFunc  Function
hi cCustomFunc guifg=#dfcfe7
hi cDelimiter guifg=#00BFFF

" jpOPer2 are | ] [ {
hi jpOPer2 guifg=#D5C773
" cDelimiter are , ; : ?
hi cDelimiter guifg=#00BFFF

" See ~/.vim/after/syntax/cpp/c.vim, cpp.vim
" Operators are defined there
"
"
" See ~/.vim/after/syntax/cpp/c.vim, cpp.vim
" Operators are defined there
"
" https://github.com/joshdick/onedark.vim/blob/master/colors/onedark.vim
" +---------------------------------------------+
" |  Color Name  |         RGB        |   Hex   |
" |--------------+--------------------+---------|
" | Black        | rgb(40, 44, 52)    | #282c34 |
" |--------------+--------------------+---------|
" | White        | rgb(171, 178, 191) | #abb2bf |
" |--------------+--------------------+---------|
" | Light Red    | rgb(224, 108, 117) | #e06c75 |
" |--------------+--------------------+---------|
" | Dark Red     | rgb(190, 80, 70)   | #be5046 |
" |--------------+--------------------+---------|
" | Green        | rgb(152, 195, 121) | #98c379 |
" |--------------+--------------------+---------|
" | Light Yellow | rgb(229, 192, 123) | #e5c07b |
" |--------------+--------------------+---------|
" | Dark Yellow  | rgb(209, 154, 102) | #d19a66 |
" |--------------+--------------------+---------|
" | Blue         | rgb(97, 175, 239)  | #61afef |
" |--------------+--------------------+---------|
" | Magenta      | rgb(198, 120, 221) | #c678dd |
" |--------------+--------------------+---------|
" | Cyan         | rgb(86, 182, 194)  | #56b6c2 |
" |--------------+--------------------+---------|
" | Gutter Grey  | rgb(76, 82, 99)    | #4b5263 |
" |--------------+--------------------+---------|
" | Comment Grey | rgb(92, 99, 112)   | #5c6370 |
" +---------------------------------------------+
