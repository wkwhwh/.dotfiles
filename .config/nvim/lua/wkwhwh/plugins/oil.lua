return {
  "stevearc/oil.nvim",
  opts = {},
  -- Optional dependencies
  dependencies = { "nvim-tree/nvim-web-devicons" },
  keys = {
    { "-", "<cmd>Oil --float<CR>", desc = "Open parent directory" }
  },
  config = function()
    local oil = require("oil")
    oil.setup({
      float = {
        -- Padding around the floating window
        padding = 2,
        max_width = 100,
        max_height = 40,
        border = "rounded",
        win_options = {
          winblend = 0,
        },
        -- This is the config that will be passed to nvim_open_win.
        -- Change values here to customize the layout
        override = function(conf)
          return conf
        end,
      },
    })
  end,


}
