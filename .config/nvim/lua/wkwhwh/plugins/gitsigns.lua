return {
  "lewis6991/gitsigns.nvim",
  config = function()
    local gs = require("gitsigns")

    gs.setup {
      preview_config = {
        border = 'rounded',
        style = 'minimal',
        relative = 'cursor',
        row = 0,
        col = 1
      },
      on_attach = function(bufnr)
        local function map(mode, l, r, opts)
          opts = opts or {}
          opts.buffer = bufnr
          vim.keymap.set(mode, l, r, opts)
        end

        map("n", "]h", function()
          if vim.wo.diff then
            vim.cmd.normal({ "]c", bang = true })
          else
            gs.nav_hunk("next")
          end
        end, { desc = "Next Hunk" })

        map("n", "[h", function()
          if vim.wo.diff then
            vim.cmd.normal({ "[c", bang = true })
          else
            gs.nav_hunk("prev")
          end
        end, { desc = "Prev Hunk" })

        map("n", "]H", function() gs.nav_hunk("last") end, { desc = "Last Hunk" })
        map("n", "[H", function() gs.nav_hunk("first") end, { desc = "First Hunk" })
        map({ "n", "v" }, "<leader>hs", ":Gitsigns stage_hunk<CR>", { desc = "Stage Hunk" })
        map({ "n", "v" }, "<leader>hr", ":Gitsigns reset_hunk<CR>", { desc = "Reset Hunk" })
        map("n", "<leader>hS", gs.stage_buffer, { desc = "Stage Buffer" })
        map("n", "<leader>hu", gs.undo_stage_hunk, { desc = "Undo Stage Hunk" })
        map("n", "<leader>hR", gs.reset_buffer, { desc = "Reset Buffer" })
        map("n", "<leader>hp", gs.preview_hunk_inline, { desc = "Preview Hunk Inline" })
        map("n", "<leader>hb", function() gs.blame_line({ full = true }) end, { desc = "Blame Line" })
        map("n", "<leader>hB", function() gs.blame() end, { desc = "Blame Buffer" })
        map("n", "<leader>hd", gs.diffthis, { desc = "Diff This" })
        map("n", "<leader>hD", function() gs.diffthis("~") end, { desc = "Diff This ~" })
        map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>", { desc = "GitSigns Select Hunk" })
      end
    }
  end,
}
