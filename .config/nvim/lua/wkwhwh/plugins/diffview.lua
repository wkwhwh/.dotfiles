return {
  "sindrets/diffview.nvim",
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

    vim.keymap.set("n", "<leader>dv", "<cmd>DiffviewOpen<cr>")          -- open git diff window
    vim.keymap.set("n", "<leader>dh", "<cmd>DiffviewFileHistory %<cr>") -- open git file history window for file
    vim.keymap.set("n", "<leader>dH", "<cmd>DiffviewFileHistory<cr>")   -- open git file history window for branch
  end,
}


-- local setup, diffview = pcall(require, "diffview")
-- if not setup then
--   return
-- end
