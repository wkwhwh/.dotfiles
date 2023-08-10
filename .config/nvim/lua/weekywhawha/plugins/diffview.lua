local setup, diffview = pcall(require, "diffview")
if not setup then
  return
end

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
