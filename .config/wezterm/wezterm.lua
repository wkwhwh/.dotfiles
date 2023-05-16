local wezterm = require("wezterm")
local Tab = require("tab")
local Theme = require("theme")
local Keys = require("keys")

Tab.setup()

return {
	font = wezterm.font_with_fallback({
		"Iosevka Nerd Font Mono",
		"Segoe UI Emoji",
	}),
	font_size = 12,
	underline_thickness = "200%",
	underline_position = "-3pt",
	enable_wayland = false,
	pane_focus_follows_mouse = false,
	warn_about_missing_glyphs = false,
	show_update_window = false,
	check_for_updates = false,
	window_decorations = "RESIZE",
	window_close_confirmation = "NeverPrompt",
	window_padding = {
		left = 0,
		right = 0,
		top = 0,
		bottom = 0,
	},
	initial_cols = 110,
	initial_rows = 25,
	inactive_pane_hsb = {
		saturation = 1.0,
		brightness = wezterm.GLOBAL.is_dark and 0.90 or 0.95,
	},
	enable_scroll_bar = false,
	use_fancy_tab_bar = false,
	show_new_tab_button_in_tab_bar = false,
	window_background_opacity = 1.0,
	tab_max_width = 50,
	hide_tab_bar_if_only_one_tab = true,
	disable_default_key_bindings = false,
	colors = Theme.colors,
	keys = Keys,
	hyperlink_rules = {
		{
			regex = "\\b\\w+://[\\w.-]+:[0-9]{2,15}\\S*\\b",
			format = "$0",
		},
		{
			regex = "\\b\\w+://[\\w.-]+\\.[a-z]{2,15}\\S*\\b",
			format = "$0",
		},
		{
			regex = [[\b\w+@[\w-]+(\.[\w-]+)+\b]],
			format = "mailto:$0",
		},
		{
			regex = [[\bfile://\S*\b]],
			format = "$0",
		},
		{
			regex = [[\b\w+://(?:[\d]{1,3}\.){3}[\d]{1,3}\S*\b]],
			format = "$0",
		},
		{
			regex = [[\b[tT](\d+)\b]],
			format = "https://example.com/tasks/?t=$1",
		},
	},
}
