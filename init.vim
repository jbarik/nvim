set termguicolors
set mouse=a
" unnamed - PRIMARY (slect to copy middle mouse button press to paste)
" unnamedplus - CLIPBOARD (Ctrl+c, Ctrl+v)
set clipboard+=unnamed
"Don't jump to newline after column 80
"set textwidth=0 "autocmd FileType vim set textwidth=0

let mapleader=","

"================= Python Code ==========================================

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

"========================================================================

" To show glyphs
set encoding=utf8

set nu          " Line numbers should be shown
set ruler       " Show line number and col number of cursor
set showbreak=↪ " ↳ Type: insertmode ctrl+v u21B3

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

" ================ Fold ===================================================
set nofoldenable " disable folds

"" filetype plugin indent on
"" syntax enable
""
"" " =========== Enable omni completion ============================================
"" set omnifunc=syntaxcomplete#Complete
"" autocmd FileType css           setlocal omnifunc=csscomplete#CompleteCSS
"" autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
"" autocmd FileType javascript    setlocal omnifunc=javascriptcomplete#CompleteJS
"" autocmd FileType python        setlocal omnifunc=pythoncomplete#Complete
"" autocmd FileType xml           setlocal omnifunc=xmlcomplete#CompleteTags


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
" This is for code snippets, header guard
Plug 'mbbill/code_complete'
Plug 'sheerun/vim-polyglot'
Plug 'ycm-core/YouCompleteMe'
Plug 'prabirshrestha/vim-lsp'
Plug 'prabirshrestha/async.vim'
"Plug 'prabirshrestha/asyncomplete.vim'
"Plug 'prabirshrestha/asyncomplete-lsp.vim'

Plug 'Shougo/denite.nvim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" Initialize plugin system
call plug#end()


colorscheme adonis
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
set guicursor=n-v-c:block-Cursor
set guicursor+=i:ver100-iCursor
set guicursor+=n-v-c:blinkon100
"set guicursor+=i:blinkwait10
command! -bang -nargs=+ -complete=dir Rag call fzf#vim#ag_raw(<q-args>, {'options': '--delimiter : --nth 4..'}, <bang>0)

augroup custom_term
   autocmd!
   autocmd TermOpen * setlocal bufhidden=hide
augroup END

"https://jeffkreeftmeijer.com/vim-16-color/
"
" Normal - Black
let g:terminal_color_0  = '#2e3436'
" Normal - Red
let g:terminal_color_1  = '#ed4c4c'
" Normal - Green
let g:terminal_color_2  = '#6bb91f'
" Normal -Yellow
let g:terminal_color_3  = '#ffdb41'
" Normal - Blue
let g:terminal_color_4  = '#81a7d7'
" Normal - Purple
let g:terminal_color_5  = '#a353b0'
" Normal - Cyan
let g:terminal_color_6  = '#0daab3'
" Normal - White
let g:terminal_color_7  = '#e0e3dd'
"
" Bright - Black
" Bright - Red
" Bright - Green
" Bright - Yellow
" Bright - Blue
" Bright - Purple
" Bright - Cyan
" Bright - White

"let g:terminal_color_0  = '#2e3436'
"let g:terminal_color_1  = '#cc0000'
"let g:terminal_color_2  = '#4e9a06'
"let g:terminal_color_3  = '#c4a000'
"let g:terminal_color_4  = '#3465a4'
"let g:terminal_color_5  = '#75507b'
"let g:terminal_color_6  = '#0b939b'
"let g:terminal_color_7  = '#d3d7cf'
let g:terminal_color_8  = '#555753'
let g:terminal_color_9  = '#ef2929'
let g:terminal_color_10 = '#8ae234'
let g:terminal_color_11 = '#fce94f'
let g:terminal_color_12 = '#729fcf'
let g:terminal_color_13 = '#ad7fa8'
let g:terminal_color_14 = '#00f5e9'
let g:terminal_color_15 = '#eeeeec'
