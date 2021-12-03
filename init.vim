" neovim's checkhealth complains about multiple python executables
let g:python_host_prog = '/usr/bin/python2'
let g:python3_host_prog = '/usr/bin/python3'
" Unless we disable mathematic, it overrides matlab files as mma
let g:polyglot_disabled = ['mathematica', 'octave', 'murphi', 'objc']
let g:filetype_m = 'matlab'

filetype plugin indent on
set termguicolors
set mouse=a
set nu            " Line numbers should be shown
set ruler         " Show line number and col number of cursor
set showbreak=↪   " ↳ Type: insertmode ctrl+v u21B3 ⇶  ℱ X
set encoding=utf8 " To show glyphs
" unnamed - PRIMARY(vim calls "*) - select to copy middle mouse button press to paste
" unnamedplus - CLIPBOARD(vim cals it "+) - Ctrl+c, Ctrl+v
set clipboard=unnamed,unnamedplus
" see haya14busa/vim-poweryank plugin for tmux+vim fix
"set clipboard+=unnamedplus
"Don't jump to newline after column 80
"set textwidth=0 "autocmd FileType vim set textwidth=0

let mapleader=","
" Simulink uses @ in dir/file name
set isfname+=@-@
" I use = to surround file-paths in org files
set isfname-==

" ================ Indention =================================================
set softtabstop=3 " Make Vim treat <Tab> key as 3 spaces, but respect hard Tabs.
set shiftwidth=3

