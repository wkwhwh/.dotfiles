return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    local harpoon = require("harpoon")
    harpoon:setup()

    local conf = require("telescope.config").values
    local function toggle_telescope(harpoon_files)
      local file_paths = {}
      for _, item in ipairs(harpoon_files.items) do
        table.insert(file_paths, item.value)
      end

      require("telescope.pickers").new({}, {
        prompt_title = "Harpoon",
        finder = require("telescope.finders").new_table({
          results = file_paths,
        }),
        previewer = conf.file_previewer({}),
        sorter = conf.generic_sorter({}),
      }):find()
    end

    vim.keymap.set("n", "<leader>fm", function() toggle_telescope(harpoon:list()) end)
    vim.keymap.set("n", "<leader>m", function() harpoon:list():append() end)
    vim.keymap.set("n", "<leader>mp", function() harpoon:list():prev({ ui_nav_wrap = true }) end)
    vim.keymap.set("n", "<leader>mn", function() harpoon:list():next({ ui_nav_wrap = true }) end)
    vim.keymap.set("n", "<leader>md", function() harpoon:list():remove() end)
    vim.keymap.set("n", "<leader>mD", function() harpoon:list():clear() end)
    vim.keymap.set("n", "<leader>m1", function() harpoon:list():select(1) end)
    vim.keymap.set("n", "<leader>m2", function() harpoon:list():select(2) end)
    vim.keymap.set("n", "<leader>m3", function() harpoon:list():select(3) end)
    vim.keymap.set("n", "<leader>m4", function() harpoon:list():select(4) end)
  end
}
