return {
	"nvim-lualine/lualine.nvim",
	dependencies = {
		"echasnovski/mini.icons",
		"davidgranstrom/scnvim"
	},
	config = function()
		local lualine = require("lualine")

		local sc_status = {
			function()
				if vim.bo.filetype == "supercollider" then
					local status = vim.fn['scnvim#statusline#server_status']()
					status = status:gsub("%%", "%%%%")
					return status
				end
				return ""
			end
		}

		lualine.setup({
			options = { section_separators = '', component_separators = '' },
			sections = {
				lualine_a = { "mode" },
				lualine_b = {
					"branch",
					"diff",
					{ "diagnostics", symbols = { error = " ", warn = " ", info = " ", hint = " " } }
				},
				lualine_c = {
					{ "filename", path = 4 },
				},
				lualine_x = { sc_status, "encoding", "fileformat", "filetype" },
				lualine_y = { "progress" },
				lualine_z = { "location" },
			},
		})
	end,
}
