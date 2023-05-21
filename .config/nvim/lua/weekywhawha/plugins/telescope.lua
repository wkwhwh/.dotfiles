-- import telescope plugin safely
local telescope_setup, telescope = pcall(require, "telescope")
if not telescope_setup then
	return
end

-- import telescope plugin safely
local telescope_setup, themes = pcall(require, "telescope.themes")
if not telescope_setup then
	return
end

-- import telescope actions safely
local actions_setup, actions = pcall(require, "telescope.actions")
if not actions_setup then
	return
end

-- import trouble actions safely
local actions_setup, trouble = pcall(require, "trouble.providers.telescope")
if not actions_setup then
	return
end

-- configure telescope
telescope.setup({
	-- configure custom mappings
	defaults = {
		mappings = {
			i = {
				["<C-k>"] = actions.move_selection_previous, -- move to prev result
				["<C-j>"] = actions.move_selection_next, -- move to next result
				["<C-t>"] = trouble.smart_open_with_trouble,
				["<C-q>"] = function(prompt_bufnr)
					actions.smart_send_to_qflist(prompt_bufnr)
					require("trouble").open("quickfix")
				end
			},
		},
	},
	extensions = {
		["ui-select"] = {
			themes.get_dropdown {
				-- even more opts
			}
		}
	},
})

telescope.load_extension("fzf")
require("telescope").load_extension("file_browser")
require("telescope").load_extension("ui-select")
