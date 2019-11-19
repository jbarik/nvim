" Vim color file

set bg=dark
hi clear
if exists("syntax_on")
   syntax reset
endif

let colors_name = "adonis"

"hi Normal	guifg=#f8f8f2 guibg=#333333
hi Normal   guifg=#DAD3A9 guibg=#333333
hi ErrorMsg guifg=#ffffff guibg=#287eff
hi LineNr   guifg=#8b8bcd guibg=#333431

" Visual block
hi Visual       gui=none   guifg=#eeeeee   guibg=#4e4e8f
hi VisualNOS	guifg=#8080ff guibg=fg	gui=reverse,underline
hi Todo		gui=bold guifg=#d14a14 guibg=#333333
hi Search	gui=bold guifg=#1e1e27 guibg=#5499C7
hi IncSearch	guifg=#b0ffff guibg=#2050d0
hi MatchParen   gui=bold guifg=#1e1e27 guibg=#5499C7

hi SpecialKey	guifg=cyan
hi Directory	guifg=cyan
hi Title	guifg=magenta gui=none
hi WarningMsg	guifg=red
hi WildMenu	guifg=yellow guibg=black
hi ModeMsg	guifg=#22cce2
hi MoreMsg	ctermfg=darkgreen
hi Question	guifg=green gui=none
hi NonText	guifg=#0030ff
hi StatusLine	guifg=blue guibg=darkgray gui=none
hi StatusLineNC	guifg=black guibg=darkgray gui=none
hi VertSplit	guifg=black guibg=darkgray gui=none

hi Folded	guifg=#808080 guibg=#333431
hi FoldColumn	guifg=#808080 guibg=#333431
hi SignColumn	guifg=#808080 guibg=#2e2e2e

hi DiffAdd	guibg=darkblue
hi DiffChange	guibg=darkmagenta
hi DiffDelete	gui=bold guifg=Blue guibg=DarkCyan
hi DiffText	gui=bold guibg=Red

hi Cursor	gui=bold   guifg=#0e0f0f  guibg=yellow
hi lCursor      gui=none   guifg=#404040  guibg=#8fff8b
hi iCursor      gui=bold   guifg=black    guibg=yellow
hi CursorIM     gui=bold   guifg=#404040  guibg=#8b8bff
hi CursonLine   guifg=#DAD3A9 guibg=#333333
"hi CursorLineNr guifg=#7800f0 guibg=#333431
hi CursorLineNr guifg=#f42069 guibg=#333431


""================ Buffer explorer settings star ================
hi MBENormal          guifg=#8ac5f3 guibg=#333333
hi MBEChanged         guifg=#ff0000 guibg=#333333
hi MBEVisibleChanged  guifg=#ff0000 guibg=#333333
"hi MBEVisibleChanged  guifg=#eeeeee guibg=#4e4e8f

" The file which is visible and active(the curosor is in)
hi MBEVisibleActiveNormal  gui=underline,bold guifg=#05A543 guibg=#333333

" File is visible but not the active one
hi MBEVisibleNormal gui=none guifg=#05A543 guibg=#333333

" Changed and is the active window
hi MBEVisibleActiveChanged gui=underline,bold guifg=#ff0000 guibg=#333333

""================ Buffer explorer settings end ================

""hi Comment	guifg=#80a0ff - original blue
hi Comment	gui=bold guifg=#85929E
hi Constant	guifg=#ffa0a0
"hi Constant	guifg=#0acdc4
hi Special	guifg=Orange
"hi Identifier	guifg=#40ffff cterm=none
"hi Identifier	guifg=#66d9ef cterm=none
hi Identifier	guifg=#39e5e5 cterm=none
hi Statement	none guifg=#EAEA0E gui=none
hi PreProc	guifg=#ff80ff gui=none cterm=none
""hi PreProc	guifg=#6fc9e5 gui=none cterm=none
hi type		guifg=#73D216 gui=none cterm=none
hi Underlined	cterm=underline term=underline
hi Ignore	guifg=bg

" Popup menu
hi Pmenu guifg=#eeeeee guibg=#42428f
hi PmenuSel guifg=#eeeeee guibg=#6D36B2 blend=0
hi PmenuSbar guifg=blue guibg=#AF89BA
hi PmenuThumb guifg=#c0c0c0

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
