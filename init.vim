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
set softtabstop=3 " Make Vim treat <Tab> key as 3 spaces, but respect hard Tabs.
set shiftwidth=3
set cindent
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
"set completeopt=menu,menuone,longest,preview
"set completeopt=menu,menuone,longest,previewpopup
set completeopt=noinsert,menuone,noselect

" wildmode list::longest,full expands the suggestions in
" command line
set wildmode=list:longest,full
set wildmenu

" Makes floating PopUpMenu for completing stuff on the command line.
"     Very similar to completing in insert mode.
"set wildoptions+=pum

" ================ Fold ======================================================
set nofoldenable " disable folds

" ================ Path ======================================================
"  First val is current working dir :pwd
"  2nd   val is the dir of the current file
set path=,,.,/usr/include

" Load packager only when you need it
function! PackagerInit() abort
   packadd vim-packager
   call packager#init()

   call packager#add('junegunn/vim-easy-align')
   "call packager#add('easymotion/vim-easymotion')
   call packager#add('justinmk/vim-sneak')
   "call packager#add('justinmk/vim-gtfo')
   call packager#add('tpope/vim-obsession')
   call packager#add('tpope/vim-surround')
   call packager#add('fholgado/minibufexpl.vim')

   call packager#add('jceb/vim-orgmode')
   call packager#add('tpope/vim-speeddating')
   call packager#add('vim-scripts/utl.vim')
   call packager#add('inkarkat/vim-SyntaxRange')

   " See https://github.com/rbong/vim-crystalline
   call packager#add('itchyny/lightline.vim')
   call packager#add('maximbaz/lightline-trailing-whitespace')
   call packager#add('nfvs/vim-perforce')
   "Plug 'rhysd/git-messenger.vim'

   call packager#add('w0rp/ale')
   call packager#add('m-pilia/vim-ccls')
   " This is for code snippets, header guard
   call packager#add('mbbill/code_complete')
   call packager#add('sheerun/vim-polyglot')
   call packager#add('bfrg/vim-cpp-modern')
   call packager#add('ycm-core/YouCompleteMe')
   call packager#add('prabirshrestha/vim-lsp')
   call packager#add('prabirshrestha/async.vim')
   call packager#add('liuchengxu/vista.vim')

   call packager#add('neovim/nvim-lsp')
   "call packager#add('nvim-lua/diagnostic-nvim')
   "call packager#add('nvim-lua/completion-nvim')
   "call packager#add('steelsojka/completion-buffers')
   "call packager#add('nvim-treesitter/nvim-treesitter')
   "call packager#add('nvim-treesitter/completion-treesitter')

   call packager#add('ncm2/ncm2')
   call packager#add('roxma/nvim-yarp')
   call packager#add('ncm2/ncm2-vim-lsp')
   call packager#add('ncm2/float-preview.nvim')
   call packager#add('ncm2/ncm2-path')
   call packager#add('ncm2/ncm2-bufword')
   call packager#add('fgrsnau/ncm2-otherbuf')
   call packager#add('junegunn/fzf', {'do': './install --all && ln -s $(pwd) ~/.fzf'})
   call packager#add('junegunn/fzf.vim')

   "call packager#add('kyazdani42/nvim-web-devicons') " for file icons
   "call packager#add('kyazdani42/nvim-tree.lua')
   call packager#add('justinmk/vim-dirvish')
   call packager#add('roginfarrer/vim-dirvish-dovish')

   call packager#add('vim-scripts/DrawIt')
   " Zoom in/out
   call packager#add('troydm/zoomwintab.vim')
   "call packager#add('danro/rename.vim')
   "Plug 'prabirshrestha/asyncomplete.vim'
   "Plug 'prabirshrestha/asyncomplete-lsp.vim'
endfunction

command! PackagerInstall call PackagerInit() | call packager#install()
command! -bang PackagerUpdate call PackagerInit() | call packager#update({ 'force_hooks': '<bang>' })
command! PackagerClean call PackagerInit() | call packager#clean()
command! PackagerStatus call PackagerInit() | call packager#status()

"When the <Enter> key is pressed while the popup menu is visible, it only
"hides the menu. Use this mapping to close the menu and also start a new
"line.
inoremap <expr> <CR> (pumvisible() ? "\<c-y>\<cr>" : "\<CR>")

"let g:loaded_youcompleteme = 1

colorscheme afrodite
set guifont=DejaVu\ Sans\ Mono\ for\ Powerline\ 12
"set guifont=Monospace\ 12
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

" Don't load netrw
let loaded_netrwPlugin = 1

" Unless we disable mathematic, it overrides matlab files as mma
let g:polyglot_disabled = ['mathematica', 'octave', 'murphi', 'objc']
"autocmd BufNewFile,BufRead *.m,*.mlx set syntax=matlab

" nvim-lsp setting. The following line will source ./lua/lsp_init.lua
let g:use_nvim_lsp = 0
lua require 'lsp_init'

"https://jeffkreeftmeijer.com/vim-16-color/
" Normal - Black  0   Bright - Black   8
" Normal - Red    1   Bright - Red     9
" Normal - Green  2   Bright - Green  10
" Normal - Yellow 3   Bright - Yellow 11
" Normal - Blue   4   Bright - Blue   12
" Normal - Purple 5   Bright - Purple 13
" Normal - Cyan   6   Bright - Cyan   14
" Normal - White  7   Bright - White  15
let g:terminal_color_0  = '#2e3436'
let g:terminal_color_1  = '#ed4c4c'
let g:terminal_color_2  = '#6bb91f'
let g:terminal_color_3  = '#ffff66'
let g:terminal_color_4  = '#81a7d7'
let g:terminal_color_5  = '#b55ef1'
let g:terminal_color_6  = '#0daab3'
let g:terminal_color_7  = '#e0e3dd'
let g:terminal_color_8  = '#555753'
let g:terminal_color_9  = '#ef2929'
let g:terminal_color_10 = '#8ae234'
let g:terminal_color_11 = '#fce94f'
let g:terminal_color_12 = '#729fcf'
let g:terminal_color_13 = '#f15ee4'
let g:terminal_color_14 = '#00f5e9'
let g:terminal_color_15 = '#eeeeec'
