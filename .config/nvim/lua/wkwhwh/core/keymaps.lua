-- set leader key to space
vim.g.mapleader = " "

local keymap = vim.keymap

-- better up/down
keymap.set({ "n", "x" }, "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
keymap.set({ "n", "x" }, "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })

-- buffers navigation
keymap.set("n", "[b", "<cmd>bprevious<cr>")
keymap.set("n", "]b", "<cmd>bnext<cr>")
keymap.set("n", "<leader>bd", "<cmd>bdelete<cr>")
keymap.set("n", "<leader>bD", "<cmd>bdelete!<cr>")
keymap.set("n", "<leader>bo", "<cmd>%bd <bar> e# <bar> bd #<cr>")

keymap.set({ "n", "i", "v", "x" }, "<MiddleMouse>", "<Nop>", { noremap = true, silent = true })

-- clear search highlights
keymap.set({ "i", "n" }, "<esc>", "<cmd>noh<cr><esc>")

-- delete single character without copying into register
keymap.set("n", "x", '"_x')
keymap.set("n", "X", '"_X')

-- move highlighted selection
keymap.set("v", "<C-j>", ":m '>+1<CR>gv=gv")
keymap.set("v", "<C-k>", ":m '<-2<CR>gv=gv")

-- append line below to current line without moving cursor
keymap.set("n", "J", "mzJ`z")

-- half page jump keep cursor in the middle
keymap.set("n", "<C-d>", "<C-d>zz")
keymap.set("n", "<C-u>", "<C-u>zz")

-- cycle search terms keep cursor in the middle
keymap.set("n", "n", "nzzzv")
keymap.set("n", "N", "Nzzzv")

-- preserve buffer while pasting
keymap.set("x", "<leader>p", '"_dP')

-- yank into system clipboard
keymap.set({ "n", "v" }, "<leader>y", [["+y]])
keymap.set("n", "<leader>Y", [["+Y]])

-- delete to void register
keymap.set({ "n", "v" }, "<leader>d", [["_d]])

-- replace word on cursor global
keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
