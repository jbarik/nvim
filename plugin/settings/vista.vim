" How each level is indented and what to prepend.
" This could make the display more compact or more spacious.
" e.g., more compact: ["▸ ", ""]
" Note: this option only works the LSP executives, doesn't work for `:Vista ctags`.
let g:vista_icon_indent = ["╰─▸ ", "├─▸ "]

" Executive used when opening vista sidebar without specifying it.
" See all the avaliable executives via `:echo g:vista#executives`.
let g:vista_default_executive = 'ctags'

" Set the executive for some filetypes explicitly.
let s:lsp_client = 'nvim_lsp'
if g:use_nvim_lsp == 0
   let s:lsp_client = 'vim_lsp'
end
let g:vista_executive_for = {
  \ 'cpp': s:lsp_client
  \ }

" Declare the command including the executable and options used to generate ctags output
" for some certain filetypes.The file path will be appened to your custom command.
" For example:
"let g:vista_ctags_cmd = {
"      \ 'haskell': 'hasktags -x -o - -c',
"      \ }

" To enable fzf's preview window set g:vista_fzf_preview.
" The elements of g:vista_fzf_preview will be passed as arguments to fzf#vim#with_preview()
" For example:
let g:vista_fzf_preview = ['right:50%']
" Ensure you have installed some decent font to show these pretty symbols, then you can enable icon for the kind.
let g:vista#renderer#enable_icon = 1

" The default icons can't be suitable for all the filetypes, you can extend it as you wish.
" function u2131 - ℱ, variable u58 - X u03f0 ϰ, namespace u26c1 ⛁, u26c3 ⛃
" u26c0 ⛀ ⛂, (method u24d5 ⓕ) (constructor u1455 ᑕ ) (u003f ?) (enum u24ba Ⓔ )
" default u003f ? u2370 ⍰  u+24B8 Ⓒ
" see /home/jbarik/.config/nvim/plugged/vista.vim/autoload/vista/renderer.vim
let g:vista#renderer#icons = {
\   "function": "\u2131",
\   "method": "\u24d5",
\   "variable": "\u58",
\   "namespace": "\u26c1",
\   "constructor": "\u1455",
\   "enummember": "\u24ba",
\   "default": "\u2370"
\  }

" Toggle Vista window
nmap <silent> <F7> :Vista!!<CR>
