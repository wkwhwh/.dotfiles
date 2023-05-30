local setup, trouble = pcall(require, "trouble")
if not setup then
  return
end

trouble.setup({ use_diagnostic_signs = true })

local keymap = vim.keymap

keymap.set("n", "<leader>xx", "<cmd>TroubleToggle<CR>")
keymap.set("n", "<leader>xD", "<cmd>TroubleToggle workspace_diagnostics<CR>")
keymap.set("n", "<leader>xd", "<cmd>TroubleToggle document_diagnostics<CR>")
keymap.set("n", "<leader>xq", "<cmd>TroubleToggle quickfix<CR>")
keymap.set("n", "<leader>xl", "<cmd>TroubleToggle loclist<CR>")
keymap.set("n", "<leader>xr", "<cmd>TroubleToggle lsp_references<CR>")

keymap.set("n", "]x", function()
  pcall(trouble.next, { skip_groups = true, jump = true })
end)
keymap.set("n", "[x", function()
  pcall(trouble.previous, { skip_groups = true, jump = true })
end)
