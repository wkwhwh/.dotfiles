-- import gitsigns plugin safely
local setup, gitsigns = pcall(require, "gitsigns")
if not setup then
  return
end

local keymap = vim.keymap

-- configure/enable gitsigns
gitsigns.setup({
  trouble = true,
  _inline2 = true,
  keymaps = {},
  preview_config = {
    border = "rounded"
  },
})

keymap.set("n", "<leader>hd", "<cmd>Gitsigns preview_hunk_inline<CR>")
keymap.set("n", "<leader>hb", "<cmd>Gitsigns blame_line<CR>")
keymap.set("n", "]h", "<cmd>Gitsigns next_hunk<CR>")
keymap.set("n", "[h", "<cmd>Gitsigns prev_hunk<CR>")
keymap.set("n", "<leader>xh", "<cmd>Gitsigns setqflist<CR>") -- use trouble
