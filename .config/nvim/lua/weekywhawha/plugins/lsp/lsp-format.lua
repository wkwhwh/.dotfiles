local setup, lsp_format = pcall(require, "lsp-format")
if not setup then
  return
end

local prettier = {
  tabWidth = function()
    return vim.opt.shiftwidth:get()
  end,
  singleQuote = true,
  trailingComma = "all",
  configPrecedence = "prefer-file",
  exclude = { "tsserver", "jsonls" },
}
lsp_format.setup {
  typescript = prettier,
  javascript = prettier,
  typescriptreact = prettier,
  javascriptreact = prettier,
  json = prettier,
  css = prettier,
  scss = prettier,
  html = prettier,
  yaml = {
    tabWidth = function()
      return vim.opt.shiftwidth:get()
    end,
    singleQuote = true,
    trailingComma = "all",
    configPrecedence = "prefer-file",
  },
  python = {
    lineLength = 120,
  },
  markdown = prettier,
  sh = {
    tabWidth = 2,
  },
}
