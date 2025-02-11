-- set leader key to space
vim.g.mapleader = " "

-- remap backtick to single quote
vim.keymap.set("n", "`", "'", { noremap = true })

-- better up/down
vim.keymap.set({ "n", "x" }, "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
vim.keymap.set({ "n", "x" }, "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })

-- buffers navigation
vim.keymap.set("n", "[b", "<cmd>bprevious<cr>")
vim.keymap.set("n", "]b", "<cmd>bnext<cr>")
vim.keymap.set("n", "<leader>bd", "<cmd>bdelete<cr>")
vim.keymap.set("n", "<leader>bD", "<cmd>bdelete!<cr>")
vim.keymap.set("n", "<leader>bo", "<cmd>%bd | e # | bd#<cr>")
vim.keymap.set("n", "<leader>bc", "<cmd>%bd | Alpha | bd#<cr>")
vim.keymap.set("n", "<leader>bb", "<cmd>e #<cr>")

vim.keymap.set({ "n", "i", "v", "x" }, "<MiddleMouse>", "<Nop>", { noremap = true, silent = true })

-- clear search highlights
vim.keymap.set({ "i", "n" }, "<esc>", "<cmd>noh<cr><esc>")

-- delete single character without copying into register
vim.keymap.set("n", "x", '"_x')
vim.keymap.set("n", "X", '"_X')

-- append line below to current line without moving cursor
vim.keymap.set("n", "J", ":let p=getpos('.')<bar>join<bar>call setpos('.', p)<CR>", { silent = true })

-- half page jump keep cursor in the middle
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- cycle search terms keep cursor in the middle
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- preserve buffer while pasting
vim.keymap.set("x", "<leader>p", '"_dP')

-- yank into system clipboard
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

-- delete to void register
vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

-- tabs
vim.keymap.set("n", "<leader>tl", "<cmd>tablast<cr>")
vim.keymap.set("n", "<leader>to", "<cmd>tabonly<cr>")
vim.keymap.set("n", "<leader>tf", "<cmd>tabfirst<cr>")
vim.keymap.set("n", "<leader>tt", "<cmd>tabnew<cr>")
vim.keymap.set("n", "]t", "<cmd>tabnext<cr>")
vim.keymap.set("n", "<leader>td", "<cmd>tabclose<cr>")
vim.keymap.set("n", "[t", "<cmd>tabprevious<cr>")
