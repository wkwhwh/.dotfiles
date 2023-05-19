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
	foreground = "#dcd7ba",
	background = "#1f1f28",

	cursor_bg = "#c8c093",
	cursor_fg = "#c8c093",
	cursor_border = "#c8c093",

	selection_fg = "#c8c093",
	selection_bg = "#2d4f67",

	scrollbar_thumb = "#16161d",
	split = "#16161d",

	ansi = { "#090618", "#c34043", "#76946a", "#c0a36e", "#7e9cd8", "#957fb8", "#6a9589", "#c8c093" },
	brights = { "#727169", "#e82424", "#98bb6c", "#e6c384", "#7fb4ca", "#938aa9", "#7aa89f", "#dcd7ba" },
	indexed = { [16] = "#ffa066", [17] = "#ff5d62" },
	tab_bar = {
		background = "#16161D",
		active_tab = {
			bg_color = "none",
			fg_color = "#A3D4D5",
			intensity = "Bold",
			underline = "None",
			italic = false,
			strikethrough = false,
		},
		inactive_tab = {
			bg_color = "#16161D",
			fg_color = "#363646",
		},
		inactive_tab_hover = {
			bg_color = "#16161D",
			fg_color = "#363646",
		},
		new_tab = {
			bg_color = "#16161D",
			fg_color = "#938056",
		},
		new_tab_hover = {
			bg_color = "#16161D",
			fg_color = "#2A2A37",
		},
	},
}

return Theme
