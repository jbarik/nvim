filetype plugin indent on
set termguicolors
set mouse=a
" unnamed - PRIMARY(vim calls "*) - select to copy middle mouse button press to paste
" unnamedplus - CLIPBOARD(vim cals it "+) - Ctrl+c, Ctrl+v
set clipboard=unnamed,unnamedplus
"set clipboard+=unnamedplus
"Don't jump to newline after column 80
"set textwidth=0 "autocmd FileType vim set textwidth=0

let mapleader=","

"================= Python Code ===============================================

python3 << EOF
import os, re, vim
#working_dir = "/local-ssd/jbarik/Bmasklib.latest_pass/";
#base_dir = "Bmasklib.latest_pass";
working_dir = os.getcwd();
base_dir = os.path.basename(os.path.normpath((working_dir)));

re_expression = r"(/.*)(/matlab/+.*)";
p = re.compile(re_expression);
m = p.match(working_dir);
if m is not None:
   working_dir = m.group(1);
   base_dir = os.path.basename(os.path.normpath(m.group(1)));

vim.command("let base_dir = '%s'"% base_dir);
vim.command("let working_dir = '%s'"% working_dir);
#print("Base directory is:", base_dir);
#print("Working directory is:", working_dir);

EOF

"=============================================================================

" To show glyphs
set encoding=utf8

set nu          " Line numbers should be shown
set ruler       " Show line number and col number of cursor
set showbreak=↪ " ↳ Type: insertmode ctrl+v u21B3 ⇶  ℱ X

" ================ Indention =================================================
set cindent shiftwidth=3
set softtabstop=3 " Make Vim treat <Tab> key as 3 spaces, but respect hard Tabs.
set shiftwidth=3
set expandtab     " Turn Tab keypresses into spaces. You can still insert
                  " real Tabs as [Ctrl]-V [Tab]

" ================ Swap Files ================================================
set noswapfile
set nobackup
set nowb

" ================ Search ====================================================
set hlsearch   " Highlight search
set ic         " Ignore case
set incsearch  " Find the next match as we type the search
set smartcase  " ... Unless we type a capital

" ================ Popup menu ================================================
" Set the transparency of popup to 15. 0-opaque 100-fully transparent
set pumblend=15
" Make the selected item completely opaque. See the colorschem file
"hi PmenuSel blend=0

" ================ Completion ================================================
" wildmode list::longest,full expands the suggestions in
" command line
"set completeopt=menu,menuone,longest,preview
"set completeopt=menu,menuone,longest,previewpopup
set completeopt=noinsert,menuone,noselect

set wildmenu
set wildmode=list:longest,full

" ================ Fold ======================================================
set nofoldenable " disable folds

" ================ Path ======================================================
"  First val is current working dir :pwd
"  2nd   val is the dir of the current file
set path=,,.,/usr/include

" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.config/nvim/plugged')

" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
Plug 'junegunn/vim-easy-align'
Plug 'easymotion/vim-easymotion'

Plug 'tpope/vim-obsession'
Plug 'fholgado/minibufexpl.vim'
Plug 'jceb/vim-orgmode' | Plug 'tpope/vim-speeddating'

" See https://github.com/rbong/vim-crystalline
Plug 'itchyny/lightline.vim'| Plug 'maximbaz/lightline-trailing-whitespace'

Plug 'w0rp/ale'
Plug 'm-pilia/vim-ccls'
Plug 'nfvs/vim-perforce'
Plug 'danro/rename.vim'
" This is for code snippets, header guard
Plug 'mbbill/code_complete'
Plug 'sheerun/vim-polyglot'
Plug 'ycm-core/YouCompleteMe'
Plug 'prabirshrestha/vim-lsp'
Plug 'prabirshrestha/async.vim'
"Plug 'prabirshrestha/asyncomplete.vim'
"Plug 'prabirshrestha/asyncomplete-lsp.vim'
Plug 'liuchengxu/vista.vim'

Plug 'neovim/nvim-lsp'

