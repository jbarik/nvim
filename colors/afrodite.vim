" Vim color file

set bg=dark
hi clear
if exists("syntax_on")
   syntax reset
endif

let colors_name = "afrodite"

hi Normal   guifg=#c2c1c2 guibg=#24272e
hi Error    guifg=#ea445d guibg=#24272e gui=underline,italic
hi ErrorMsg guifg=#ea445d guibg=#24272e
hi LineNr   guifg=#9696d2 guibg=#272c34

" filler lines (~) after the last line in the buffer
hi EndOfBuffer guifg=#272c34 guibg=#272c34

" Visual block
"hi Visual       gui=none   guifg=#eeeeee   guibg=#4e4e8f
hi Todo		    guifg=#fc6a7f guibg=#24272e gui=bold
hi Visual     guibg=#1063A6
hi VisualNOS	guifg=#8080ff guibg=fg	gui=reverse,underline
hi Search     guibg=#0097a7
hi IncSearch	guifg=#b0ffff guibg=#2050d0
hi MatchParen guifg=#1e1e27 guibg=#5499C7 gui=bold

"hi Title	    guifg=#e692fc gui=nocombine
hi Title	    guifg=#e692fc gui=NONE
hi SpecialKey	guifg=#32c6d8
hi WarningMsg	guifg=#eb3e6b
hi WildMenu	  guifg=#24272e guibg=#9fd6ff
hi ModeMsg	  guifg=#22cce2
hi MoreMsg	  guifg=#eb3e6b
hi Question	  guifg=#73d216
hi NonText	  guifg=#0030ff
hi VertSplit	guifg=#24272e guibg=#8066ff
hi StatusLine	guifg=#5b5b5b guibg=#dad3a9
hi StatusLineNC	guifg=black guibg=darkgray

hi Folded      guifg=#808080 guibg=#333431
hi FoldColumn  guifg=#808080 guibg=#333431
hi SignColumn  guifg=#808080 guibg=#272C34

hi DiffAdd     guibg=darkblue
hi DiffChange  guibg=darkmagenta
hi DiffDelete  gui=bold guifg=Blue guibg=DarkCyan
hi DiffText    gui=bold guibg=Red

hi Cursor      guifg=black  guibg=yellow  gui=bold
hi iCursor     guifg=black  guibg=yellow  gui=bold
hi lCursor     guifg=#404040 guibg=#8fff8b gui=none
hi CursorIM    guifg=#404040 guibg=#8b8bff gui=bold
hi CursonLine  guifg=#343b45 guibg=#24272e
hi ColorColumn guibg=#343b45
hi CursorLineNr guifg=#f42069 guibg=#272c34

""================ Buffer explorer settings star ================
hi MBENormal guifg=#2ec4b6 guibg=#24272e

" active - cursor is in this window
hi MBEVisibleNormal        guifg=#2ddc2d guibg=#24272e gui=italic
hi MBEVisibleActiveNormal  guifg=#2ddc2d guibg=#24272e

hi MBEChanged               guifg=#db606b guibg=#24272e gui=italic
hi MBEVisibleChanged        guifg=#db606b guibg=#24272e gui=italic
hi MBEVisibleActiveChanged  guifg=#db606b guibg=#24272e
""================ Buffer explorer settings end ================

hi Type		guifg=#90d56e gui=none
hi Ignore	guifg=bg
hi Special	guifg=Orange
hi Comment	guifg=#85929E
hi PreProc	guifg=#e580e5 gui=none
hi Constant	guifg=#ffa0a0
"hi Constant	guifg=#c4ffa0
"hi Statement	guifg=#dede50 gui=none
hi Statement	guifg=#cbcb6f gui=none
hi Identifier	guifg=#57d2fb
hi Underlined	guifg=#92acfc gui=underline

" Popup menu
hi Pmenu      guifg=#eeeeee guibg=#333e56
hi PmenuSel   guifg=#77e70b guibg=#38589d blend=0
hi PmenuSbar  guibg=#48c9b0
hi PmenuThumb guifg=#bdc3c7

hi Pmenu      guifg=#eeeeee guibg=#4f5e81
hi PmenuSel   guifg=#eeeeee guibg=#4f8159 blend=0

" Misc for org file, text file etc
hi Directory    guifg=#32dcdc
"hi hyperlinkURL guifg=#90d56e

" Highligts for fzf window
hi FzfBg      guifg=#eeeeee guibg=#333e56
hi FzfMatch   guifg=#77e70b
hi FzfCurline guifg=#cdcd0f guibg=#333e56

" Customization JP
"hi CustomFunc guifg=#88b6df
hi Function guifg=#88b6df
hi Function guifg=#90b4d4
" cDelimiter are , ; : ?
hi Delimiter guifg=#00bfff
hi Operator  guifg=#dede50
hi Operator  guifg=#c0c06e

hi OrgHeading1 guifg=#e692fc
hi OrgHeading2 guifg=#64b5f6
hi OrgHeading3 guifg=#cbcb6f
hi OrgHeading4 guifg=#90d56e
hi OrgHeading5 guifg=#F06292
hi OrgHeading6 guifg=#57d2fb
hi OrgHeading7 guifg=#87CEEB

hi SneakFirstMatch guifg=#f9f8f9 guibg=#6fc860
hi SneakSubsequentMatch guifg=#f9f8f9 guibg=#b960c8

hi LspError guifg=#ea445d
hi LspWarn  guifg=#cbcb6f 
hi LspHint  guifg=#56b6c2

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
