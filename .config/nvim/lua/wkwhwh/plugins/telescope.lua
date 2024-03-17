return {
	"nvim-telescope/telescope.nvim",
	branch = "0.1.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		"nvim-tree/nvim-web-devicons",
		"debugloop/telescope-undo.nvim",
	},
	config = function()
		local telescope = require("telescope")
		local actions = require("telescope.actions")
		telescope.setup({
			defaults = {
				path_display = { "truncate" },
				mappings = {
					i = {
						["<C-n>"] = actions.cycle_history_next,
						["<C-p>"] = actions.cycle_history_prev,
						["<C-k>"] = actions.move_selection_previous,
						["<C-j>"] = actions.move_selection_next,
					},
				},
			},
		})

		telescope.load_extension("fzf")

		vim.keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>") -- find files within current working directory, respects .gitignore
		vim.keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>") -- find string in current working directory as you type
		vim.keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>")  -- list open buffers in current neovim instance
		vim.keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>") -- list available help tags
		vim.keymap.set("n", "<leader>fr", "<cmd>Telescope resume<cr>")   -- resume previous telescope search
		vim.keymap.set("n", "<leader>fu", "<cmd>Telescope undo<cr>")      -- telescope undo
		vim.keymap.set("n", "<leader>fg", "<cmd>Telescope git_files<cr>") -- find git files
	end,
}
