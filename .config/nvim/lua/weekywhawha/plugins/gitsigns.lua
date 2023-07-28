local setup, gitsigns = pcall(require, "gitsigns")
if not setup then
  return
end

local keymap = vim.keymap

gitsigns.setup({
  trouble = true,
})

keymap.set("n", "<leader>hd", "<cmd>Gitsigns preview_hunk<CR>")
keymap.set("n", "<leader>hb", "<cmd>Gitsigns blame_line<CR>")
keymap.set("n", "<leader>hs", "<cmd>Gitsigns stage_hunk<CR>")
keymap.set("n", "<leader>hS", "<cmd>Gitsigns stage_buffer<CR>")
keymap.set("n", "<leader>hu", "<cmd>Gitsigns undo_stage_hunk<CR>")
keymap.set("n", "<leader>hr", "<cmd>Gitsigns reset_hunk<CR>")
keymap.set("n", "]h", "<cmd>Gitsigns next_hunk<CR>")
keymap.set("n", "[h", "<cmd>Gitsigns prev_hunk<CR>")
keymap.set("n", "<leader>xh", "<cmd>Gitsigns setqflist<CR>") -- use trouble
