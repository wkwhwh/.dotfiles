return {
  "sindrets/diffview.nvim",
  keys = {
    { "<leader>dv", "<cmd>DiffviewOpen<cr>" },
    { "<leader>dh", "<cmd>DiffviewFileHistory %<cr>" },
    { "<leader>dH", "<cmd>DiffviewFileHistory<cr>" }
  },
  config = function()
    -- import comment plugin safely
    local diffview = require("diffview")

    local ts_context_commentstring = require("ts_context_commentstring.integrations.comment_nvim")

    -- enable diffview
    diffview.setup({
      merge_tool = {
        -- Config for conflicted files in diff views during a merge or rebase.
        layout = "diff3_mixed",
      },
      keymaps = {
        file_history_panel = { q = '<Cmd>DiffviewClose<CR>' },
        file_panel = { q = '<Cmd>DiffviewClose<CR>' },
        view = { q = '<Cmd>DiffviewClose<CR>' },
      },
    })
  end,
}
