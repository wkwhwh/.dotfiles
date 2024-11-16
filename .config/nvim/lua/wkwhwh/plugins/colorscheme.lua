return {
  {
    "rebelot/kanagawa.nvim",
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
      local kanagawa = require("kanagawa")
      kanagawa.setup({
        transparent = true,
        colors = {
          theme = {
            all = {
              ui = {
                bg_gutter = "none"
              }
            }
          }
        },
        overrides = function(colors)
          local theme = colors.theme
          return {
            TelescopeTitle = { fg = theme.ui.special, bold = true },
            TelescopePromptBorder = { fg = theme.ui.bg_p2, bg = "none" },
            TelescopeResultsBorder = { fg = theme.ui.bg_p2, bg = "none" },
            TelescopePreviewBorder = { fg = theme.ui.bg_p2, bg = "none" },
            NormalFloat = { bg = "none" },
            FloatTitle = { bg = "none" },
            FloatBorder = { bg = "none" },
            Pmenu = { fg = theme.ui.shade0, bg = theme.ui.bg_p1, blend = vim.o.pumblend },
            PmenuSel = { fg = "none", bg = theme.ui.bg_p2 },
            PmenuSbar = { bg = theme.ui.bg_m1 },
            PmenuThumb = { bg = theme.ui.bg_p2 },
          }
        end,
      })

      -- load the colorscheme here
      vim.cmd([[colorscheme kanagawa-dragon]])
    end,
  },
}
