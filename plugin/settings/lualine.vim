lua << EOF
-- =============================================================================
-- Genarated by lightline to lualine theme converter
--   https://gist.github.com/shadmansaleh/000871c9a608a012721c6acc6d7a19b9
-- License: MIT License
-- =============================================================================
local colors = {
  dark_gray= "#282c34",
  color5   = "#e06c75",
  color8   = "#61afef",
  color9   = "#5c6370",
  color10  = "#2c323d",
  color11  = "#98c379",
  color14  = "#c678dd",
  color0   = "#abb2bf",
  color1   = "#3e4452",
  yellow   = "#dadb73",
  red      = "#F8536B",
  cyan1    = "#53F8E0",
  cyan2    = "#3FE4CC",
}

local lightline_one = {
  replace = {
    b = { fg = colors.color0, bg = colors.color1 },
    a = { fg = colors.dark_gray, bg = colors.color5 , gui = "bold", },
  },
  insert = {
    b = { fg = colors.color0, bg = colors.color1 },
    a = { fg = colors.dark_gray, bg = colors.color8 , gui = "bold", },
  },
  inactive = {
    b = { fg = colors.color9, bg = colors.dark_gray },
    c = { fg = colors.color9, bg = colors.color10 },
    a = { fg = colors.color9, bg = colors.dark_gray , gui = "bold", },
  },
  normal = {
    b = { fg = colors.color0, bg = colors.color1 },
    c = { fg = colors.color0, bg = colors.color10 },
    a = { fg = colors.dark_gray, bg = colors.color11 , gui = "bold", },
  },
  command = {
    b = { fg = colors.color0, bg = colors.color1 },
    c = { fg = colors.color0, bg = colors.color10 },
    a = { fg = colors.dark_gray, bg = colors.yellow , gui = "bold", },
  },
  visual = {
    b = { fg = colors.color0, bg = colors.color1 },
    a = { fg = colors.dark_gray, bg = colors.color14 , gui = "bold", },
  },
}

local function trailing_space()
  return vim.fn.search([[\s\+$]], 'nw') ~= 0 and 'Trailing space' or ''
end
-- trailing space component
local TS = {
   trailing_space,
   color = { bg=colors.red, fg=colors.dark_gray, gui='bold' },
   }

require'lualine'.setup{
options = {
        theme = lightline_one,
        section_separators = { left = '', right = ''},
        component_separators = { left = '', right = ''},
        },

sections = {
        lualine_a = {'mode'},
        lualine_b = {'filename'},
        lualine_c = {},
        lualine_x = {},
        lualine_y = {TS},
        lualine_z = {'progress','location'},
        },
}
EOF

" unicode symbols
" let g:airline_left_sep = '»'
" let g:airline_left_sep = '▶'
" let g:airline_right_sep = '«'
" let g:airline_right_sep = '◀'
" let g:airline_symbols.linenr = '␊'
" let g:airline_symbols.linenr = '␤'
" let g:airline_symbols.linenr = '¶'
" let g:airline_symbols.branch = '⎇'
" let g:airline_symbols.paste = 'ρ'
" let g:airline_symbols.paste = 'Þ'
" let g:airline_symbols.paste = '∥'
" let g:airline_symbols.whitespace = 'Ξ'
" '' ''
