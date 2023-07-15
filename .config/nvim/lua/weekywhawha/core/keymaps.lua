-- set leader key to space
vim.g.mapleader = " "

local keymap = vim.keymap

-- better up/down
keymap.set({ "n", "x" }, "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
keymap.set({ "n", "x" }, "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })

-- clear search highlights
keymap.set({ "i", "n" }, "<esc>", "<cmd>noh<cr><esc>")

-- clear search, diff update and redraw
keymap.set(
  "n",
  "<leader>ur",
  "<Cmd>nohlsearch<Bar>diffupdate<Bar>normal! <C-L><CR>"
)

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

-- telescope
keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>") -- find files within current working directory, respects .gitignore
keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>")  -- find string in current working directory as you type
keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>")    -- list open buffers in current neovim instance
keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>")  -- list available help tags
keymap.set("n", "<leader>fr", "<cmd>Telescope resume<cr>")     -- resume previous telescope search

-- git
keymap.set("n", "<leader>gg", "<cmd>Neogit<cr>")                -- open git status window
keymap.set("n", "<leader>dv", "<cmd>DiffviewOpen<cr>")          -- open git diff window
keymap.set("n", "<leader>dh", "<cmd>DiffviewFileHistory %<cr>") -- open git file history window for file
keymap.set("n", "<leader>dH", "<cmd>DiffviewFileHistory<cr>")   -- open git file history window for branch
keymap.set("n", "<leader>dq", "<cmd>DiffviewClose<cr>")         -- list git commits

-- file explorer
keymap.set("n", "<leader>fe", "<cmd>Oil<CR>")

-- restart lsp server
keymap.set("n", "<leader>rl", "<cmd>LspRestart<CR>") -- mapping to restart lsp if necessary
