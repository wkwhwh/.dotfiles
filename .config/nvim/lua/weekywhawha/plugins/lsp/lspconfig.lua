local lspconfig_setup, lspconfig = pcall(require, "lspconfig")
if not lspconfig_setup then
  return
end

local cmp_nvim_lsp_setup, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not cmp_nvim_lsp_setup then
  return
end

local lsp_format_setup, lsp_format = pcall(require, "lsp-format")
if not lsp_format_setup then
  return
end

local diagnostics_active = true
local toggle_diagnostics = function()
  diagnostics_active = not diagnostics_active
  if diagnostics_active then
    vim.diagnostic.show()
  else
    vim.diagnostic.hide()
  end
end

local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
  opts = opts or {}
  opts.border = "rounded"
  return orig_util_open_floating_preview(contents, syntax, opts, ...)
end

local keymap = vim.keymap -- for conciseness

-- enable keybinds only for when lsp server available
local on_attach = function(client, bufnr)
  lsp_format.on_attach(client)
  -- keybind options
  local opts = { noremap = true, silent = true, buffer = bufnr }

  -- set keybinds
  keymap.set("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)        -- go to delcaration
  keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)         -- see definition and make edits in window
  keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)     -- go to implementation
  keymap.set("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts) -- see available code actions
  keymap.set("n", "<leader>cA", function()
    vim.lsp.buf.code_action({
      context = {
        only = {
          "source",
        },
        diagnostics = {},
      },
    })
  end, opts)                                                                                     -- see available source actions
  keymap.set("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)                       -- smart rename
  keymap.set("n", "<leader>ld", "<cmd>lua vim.diagnostic.open_float({scope = 'line'})<CR>", opts) -- show diagnostics for cursor
  keymap.set("n", "[d", "<cmd>lua vim.diagnostic.goto_prev()<CR>", opts)                         -- jump to previous diagnostic in buffer
  keymap.set("n", "]d", "<cmd>lua vim.diagnostic.goto_next()<CR>", opts)                         -- jump to next diagnostic in buffer
  keymap.set("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)                                 -- show documentation for what is under cursor
  keymap.set("n", "<leader>td", toggle_diagnostics)                                              -- toggles inline diagnostics
end

-- used to enable autocompletion (assign to every lsp server config)
local capabilities = cmp_nvim_lsp.default_capabilities()

vim.fn.sign_define("DiagnosticSignError", { text = "", texthl = "DiagnosticError" })
vim.fn.sign_define("DiagnosticSignWarn", { text = "", texthl = "DiagnosticWarn" })
vim.fn.sign_define("DiagnosticSignInfo", { text = "", texthl = "DiagnosticInfo" })
vim.fn.sign_define("DiagnosticSignHint", { text = "", texthl = "DiagnosticHint" })

local vint = require("weekywhawha.plugins.efm.vint")
local stylua = require("weekywhawha.plugins.efm.stylua")
local luacheck = require("weekywhawha.plugins.efm.luacheck")
local staticcheck = require("weekywhawha.plugins.efm.staticcheck")
local go_vet = require("weekywhawha.plugins.efm.go_vet")
local goimports = require("weekywhawha.plugins.efm.goimports")
local black = require("weekywhawha.plugins.efm.black")
local isort = require("weekywhawha.plugins.efm.isort")
local flake8 = require("weekywhawha.plugins.efm.flake8")
local mypy = require("weekywhawha.plugins.efm.mypy")
local prettier = require("weekywhawha.plugins.efm.prettier")
local eslint = require("weekywhawha.plugins.efm.eslint")
local shellcheck = require("weekywhawha.plugins.efm.shellcheck")
local shfmt = require("weekywhawha.plugins.efm.shfmt")
local terraform = require("weekywhawha.plugins.efm.terraform")
local misspell = require("weekywhawha.plugins.efm.misspell")
local opa = require("weekywhawha.plugins.efm.opa")
local cbfmt = require("weekywhawha.plugins.efm.cbfmt")

local languages = {
  ["="] = { misspell },
  vim = { vint },
  lua = { stylua, luacheck },
  go = { staticcheck, goimports, go_vet },
  python = { black, isort, flake8, mypy },
  typescript = { prettier, eslint },
  javascript = { prettier, eslint },
  typescriptreact = { prettier, eslint },
  javascriptreact = { prettier, eslint },
  yaml = { prettier },
  json = { prettier },
  html = { prettier },
  scss = { prettier },
  css = { prettier },
  markdown = { prettier, cbfmt },
  org = { cbfmt },
  sh = { shellcheck, shfmt },
  terraform = { terraform },
  rego = { opa },
}
lspconfig["efm"].setup({
  capabilities = capabilities,
  on_attach = on_attach,
  init_options = { documentFormatting = true },
  root_dir = vim.loop.cwd,
  filetypes = vim.tbl_keys(languages),
  rootMarkers = { ".git/" },
  settings = {
    lintDebounce = 100,
    languages = languages,
  },
})

-- Show error as virtual text (inline) and hints as underlines
vim.diagnostic.config({
  float = {
    source = "always",
    border = vim.g.FloatBorders,
    title = "Diagnostics",
    title_pos = "left",
    header = "",
  },
  underline = true,
  signs = true,
  update_in_insert = false,
  severity_sort = true,
  virtual_text = {
    prefix = "•",
  },
})

-- configure html server
lspconfig["html"].setup({
  capabilities = capabilities,
  on_attach = on_attach,
})

-- configure rust server
lspconfig["rust_analyzer"].setup({
  capabilities = capabilities,
  on_attach = on_attach,
})

-- configure css server
lspconfig["cssls"].setup({
  capabilities = capabilities,
  on_attach = on_attach,
  settings = {
    css = {
      lint = {
        unknownAtRules = "ignore",
      },
    },
  },
})

-- configure tailwindcss server
lspconfig["tailwindcss"].setup({
  capabilities = capabilities,
  on_attach = on_attach,
})

-- configure lua server (with special settings)
lspconfig["lua_ls"].setup({
  capabilities = capabilities,
  on_attach = on_attach,
  settings = {
    -- custom settings for lua
    Lua = {
      -- make the language server recognize "vim" global
      diagnostics = {
        globals = { "vim" },
      },
      workspace = {
        -- make language server aware of runtime files
        library = {
          [vim.fn.expand("$VIMRUNTIME/lua")] = true,
          [vim.fn.stdpath("config") .. "/lua"] = true,
        },
      },
    },
  },
})

lspconfig.tsserver.setup({
  capabilities = capabilities,
  on_attach = on_attach,
  init_options = {
    preferences = {
      includeCompletionsWithSnippetText = true,
      includeCompletionsWithInsertText = true,
    },
  },
  settings = {
    completions = {
      completeFunctionCalls = true,
    },
    typescript = {
      inlayHints = {
        includeInlayParameterNameHints = "all",
        includeInlayParameterNameHintsWhenArgumentMatchesName = true,
        includeInlayFunctionParameterTypeHints = true,
        includeInlayVariableTypeHints = true,
        includeInlayPropertyDeclarationTypeHints = true,
        includeInlayFunctionLikeReturnTypeHints = true,
        includeInlayEnumMemberValueHints = true,
      },
    },
    javascript = {
      inlayHints = {
        includeInlayParameterNameHints = "all",
        includeInlayParameterNameHintsWhenArgumentMatchesName = true,
        includeInlayFunctionParameterTypeHints = true,
        includeInlayVariableTypeHints = true,
        includeInlayPropertyDeclarationTypeHints = true,
        includeInlayFunctionLikeReturnTypeHints = true,
        includeInlayEnumMemberValueHints = true,
      },
    },
  },
})
