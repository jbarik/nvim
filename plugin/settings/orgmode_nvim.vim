" Following settings for concel is required for links to work properly
autocmd FileType org setlocal conceallevel=2 | setlocal concealcursor=nc

lua << EOF
local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
parser_config.org = {
  install_info = {
    url = 'https://github.com/milisims/tree-sitter-org',
    revision = 'main',
    files = {'src/parser.c', 'src/scanner.cc'},
  },
  filetype = 'org',
}

require'nvim-treesitter.configs'.setup {
  -- If TS highlights are not enabled at all, or disabled via `disable` prop, highlighting will fallback to default Vim syntax highlighting
  highlight = {
    enable = true,
    -- disable = {'org'}, -- Remove this to use TS highlighter for some of the highlights (Experimental)
    additional_vim_regex_highlighting = {'org'}, -- Required since TS highlighter doesn't support all syntax features (conceal)
  },
  ensure_installed = {'org'}, -- Or run :TSUpdate org
}

require('orgmode').setup({
  org_hide_leading_stars = true,
  org_hide_emphasis_markers = true,
  org_todo_keywords = {'TODO', 'WAITING', 'WIP', '|', 'DONE', 'DELEGATED'},
  org_todo_keyword_faces = {
     TODO = ':foreground #fc6a7f :weight bold',
     WAITING = ':foreground #f3af67 :weight bold',
     WIP = ':foreground #f3af67 :weight bold',
     DONE = ':foreground #90d56e :weight bold',
     DELEGATED = ':foreground #90d56e :weight bold'
  }
})

require("org-bullets").setup({
  symbols = {"⦿", "○", "❉","‣","⦾", "•", "✹", "✫"}
  --symbols = {"➊", "➋", "➌","➍","➎","➏", "➐", "➑"}
})

--vim.cmd [[highlight Headline1]]
--vim.fn.sign_define("Headline1", { linehl = "Headline1" })
vim.fn.sign_define("SubHeadline", { linehl = "NormalBG" })

require("headlines").setup {
  org = {
      source_pattern_start = "#%+[bB][eE][gG][iI][nN]_[sS][rR][cC]",
      source_pattern_end = "#%+[eE][nN][dD]_[sS][rR][cC]",
      dash_pattern = "^-----+$",
      headline_pattern = "^%*+",
      headline_signs = { "Headline", "SubHeadline" },
      -- codeblock_sign = "CodeBlock",
      dash_highlight = "Dash",
  },
}

--vim.cmd [[highlight OrgHeading1 guifg=#e692fc]]
--vim.cmd [[highlight OrgHeading2 guifg=#64b5f6]]
--vim.cmd [[highlight OrgHeading3 guifg=#cbcb6f]]
--vim.cmd [[highlight OrgHeading4 guifg=#90d56e]]
--vim.cmd [[highlight OrgHeading5 guifg=#F06292]]
--vim.cmd [[highlight OrgHeading6 guifg=#57d2fb]]
--vim.cmd [[highlight OrgHeading7 guifg=#87CEEB]]
--vim.fn.sign_define("OrgHeading1", { linehl = "OrgHeading1" })
--vim.fn.sign_define("OrgHeading2", { linehl = "OrgHeading2" })
--vim.fn.sign_define("OrgHeading3", { linehl = "OrgHeading3" })
--vim.fn.sign_define("OrgHeading4", { linehl = "OrgHeading4" })
--vim.fn.sign_define("OrgHeading5", { linehl = "OrgHeading5" })
--vim.fn.sign_define("OrgHeading6", { linehl = "OrgHeading6" })
--vim.fn.sign_define("OrgHeading7", { linehl = "OrgHeading7" })
--require("headlines").setup {
--    org = {
--        headline_signs = {"OrgHeading1","OrgHeading2","OrgHeading3","OrgHeading4","OrgHeading5","OrgHeading6","OrgHeading7"},
--    },
--}

EOF

" Hiding hyperlink (conceal feature) has got some issues Go to org.vim file in syntax/after folder in the plugins code
" You'll see the folloing code
" /home/jbarik/.config/nvim/pack/packager/start/orgmode.nvim/syntax/org.vim
"
"syntax match hyperlink	"\[\{2}[^][]*\(\]\[[^][]*\)\?\]\{2}" contains=hyperlinkBracketsLeft,hyperlinkURL,hyperlinkBracketsRight
"
" replace that line with
" syntax match org_hyperlink	"\[\{2}[^][]*\(\]\[[^][]*\)\?\]\{2}" contains=org_hyperlinkBracketsLeft,org_hyperlinkURL,org_hyperlinkBracketsRight containedin=OrgHeadlineLevel1,OrgHeadlineLevel2,OrgHeadlineLevel3,OrgHeadlineLevel4,OrgHeadlineLevel5
hi OrgHeadlineLevel1 guifg=#e692fc
hi OrgHeadlineLevel2 guifg=#64b5f6
hi OrgHeadlineLevel3 guifg=#cbcb6f
hi OrgHeadlineLevel4 guifg=#90d56e
hi OrgHeadlineLevel5 guifg=#F06292
hi OrgHeadlineLevel6 guifg=#57d2fb
hi OrgHeadlineLevel7 guifg=#87CEEB
