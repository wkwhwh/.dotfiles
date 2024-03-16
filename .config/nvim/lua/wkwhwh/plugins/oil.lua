return {
  "stevearc/oil.nvim",
  opts = {},
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local oil = require("oil")
    oil.setup({
      float = {
        padding = 2,
        max_width = 100,
        max_height = 40,
        border = "rounded",
        win_options = {
          winblend = 0,
        },
        override = function(conf)
          return conf
        end,
      },
    })

    vim.keymap.set("n", "-", "<cmd>Oil --float<CR>")
  end,


}
