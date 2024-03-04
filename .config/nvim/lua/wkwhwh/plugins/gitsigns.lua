return {
  "lewis6991/gitsigns.nvim",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local gitsigns = require("gitsigns")
    gitsigns.setup {}
    vim.keymap.set("n", "<leader>hd", "<cmd>Gitsigns preview_hunk<CR>")
    vim.keymap.set("n", "<leader>hb", "<cmd>Gitsigns blame_line<CR>")
    vim.keymap.set("n", "<leader>hs", "<cmd>Gitsigns stage_hunk<CR>")
    vim.keymap.set("n", "<leader>hu", "<cmd>Gitsigns undo_stage_hunk<CR>")
    vim.keymap.set("n", "<leader>hr", "<cmd>Gitsigns reset_hunk<CR>")
    vim.keymap.set("n", "]h", "<cmd>Gitsigns next_hunk<CR>")
    vim.keymap.set("n", "[h", "<cmd>Gitsigns prev_hunk<CR>")
  end,
}
