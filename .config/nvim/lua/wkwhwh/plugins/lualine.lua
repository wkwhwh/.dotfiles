return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "envim-tree/nvim-web-devicons" },
	config = function()
		local lualine = require("lualine")

		lualine.setup({
			options = { section_separators = '', component_separators = '' },
			sections = {
				lualine_a = { "mode" },
				lualine_b = {
					"branch",
					"diff",
					{ "diagnostics", symbols = { error = " ", warn = " ", info = " ", hint = " " } }
				},
				lualine_c = {
					{ "filename", path = 4 },
				},
				lualine_x = { "encoding", "fileformat", "filetype" },
				lualine_y = { "progress" },
				lualine_z = { "location" },
			},
		})
	end,
}
