return {
  "NeogitOrg/neogit",
  dependencies = {
    "nvim-lua/plenary.nvim",         -- required
    "sindrets/diffview.nvim",        -- optional - Diff integration
    "nvim-telescope/telescope.nvim", -- optional
  },
  config = function()
    local neogit = require("neogit")
    neogit.setup({
      console_timeout = 10000,
      disable_hint = true,
      disable_commit_confirmation = true,
      signs = {
        section = { "", "" },
        item = { "", "" },
      },
    })

    vim.keymap.set("n", "<leader>gg", "<cmd>Neogit<cr>")
  end,
}