" :help cinoptions-values N-s no indent inside namespaces
set cino+=(0,W3,N-s
"set cindent
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

" ================ Fold ======================================================
set nofoldenable " disable folds

" ================ Path ======================================================
"  First val is current working dir :pwd
"  2nd   val is the dir of the current file
set path=,,.,/usr/include

"================= Python Code ===============================================
python3 << EOF
import os, re, vim
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

" https://github.com/kristijanhusak/vim-packager
" Load packager only when you need it
"
" To update selected packages
" PackagerUpdate {'plugins': ['fzf.vim', 'vim-packager']}
" To use a particular branch call packager#add('xxx', {'branch': 'tree-sitter'})
function! PackagerInit() abort
   packadd vim-packager
   call packager#init()

   call packager#add('junegunn/vim-easy-align')
   call packager#add('justinmk/vim-sneak')
   call packager#add('justinmk/vim-gtfo')
   call packager#add('tpope/vim-obsession')
   call packager#add('tpope/vim-surround')
   call packager#add('fholgado/minibufexpl.vim')

   call packager#add('nvim-treesitter/nvim-treesitter')
   call packager#add('lukas-reineke/headlines.nvim')
   call packager#add('kristijanhusak/orgmode.nvim')
   call packager#add('akinsho/org-bullets.nvim')
   call packager#add('jubnzv/mdeval.nvim')

   call packager#add('nvim-lualine/lualine.nvim')
   call packager#add('kyazdani42/nvim-web-devicons')
   call packager#add('nfvs/vim-perforce')

   " This is for code snippets, header guard
   call packager#add('mbbill/code_complete')
   call packager#add('sheerun/vim-polyglot')
   call packager#add('bfrg/vim-cpp-modern')

   " LSP setup. The following pages can help
   " https://github.com/aktau/dotfiles/blob/master/.vimrc
   "  - www.reddit.com/r/neovim/comments/gxcbui/in_built_lsp_is_amazing/
   "  - www.reddit.com/r/neovim/comments/h0ndj0/to_those_who_have_integrated_lsp_functionality
   "  - www.reddit.com/r/neovim/comments/gy8ko7/question_how_to_get_more_readable_error_messages
   "  - www.reddit.com/r/neovim/comments/hba6yb/coc_neovim_lua_completion_source
   call packager#add('prabirshrestha/vim-lsp')

   " Latest YCM uses(clangd) glibcxx version *.26. Our machine doesn't have that
   " strings /usr/lib/x86_64-linux-gnu/libstdc++.so.6 | grep GLIBC
   call packager#add('ycm-core/YouCompleteMe', {'commit': '7c4d05375a09a871f618f9688c7af517d4e69b76'})
   call packager#add('m-pilia/vim-ccls')
   call packager#add('liuchengxu/vista.vim')
   call packager#add('neovim/nvim-lspconfig')
   call packager#add('williamboman/nvim-lsp-installer')

   call packager#add('hrsh7th/nvim-cmp')
   call packager#add('hrsh7th/cmp-nvim-lsp')
   call packager#add('hrsh7th/cmp-buffer')
   call packager#add('hrsh7th/cmp-path')
   call packager#add('hrsh7th/cmp-nvim-lua')
   call packager#add('hrsh7th/cmp-calc')
   call packager#add('dmitmel/cmp-vim-lsp')
   call packager#add('ray-x/lsp_signature.nvim')

   "call packager#add('glepnir/lspsaga.nvim')
   "call packager#add('nvim-lua/diagnostic-nvim')
   "call packager#add('nvim-treesitter/nvim-treesitter')
   "call packager#add('nvim-treesitter/completion-treesitter')
   "call packager#add('nvim-lua/lsp-status.nvim')

   call packager#add('junegunn/fzf', {'do': './install --all && ln -s $(pwd) ~/.fzf'})
   call packager#add('junegunn/fzf.vim')
   call packager#add('gfanto/fzf-lsp.nvim')

   "call packager#add('nvim-lua/popup.nvim')
   "call packager#add('nvim-lua/plenary.nvim')
   "call packager#add('nvim-telescope/telescope.nvim')
   "call packager#add('camspiers/snap')

   call packager#add('justinmk/vim-gtfo')
   call packager#add('justinmk/vim-dirvish')
   call packager#add('roginfarrer/vim-dirvish-dovish')
   call packager#add('vim-scripts/DrawIt')
   call packager#add('troydm/zoomwintab.vim')
endfunction

command! PackagerInstall call PackagerInit() | call packager#install()
command! -bang PackagerUpdate call PackagerInit() | call packager#update({ 'force_hooks': '<bang>' })
command! PackagerClean call PackagerInit() | call packager#clean()
command! PackagerStatus call PackagerInit() | call packager#status()

" Highlight on yank
au TextYankPost * lua vim.highlight.on_yank {higroup="IncSearch", timeout=1000, on_visual=true}

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

" To debug/profile vim uncomment the following line and then :set verbose=15
" set verbosefile=vimlog.txt

" "========================================================
" " copy to attached terminal using the yank(1) script:
" " https://github.com/sunaku/home/blob/master/bin/yank
" function! Yank(text) abort
"   let escape = system('yank', a:text)
"   if v:shell_error
"     echoerr escape
"   else
"     call writefile([escape], '/dev/tty', 'b')
"   endif
" endfunction
"
" " automatically run yank(1) whenever yanking in Vim
" " (this snippet was contributed by Larry Sanderson)
" function! CopyYank() abort
"   call Yank(join(v:event.regcontents, "\n"))
" endfunction
" autocmd TextYankPost * call CopyYank()
" "========================================================

" Don't load netrw
let loaded_netrwPlugin = 1

" ===== Start: Experiment with plugins =========================================================
"if stridx(working_dir, '/mathworks/devel/sbs/') == 0 || stridx(working_dir, '/sandbox/') == 0

let g:use_ycm = 0
if isdirectory(working_dir . '/.sbtools/sbcpptags/ccls')
   let g:local_sb = 1
   let g:loaded_youcompleteme = 1
else
   let g:local_sb = 0
   let g:use_ycm = 1
   "let g:loaded_youcompleteme = 1
end

" nvim-lsp setting. The following line will source ./lua/lsp_init.lua
let g:use_nvim_lsp = 1
if g:use_nvim_lsp == 1
   lua require 'lsp_init'
end
" ===== End: Experiment with plugins ===========================================================


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
