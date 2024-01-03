local setup, lualine = pcall(require, "lualine")
if not setup then
	return
end

lualine.setup {
	options = {
    component_separators = '',
    section_separators = { left = '', right = '' },
	},
	tabline = {
		lualine_a = { 'buffers' },
		lualine_b = {},
		lualine_c = {},
		lualine_x = {},
		lualine_y = {},
		lualine_z = { 'tabs' }
	},
}
