local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end

vim.opt.rtp:prepend(lazypath)

local status, lazy = pcall(require, "lazy")
if not status then
	return
end

return lazy.setup({
	-- lua functions that many plugins use
	"nvim-lua/plenary.nvim",

	-- colorscheme
	"rebelot/kanagawa.nvim",

	-- tmux & split window navigation
	"christoomey/vim-tmux-navigator",

	-- add, delete, change word surround
	"tpope/vim-surround",

	-- commenting with gc
	"numToStr/Comment.nvim",

	-- statusline
	"nvim-lualine/lualine.nvim",

	-- fuzzy finding w/ telescope
	{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" }, -- dependency for better sorting performance
	{
		"nvim-telescope/telescope.nvim",
		branch = "0.1.x",
		dependencies = { "nvim-lua/plenary.nvim", "debugloop/telescope-undo.nvim", }
	},
	"nvim-telescope/telescope-ui-select.nvim", -- ui for telescope

	-- netwr-like file browser
	{
		"stevearc/oil.nvim",
		opts = {},
		-- Optional dependencies
		dependencies = { "nvim-tree/nvim-web-devicons" },
	},
	{
		'stevearc/aerial.nvim',
		opts = {},
		-- Optional dependencies
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
			"nvim-tree/nvim-web-devicons"
		},
	},

	-- autocompletion
	"hrsh7th/nvim-cmp",  -- completion plugin
	"hrsh7th/cmp-buffer", -- source for text in buffer
	"hrsh7th/cmp-path",  -- source for file system paths

	-- snippets
	{
		"L3MON4D3/LuaSnip",
		dependencies = { "rafamadriz/friendly-snippets" },
	},
	"saadparwaiz1/cmp_luasnip",    -- for autocompletion
	"rafamadriz/friendly-snippets", -- useful snippets

	-- managing & installing lsp servers, linters & formatters
	"williamboman/mason.nvim",          -- in charge of managing lsp servers, linters & formatters
	"williamboman/mason-lspconfig.nvim", -- bridges gap b/w mason & lspconfig

	-- configuring lsp servers
	"neovim/nvim-lspconfig",        -- easily configure language servers
	"hrsh7th/cmp-nvim-lsp",         -- for autocompletion

	"lukas-reineke/lsp-format.nvim", -- format on save

	"onsails/lspkind.nvim",         -- vs-code like icons for autocompletion

	-- treesitter configuration
	{
		"nvim-treesitter/nvim-treesitter",
		build = function()
			local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
			ts_update()
		end,
		dependencies = {
			"windwp/nvim-ts-autotag",                   -- autoclose tags
			'JoosepAlviste/nvim-ts-context-commentstring', -- context aware commentstring
		},
	},

	-- auto closing
	"windwp/nvim-autopairs", -- autoclose parens, brackets, quotes, etc...

	-- git integration
	"lewis6991/gitsigns.nvim", -- show line modifications on left hand side
	{
		'NeogitOrg/neogit',     -- git interface
		dependencies = {
			'nvim-lua/plenary.nvim',
			'sindrets/diffview.nvim',
			'nvim-telescope/telescope.nvim'
		},
	},

	-- view diffs in a split window
	"sindrets/diffview.nvim",

	-- diagnostics, references, qflist, etc...
	{
		"folke/trouble.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
	},
	{
		"zbirenbaum/copilot.lua",
		cmd = "Copilot",
		build = ":Copilot auth",
		event = "InsertEnter",
	},
	{
		"epwalsh/obsidian.nvim",
		lazy = true,
		event = { "BufReadPre " .. vim.fn.expand "~" .. "/Documents/Obsidian/Main/**.md" },
		dependencies = {
			"nvim-lua/plenary.nvim",
			"hrsh7th/nvim-cmp",
			"nvim-telescope/telescope.nvim",
		},
	},
	"tidalcycles/vim-tidal",
	{
		"folke/todo-comments.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = {}
	}
})
