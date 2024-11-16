return {
  "NeogitOrg/neogit",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "sindrets/diffview.nvim",
    "nvim-telescope/telescope.nvim",
  },
  config = function()
    local neogit = require("neogit")
    neogit.setup({
      console_timeout = 10000,
      disable_hint = true,
      graph_style = "kitty",
      signs = {
        section = { "", "" },
        item = { "", "" },
      },
    })

    vim.keymap.set("n", "<leader>gg", "<cmd>Neogit<cr>")
  end,
}
