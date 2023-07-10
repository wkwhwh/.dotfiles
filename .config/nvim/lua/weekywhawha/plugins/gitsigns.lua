local setup, gitsigns = pcall(require, "gitsigns")
if not setup then
  return
end

local keymap = vim.keymap

gitsigns.setup({
  trouble = true,
})

keymap.set("n", "<leader>hd", "<cmd>Gitsigns preview_hunk_inline<CR>")
keymap.set("n", "<leader>hb", "<cmd>Gitsigns blame_line<CR>")
keymap.set("n", "<leader>tb", "<cmd>Gitsigns toggle_current_line_blame<CR>")
keymap.set("n", "<leader>tw", "<cmd>Gitsigns toggle_word_diff<CR>")
keymap.set("n", "<leader>hs", "<cmd>Gitsigns stage_hunk<CR>")
keymap.set("n", "<leader>hS", "<cmd>Gitsigns stage_buffer<CR>")
keymap.set("n", "]h", "<cmd>Gitsigns next_hunk<CR>")
keymap.set("n", "[h", "<cmd>Gitsigns prev_hunk<CR>")
keymap.set("n", "<leader>xh", "<cmd>Gitsigns setqflist<CR>") -- use trouble
