return {
  {
    "rebelot/kanagawa.nvim",
    priority = 1000,
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
            NormalFloat = { bg = "none" },
            FloatTitle = { bg = "none" },
            FloatBorder = { fg = theme.ui.bg_p2, bg = "none" },
            BlinkCmpMenu = { fg = theme.ui.shade0, bg = theme.ui.bg_p1 },
            BlinkCmpMenuBorder = { fg = theme.ui.bg_p2, bg = theme.ui.bg_p1 },
            BlinkCmpMenuSelection = { bg = theme.ui.bg_search },
            BlinkCmpScrollBarThumb = { bg = theme.ui.bg_p2 },
            BlinkCmpScrollBarGutter = { bg = theme.ui.bg_m1 },
            BlinkCmpKind = { fg = theme.ui.special },
            BlinkCmpDoc = { fg = theme.ui.shade0, bg = theme.ui.bg_p1 },
            BlinkCmpDocBorder = { fg = theme.ui.bg_p2, bg = theme.ui.bg_p1 },
            BlinkCmpDocCursorLine = { bg = theme.ui.bg_search },
            BlinkCmpSignatureHelp = { bg = "none" },
            BlinkCmpSignatureHelpBorder = { fg = theme.ui.bg_p2, bg = "none" },
          }
        end,
      })

      vim.cmd([[colorscheme kanagawa-dragon]])
    end,
  },
}
