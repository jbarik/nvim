" Following settings for concel is required for links to work properly
autocmd FileType norg setlocal conceallevel=2 | setlocal concealcursor=nc

hi norgHeadline1 guifg=#e692fc
hi norgHeadline2 guifg=#64b5f6
hi norgHeadline3 guifg=#cbcb6f
hi norgHeadline4 guifg=#90d56e
hi norgHeadline5 guifg=#F06292
hi norgHeadline6 guifg=#57d2fb
hi norgHeadline7 guifg=#87CEEB
hi norgTodoDone  guifg=#58d68d

" ⌚ ⌛ ⧗ ⛞  ⛔  ✓  × ? ❓ ❗✘  ⛒  ⏰

lua << EOF

require('neorg').setup({
    load = {
        ["core.defaults"] = {},
        ["core.norg.completion"] = {
          config = {
            engine = "nvim-cmp",
          },
        },
        --["core.integrations.nvim-cmp"] = {},
        ["core.norg.concealer"] = {
           config = {
               --icon_preset = "diamond",
               icons = {
                  todo = {
                     done = {
                        icon = "✔",
                        highlight = "NeorgTodoItemDoneMark",
                        },
                     pending = {
                        icon = "⏱",
                        highlight = "NeorgTodoItemPendingMark",
                        },
                     undone = {
                        icon = "↻",
                        highlight = "NeorgTodoItemUndoneMark",
                        },
                     uncertain = {
                        icon = "?",
                        highlight = "NeorgTodoItemUncertainMark",
                        },
                     on_hold = {
                        icon = "⇢",
                        highlight = "NeorgTodoItemOnHoldMark",
                        },
                     cancelled = {
                        icon = "✖",
                        highlight = "NeorgTodoItemCancelledMark",
                        },
                     urgent = {
                        icon = "!",
                        highlight = "NeorgTodoItemUrgentMark",
                        }
                     },
                  },
               },
        },
        ["core.highlights"] = {
            config = {
                highlights = {
                   Heading = {
                      ["1"] = {Title = "+norgHeadline1", Prefix = "+norgHeadline1"},
                      ["2"] = {Title = "+norgHeadline2", Prefix = "+norgHeadline2"},
                      ["3"] = {Title = "+norgHeadline3", Prefix = "+norgHeadline3"},
                      ["4"] = {Title = "+norgHeadline4", Prefix = "+norgHeadline4"},
                      ["5"] = {Title = "+norgHeadline5", Prefix = "+norgHeadline5"},
                      ["6"] = {Title = "+norgHeadline6", Prefix = "+norgHeadline6"},
                   },
                },
            },
        },
    }
})

require('nvim-treesitter.configs').setup({
    ensure_installed = { "norg", --[[ other parsers you would wish to have ]] },
    highlight = { -- Be sure to enable highlights if you haven't!
        enable = true,
    }
})

EOF
