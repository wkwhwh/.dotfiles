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
		undo = {
      use_delta = true,
      use_custom_command = nil, -- setting this implies `use_delta = false`. Accepted format is: { "bash", "-c", "echo '$DIFF' | delta" }
      side_by_side = false,
      diff_context_lines = vim.o.scrolloff,
      entry_format = "state #$ID, $STAT, $TIME",
      time_format = "",
      mappings = {
        i = {
          -- IMPORTANT: Note that telescope-undo must be available when telescope is configured if
          -- you want to replicate these defaults and use the following actions. This means
          -- installing as a dependency of telescope in it's `requirements` and loading this
          -- extension from there instead of having the separate plugin definition as outlined
          -- above.
          ["<C-y>"] = require("telescope-undo.actions").yank_additions,
          ["<S-y>"] = require("telescope-undo.actions").yank_deletions,
          ["<cr>"] = require("telescope-undo.actions").restore,
        },
      },
    },
	},
})

telescope.load_extension("fzf")
telescope.load_extension("ui-select")
telescope.load_extension("undo")
