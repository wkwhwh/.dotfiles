return {
  "lewis6991/gitsigns.nvim",
  event = { "BufReadPre", "BufNewFile" },
  keys = {
    { "<leader>gp", "<cmd>Gitsigns preview_hunk<CR>" },
    { "<leader>gb", "<cmd>Gitsigns blame_line<CR>" },
    { "<leader>gs", "<cmd>Gitsigns stage_hunk<CR>" },
    { "<leader>gu", "<cmd>Gitsigns undo_stage_hunk<CR>" },
    { "<leader>gr", "<cmd>Gitsigns reset_hunk<CR>" },
    { "]g",         "<cmd>Gitsigns next_hunk<CR>" },
    { "[g",         "<cmd>Gitsigns prev_hunk<CR>" },
  },
  config = true
}
