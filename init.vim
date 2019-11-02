" https://vim.fandom.com/wiki/Configuring_the_cursor
" https://vi.stackexchange.com/questions/9131/i-cant-switch-to-cursor-in-insert-mode
"  1 is the blinky block cursor
"  2 is the default (non-blinky) block cursor
"  3 is blinky underscore
"  4 fixed underscore
"  5 pipe bar (blinking)
"  6 fixed pipe bar`
set guicursor=n-v-c:blinkon100
set guicursor+=i:ver100-iCursor
set termguicolors

"Don't jump to newline after column 80
"set textwidth=0 "autocmd FileType vim set textwidth=0

set mouse=a
let mapleader=","

" To show glyphs
set encoding=utf8

set nu          " Line numbers should be shown
set ruler       " Show line number and col number of cursor
set showbreak=↪

" ================ Indention ==================================================
set cindent shiftwidth=3
set softtabstop=3 " Make Vim treat <Tab> key as 3 spaces, but respect hard Tabs.
set shiftwidth=3
set expandtab     " Turn Tab keypresses into spaces. You can still insert
                  " real Tabs as [Ctrl]-V [Tab]

" ================ Swap Files ==================================================
set noswapfile
set nobackup
set nowb

" ================ Search ====================================================
set hlsearch   " Highlight search
set ic         " Ignore case
set incsearch  " Find the next match as we type the search
set smartcase  " ... Unless we type a capital

" ================ Popup menu =================================================
" Set the transparency of popup to 15. 0-opaque 100-fully transparent
set pumblend=15
" Make the selected item completely opaque. See the colorschem file
"hi PmenuSel blend=0

" ================ Completion =================================================
" wildmode list::longest,full expands the suggestions in
" command line
set completeopt=menu,menuone,longest,preview
set wildmenu
set wildmode=list:longest,full

filetype plugin indent on
syntax enable

" =========== Enable omni completion ============================================
set omnifunc=syntaxcomplete#Complete
autocmd FileType css           setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript    setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python        setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml           setlocal omnifunc=xmlcomplete#CompleteTags


" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.config/nvim/plugged')

" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
Plug 'junegunn/vim-easy-align'
Plug 'easymotion/vim-easymotion'
Plug 'tpope/vim-obsession'

Plug 'Shougo/denite.nvim'

Plug 'fholgado/minibufexpl.vim'
Plug 'itchyny/lightline.vim' | Plug 'maximbaz/lightline-trailing-whitespace'

Plug 'ycm-core/YouCompleteMe'

" Initialize plugin system
call plug#end()

colorscheme adonis
