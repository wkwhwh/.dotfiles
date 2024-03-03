return {
  "stevearc/oil.nvim",
  opts = {},
  -- Optional dependencies
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = true,

  vim.keymap.set("n", "<leader>fe", "<cmd>Oil<CR>")
}
