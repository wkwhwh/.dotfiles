local wezterm = require("wezterm")

local Theme = {}

local themes = {
	catppuccin = {
		dark = {
			rosewater = "#F5E0DC",
			flamingo = "#F2CDCD",
			pink = "#F5C2E7",
			mauve = "#CBA6F7",
			red = "#F38BA8",
			maroon = "#EBA0AC",
			peach = "#FAB387",
			yellow = "#F9E2AF",
			green = "#A6E3A1",
			teal = "#94E2D5",
			sky = "#89DCEB",
			sapphire = "#74C7EC",
			blue = "#89B4FA",
			lavender = "#B4BEFE",
			text = "#CDD6F4",
			subtext1 = "#BAC2DE",
			subtext0 = "#A6ADC8",
			overlay2 = "#9399B2",
			overlay1 = "#7F849C",
			overlay0 = "#6C7086",
			surface2 = "#585B70",
			surface1 = "#45475A",
			surface0 = "#313244",
			base = "#1E1E2E",
			mantle = "#181825",
			crust = "#11111B",
		},
	},
}

local THEME_NAME = "catppuccin"

local palettes = themes[THEME_NAME]

Theme.palette = palettes.dark

Theme.colors = {
	split = Theme.palette.surface0,
	foreground = Theme.palette.text,
	background = Theme.palette.base,
	cursor_bg = Theme.palette.overlay2,
	cursor_border = Theme.palette.overlay2,
	cursor_fg = Theme.palette.base,
	selection_bg = Theme.palette.surface2,
	selection_fg = Theme.palette.text,
	visual_bell = Theme.palette.surface0,
	indexed = {
		[16] = Theme.palette.peach,
		[17] = Theme.palette.rosewater,
	},
	scrollbar_thumb = Theme.palette.surface2,
	compose_cursor = Theme.palette.flamingo,
	ansi = {
		Theme.palette.surface0,
		Theme.palette.red,
		Theme.palette.green,
		Theme.palette.yellow,
		Theme.palette.blue,
		Theme.palette.mauve,
		Theme.palette.teal,
		Theme.palette.text,
	},
	brights = {
		Theme.palette.surface2,
		Theme.palette.red,
		Theme.palette.green,
		Theme.palette.yellow,
		Theme.palette.blue,
		Theme.palette.mauve,
		Theme.palette.teal,
		Theme.palette.surface2,
	},
	tab_bar = {
		background = Theme.palette.mantle,
		active_tab = {
			bg_color = "none",
			fg_color = Theme.palette.subtext1,
			intensity = "Bold",
			underline = "None",
			italic = false,
			strikethrough = false,
		},
		inactive_tab = {
			bg_color = Theme.palette.mantle,
			fg_color = Theme.palette.surface1,
		},
		inactive_tab_hover = {
			bg_color = Theme.palette.mantle,
			fg_color = Theme.palette.surface1,
		},
		new_tab = {
			bg_color = Theme.palette.mantle,
			fg_color = Theme.palette.subtext0,
		},
		new_tab_hover = {
			bg_color = Theme.palette.mantle,
			fg_color = Theme.palette.surface2,
		},
	},
}

return Theme
