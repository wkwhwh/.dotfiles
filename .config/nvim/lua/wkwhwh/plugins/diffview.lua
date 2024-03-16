return {
  "sindrets/diffview.nvim",
  config = function()
    local diffview = require("diffview")
    diffview.setup({
      merge_tool = {
        layout = "diff3_mixed",
      },
      keymaps = {
        file_history_panel = { q = '<Cmd>DiffviewClose<CR>' },
        file_panel = { q = '<Cmd>DiffviewClose<CR>' },
        view = { q = '<Cmd>DiffviewClose<CR>' },
      },
    })

    vim.keymap.set("n", "<leader>dv", "<cmd>DiffviewOpen<cr>")
    vim.keymap.set("n", "<leader>dh", "<cmd>DiffviewFileHistory %<cr>")
    vim.keymap.set("n", "<leader>dH", "<cmd>DiffviewFileHistory<cr>")
  end,
}
