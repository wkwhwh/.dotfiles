return {
  "williamboman/mason.nvim",
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
    "WhoIsSethDaniel/mason-tool-installer.nvim",
  },
  config = function()
    local mason = require("mason")
    local mason_lspconfig = require("mason-lspconfig")
    local mason_tool_installer = require("mason-tool-installer")

    mason.setup({
      ui = {
        border = "rounded",
      },
    })

    mason_lspconfig.setup({
      ensure_installed = {
        "eslint",
        "ts_ls",
        "html",
        "cssls",
        "tailwindcss",
        "svelte",
        "lua_ls",
        "graphql",
        "prismals",
        "pyright",
        "rust_analyzer",
      },
    })

    mason_tool_installer.setup({
      ensure_installed = {
        "prettier", -- prettier formatter
        "stylua",   -- lua formatter
        "isort",    -- python formatter
        "black",    -- python formatter
        "pylint",   -- python linter
        "eslint",   -- js linter (this is the CLI tool, ESLint LSP is handled above)
      },
    })
  end,
}
