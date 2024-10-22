return {
  "folke/trouble.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  opts = {},
  config = function()
    local trouble = require("trouble")
    trouble.setup()
    -- Lua
    vim.keymap.set("n", "<leader>xD", "<cmd>Trouble diagnostics toggle<cr>")
    vim.keymap.set("n", "<leader>xd", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>")
    vim.keymap.set("n", "<leader>xs", "<cmd>Trouble symbols toggle focus=false<cr>")
    vim.keymap.set("n", "<leader>xl", "<cmd>Trouble loclist toggle focus=true<cr>")
    vim.keymap.set("n", "<leader>xq", "<cmd>Trouble qflist toggle focus=true<cr>")
  end
}
