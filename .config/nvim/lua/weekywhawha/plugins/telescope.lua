local telescope_setup, telescope = pcall(require, "telescope")
if not telescope_setup then
	return
end

local themes_setup, themes = pcall(require, "telescope.themes")
if not themes_setup then
	return
end

local actions_setup, actions = pcall(require, "telescope.actions")
if not actions_setup then
	return
end

local trouble_setup, trouble = pcall(require, "trouble")
if not trouble_setup then
	return
end

telescope.setup({
	-- configure custom mappings
	defaults = {
		mappings = {
			i = {
				["<C-k>"] = actions.move_selection_previous, -- move to prev result
				["<C-j>"] = actions.move_selection_next, -- move to next result
				["<C-q>"] = function(prompt_bufnr)
					actions.smart_send_to_qflist(prompt_bufnr)
					trouble.open("quickfix")
				end,
			},
		},
	},
	extensions = {
		["ui-select"] = {
			themes.get_dropdown {
				-- even more opts
			},
		},
	},
})

telescope.load_extension("fzf")
telescope.load_extension("ui-select")
