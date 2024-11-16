vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  pattern = "*.ejs",
  command = "set filetype=html",
})

-- vim.api.nvim_create_autocmd("InsertEnter", {
--   pattern = "*.scd, *.sc, *.sc_help, *.quark",
--   callback = function()
--     require("luasnip").add_snippets("supercollider", require("scnvim/utils").get_snippets())
--   end,
--   once = true,
-- })
