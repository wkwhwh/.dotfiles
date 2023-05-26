local wezterm = require("wezterm")

local function is_vi_process(pane)
	return pane:get_foreground_process_name():find("n?vim") ~= nil
end

local direction_keys = {
	Left = "h",
	Down = "j",
	Up = "k",
	Right = "l",
	h = "Left",
	j = "Down",
	k = "Up",
	l = "Right",
}

local function split_nav(resize_or_move, key)
	return {
		key = key,
		mods = resize_or_move == "resize" and "SHIFT|CMD|CTRL" or "SHIFT|CMD",
		action = wezterm.action_callback(function(win, pane)
			if is_vi_process(pane) then
				win:perform_action({
					SendKey = { key = key, mods = resize_or_move == "resize" and "SHIFT|CMD|CTRL" or "SHIFT|CMD" },
				}, pane)
			else
				if resize_or_move == "resize" then
					win:perform_action({ AdjustPaneSize = { direction_keys[key], 3 } }, pane)
				else
					win:perform_action({ ActivatePaneDirection = direction_keys[key] }, pane)
				end
			end
		end),
	}
end

return {
	split_nav("move", "h"),
	split_nav("move", "j"),
	split_nav("move", "k"),
	split_nav("move", "l"),
	split_nav("resize", "h"),
	split_nav("resize", "j"),
	split_nav("resize", "k"),
	split_nav("resize", "l"),
	{
		mods = "CMD|SHIFT",
		key = "|",
		action = wezterm.action({
			SplitHorizontal = { domain = "CurrentPaneDomain" },
		}),
	},
	{
		mods = "CMD|SHIFT",
		key = "_",
		action = wezterm.action({
			SplitVertical = { domain = "CurrentPaneDomain" },
		}),
	},
	{ key = "w", mods = "CMD|SHIFT", action = wezterm.action.CloseCurrentPane({ confirm = false }) },
	{ key = "[", mods = "CMD|SHIFT", action = wezterm.action.MoveTabRelative(-1) },
	{ key = "]", mods = "CMD|SHIFT", action = wezterm.action.MoveTabRelative(1) },
	{
		key = 'u',
		mods = 'CTRL|SHIFT',
		action = wezterm.action.DisableDefaultAssignment,
	},
	{
		key = 'l',
		mods = 'CTRL|SHIFT',
		action = wezterm.action.DisableDefaultAssignment,
	},
	{
		key = ',',
		mods = 'SHIFT|CMD',
		action = wezterm.action.ShowDebugOverlay,
	},
	{
		key = 'X',
		mods = 'CTRL|SHIFT',
		action = wezterm.action.DisableDefaultAssignment,
	},
	{
		key = 'X',
		mods = 'SHIFT|CMD',
		action = wezterm.action.ActivateCopyMode,
	},
	{
		key = 'P',
		mods = 'CTRL|SHIFT',
		action = wezterm.action.DisableDefaultAssignment,
	},
	{
		key = 'P',
		mods = 'SHIFT|CMD',
		action = wezterm.action.ActivateCommandPalette,
	},
	{
		key = 'Space',
		mods = 'CTRL|SHIFT',
		action = wezterm.action.DisableDefaultAssignment,
	},
	{
		key = 'Space',
		mods = 'SHIFT|CMD',
		action = wezterm.action.QuickSelect,
	},
	{
		key = 'Z',
		mods = 'CTRL|SHIFT',
		action = wezterm.action.DisableDefaultAssignment,
	},
	{
		key = 'Z',
		mods = 'SHIFT|CMD',
		action = wezterm.action.TogglePaneZoomState,
	},
}