" See https://github.com/ncm2/ncm2
Plug 'ncm2/ncm2'
Plug 'roxma/nvim-yarp'
Plug 'ncm2/ncm2-vim-lsp'
Plug 'ncm2/float-preview.nvim'

Plug 'ncm2/ncm2-path'
Plug 'ncm2/ncm2-bufword'
Plug 'fgrsnau/ncm2-otherbuf'

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

Plug 'vim-scripts/DrawIt'

call plug#end()

"When the <Enter> key is pressed while the popup menu is visible, it only
"hides the menu. Use this mapping to close the menu and also start a new
"line.
inoremap <expr> <CR> (pumvisible() ? "\<c-y>\<cr>" : "\<CR>")

"let g:loaded_youcompleteme = 1

"" filetype plugin indent on
"" syntax enable

colorscheme afrodite
set guifont=Monospace\ 12
"set guifont=Monospace\ /12/-1/5/63/0/0/0/1/0
" font family (Monospace)
" point size (12)
" pixel size (-1 = default)
" style hint (what to do if requested family can't be found; 5=AnyStyle=default)
" weight (50=normal, 25=light, 63=semibold, 75=bold, 87=black)
" italic  (0=no)
" underline (0=no)
" strikeout (0=no)
" fixedPitch (1=yes)
" raw (0=no)

" https://vim.fandom.com/wiki/Configuring_the_cursor
" https://vi.stackexchange.com/questions/9131/i-cant-switch-to-cursor-in-insert-mode
"  1 is the blinky block cursor
"  2 is the default (non-blinky) block cursor
"  3 is blinky underscore
"  4 fixed underscore
"  5 pipe bar (blinking)
"  6 fixed pipe bar
" Foreground color setting for cursor doesn't work see:
" https://github.com/neovim/neovim/issues/6591
set guicursor=n-v-c:block-blinkon100-Cursor
set guicursor+=i:ver100-blinkon100-iCursor

augroup custom_term
   autocmd!
   autocmd TermOpen * setlocal bufhidden=hide
augroup END

" Check and update if file has changed outsite vim
autocmd BufEnter,FocusGained * checktime

" nvim-lsp setting. The following line will source ./lua/lsp_init.lua
let g:use_nvim_lsp = 0
lua require 'lsp_init'

"https://jeffkreeftmeijer.com/vim-16-color/
"
" Normal - Black
let g:terminal_color_0  = '#2e3436'
" Normal - Red
let g:terminal_color_1  = '#ed4c4c'
" Normal - Green
let g:terminal_color_2  = '#6bb91f'
" Normal -Yellow
let g:terminal_color_3  = '#ffff66'
" Normal - Blue
let g:terminal_color_4  = '#81a7d7'
" Normal - Purple
let g:terminal_color_5  = '#b55ef1'
" Normal - Cyan
let g:terminal_color_6  = '#0daab3'
" Normal - White
let g:terminal_color_7  = '#e0e3dd'
"
" Bright - Black   8
" Bright - Red     9
" Bright - Green  10
" Bright - Yellow 11
" Bright - Blue   12
" Bright - Cyan   14
" Bright - White  15
let g:terminal_color_8  = '#555753'
let g:terminal_color_9  = '#ef2929'
let g:terminal_color_10 = '#8ae234'
let g:terminal_color_11 = '#fce94f'
let g:terminal_color_12 = '#729fcf'
" Bright - Purple 13
let g:terminal_color_13 = '#f15ee4'
let g:terminal_color_14 = '#00f5e9'
let g:terminal_color_15 = '#eeeeec'
"let g:terminal_color_0  = '#2e3436'
"let g:terminal_color_1  = '#cc0000'
"let g:terminal_color_2  = '#4e9a06'
"let g:terminal_color_3  = '#c4a000'
"let g:terminal_color_4  = '#3465a4'
"let g:terminal_color_5  = '#75507b'
"let g:terminal_color_6  = '#0b939b'
"let g:terminal_color_7  = '#d3d7cf'
"let g:terminal_color_13 = '#ad7fa8'
