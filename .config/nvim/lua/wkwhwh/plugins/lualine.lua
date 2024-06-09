return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local lualine = require("lualine")

		lualine.setup({
			options = { section_separators = '', component_separators = '' },
			sections = {
				lualine_a = { "mode" },
				lualine_b = {
					"branch",
					"diff",
					{ "diagnostics", symbols = { error = " ", warn = " ", info = " ", hint = "󰠠 " } },
				},
				lualine_c = {
					{ 'filename', path = 4 },
				},
				lualine_x = { "encoding", "fileformat", "filetype" },
				lualine_y = { "progress" },
				lualine_z = { "location" },
			},
			tabline = {
				lualine_a = { {
					'buffers',
					filetype_names = {
						TelescopePrompt = 'Telescope',
						dashboard = 'Dashboard',
						alpha = 'Alpha',
						oil = 'Oil',
						mason = 'Mason',
						lazy = 'Lazy'
					},
					symbols = {
						modified = ' ●', -- Text to show when the buffer is modified
						alternate_file = '# ', -- Text to show to identify the alternate file
						directory = '', -- Text to show when the buffer is a directory
					},
				} },
				lualine_b = {},
				lualine_c = {},
				lualine_x = {},
				lualine_y = {},
				lualine_z = {},
			},
		})
	end,
}
