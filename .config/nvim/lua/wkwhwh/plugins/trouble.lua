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
    vim.keymap.set("n", "<leader>xp", "<cmd>Trouble lsp toggle focus=false win.position=right<cr>")
    vim.keymap.set("n", "<leader>xl", "<cmd>Trouble loclist toggle<cr>")
    vim.keymap.set("n", "<leader>xq", "<cmd>Trouble qflist toggle<cr>")
  end
}
