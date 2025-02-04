return {
  "ibhagwan/fzf-lua",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    require('fzf-lua').setup({
      lsp = {
        code_actions = {
          previewer = false,
          winopts = {
            height = 0.2, -- much smaller height (20% of screen)
            width = 0.4,  -- much smaller width (30% of screen)
            col = 0.5,    -- center horizontally (0.5 = 50% from left)
          },
        },
      },
    })

    -- Your keymaps
    vim.keymap.set("n", "<leader>ff", "<cmd>FzfLua files<cr>")
    vim.keymap.set("n", "<leader>fs", "<cmd>FzfLua grep<cr>")
    vim.keymap.set("n", "<leader>fl", "<cmd>FzfLua live_grep<cr>")
    vim.keymap.set("n", "<leader><leader>", "<cmd>FzfLua buffers<cr>")
    vim.keymap.set("n", "<leader>fh", "<cmd>FzfLua helptags<cr>")
    vim.keymap.set("n", "<leader>fr", "<cmd>FzfLua resume<cr>")
    vim.keymap.set("n", "<leader>fg", "<cmd>FzfLua git_files<cr>")
    vim.keymap.set("n", "<leader>fm", "<cmd>FzfLua marks<cr>")
  end
}
