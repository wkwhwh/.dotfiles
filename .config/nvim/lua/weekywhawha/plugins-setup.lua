-- auto install packer if not installed
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

-- import lazy safely
local status, lazy = pcall(require, "lazy")
if not status then
	return
end

-- add list of plugins to install
return lazy.setup({
	"nvim-lua/plenary.nvim",                                          -- lua functions that many plugins use

	{ "catppuccin/nvim" }, -- preferred colorscheme

	"christoomey/vim-tmux-navigator",                                 -- tmux & split window navigation

	"szw/vim-maximizer",                                              -- maximizes and restores current window

	-- essential plugins
	"tpope/vim-surround",              -- add, delete, change surroundings (it's awesome)
	"inkarkat/vim-ReplaceWithRegister", -- replace with register contents using motion (gr + motion)

	-- commenting with gc
	"numToStr/Comment.nvim",

	-- vs-code like icons
	"nvim-tree/nvim-web-devicons",

	-- statusline
	"nvim-lualine/lualine.nvim",

	-- fuzzy finding w/ telescope
	{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },  -- dependency for better sorting performance
	{ "nvim-telescope/telescope.nvim",            branch = "0.1.x" }, -- fuzzy finder

	-- file explorer inside telescope
	{
		"nvim-telescope/telescope-file-browser.nvim",
		dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim", "nvim-tree/nvim-web-devicons" },
	},

	-- autocompletion
	"hrsh7th/nvim-cmp",  -- completion plugin
	"hrsh7th/cmp-buffer", -- source for text in buffer
	"hrsh7th/cmp-path",  -- source for file system paths

	-- snippets
	"L3MON4D3/LuaSnip",            -- snippet engine
	"saadparwaiz1/cmp_luasnip",    -- for autocompletion
	"rafamadriz/friendly-snippets", -- useful snippets

	-- managing & installing lsp servers, linters & formatters
	"williamboman/mason.nvim",          -- in charge of managing lsp servers, linters & formatters
	"williamboman/mason-lspconfig.nvim", -- bridges gap b/w mason & lspconfig

	-- configuring lsp servers
	"neovim/nvim-lspconfig", -- easily configure language servers
	"hrsh7th/cmp-nvim-lsp", -- for autocompletion
	{
		"glepnir/lspsaga.nvim",
		branch = "main",
		dependencies = {
			{ "nvim-tree/nvim-web-devicons" },
			{ "nvim-treesitter/nvim-treesitter" },
		},
	},                                   -- enhanced lsp uis

	"jose-elias-alvarez/typescript.nvim", -- additional functionality for typescript server (e.g. rename file & update imports)
	"onsails/lspkind.nvim",              -- vs-code like icons for autocompletion

	-- formatting & linting
	"jose-elias-alvarez/null-ls.nvim", -- configure formatters & linters
	"jayp0521/mason-null-ls.nvim", -- bridges gap b/w mason & null-ls

		-- treesitter configuration
		{
			"nvim-treesitter/nvim-treesitter",
			build = function()
				local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
				ts_update()
			end,
			dependencies = {
				"windwp/nvim-ts-autotag", -- autoclose tags
			},
		},

	-- auto closing
	"windwp/nvim-autopairs", -- autoclose parens, brackets, quotes, etc...

	-- git integration
	"lewis6991/gitsigns.nvim", -- show line modifications on left hand side
	"tpope/vim-fugitive",     -- git plugin
})
