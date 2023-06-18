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
keymap.set("n", "]h", "<cmd>Gitsigns next_hunk<CR>")
keymap.set("n", "[h", "<cmd>Gitsigns prev_hunk<CR>")
keymap.set("n", "<leader>xh", "<cmd>Gitsigns setqflist<CR>") -- use trouble
