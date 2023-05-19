-- import lualine plugin safely
local status, lualine = pcall(require, "lualine")
if not status then
	return
end

-- get lualine nightfly theme
local lualine_theme = require("lualine.themes.catppuccin")

-- new colors for theme
local new_colors = {
	blue = "#89b4fa",
	green = "#a6e3a1",
	mauve = "#cba6f7",
	yellow = "#f9e2af",
	black = "#000000",
}

-- change nightlfy theme colors
lualine_theme.normal.a.bg = new_colors.blue
lualine_theme.insert.a.bg = new_colors.green
lualine_theme.visual.a.bg = new_colors.mauve
lualine_theme.command.a.bg = new_colors.yellow

-- configure lualine with modified theme
lualine.setup({
	options = {
		theme = lualine_theme,
	},
})
