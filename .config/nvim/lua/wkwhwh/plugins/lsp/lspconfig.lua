return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    { "antosha417/nvim-lsp-file-operations", config = true },
  },
  config = function()
    local lspconfig = require("lspconfig")
    local cmp_nvim_lsp = require("cmp_nvim_lsp")
    local lsp_format = require("lsp-format")

    local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
    function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
      opts = opts or {}
      opts.border = "rounded"
      return orig_util_open_floating_preview(contents, syntax, opts, ...)
    end

    local opts = { noremap = true, silent = true }
    local on_attach = function(client, bufnr)
      lsp_format.on_attach(client)
      opts.buffer = bufnr

      vim.keymap.set("n", "gr", "<cmd>Telescope lsp_references<CR>", opts)       -- show definition, references
      vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)                   -- go to declaration
      vim.keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts)      -- show lsp definitions
      vim.keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts)  -- show lsp implementations
      vim.keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts) -- show lsp type definitions
      vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)  -- see available code actions, in visual mode will apply to selection
      vim.keymap.set("n", "<leader>cA", function()
        vim.lsp.buf.code_action({
          context = {
            only = {
              "source",
            },
            diagnostics = {},
          },
        })
      end, opts)
      vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)                       -- smart rename
      vim.keymap.set("n", "<leader>vD", "<cmd>Telescope diagnostics bufnr=0<CR>", opts) -- show  diagnostics for file
      vim.keymap.set("n", "<leader>vd", vim.diagnostic.open_float, opts)                -- show diagnostics for line
      vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)                         -- jump to previous diagnostic in buffer
      vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)                         -- jump to next diagnostic in buffer
      vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)                                 -- show documentation for what is under cursor
      vim.keymap.set("n", "<leader>rs", "<cmd>LspRestart<CR>", opts)                    -- mapping to restart lsp if necessary
    end

    local capabilities = cmp_nvim_lsp.default_capabilities()

    local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
    for type, icon in pairs(signs) do
      local hl = "DiagnosticSign" .. type
      vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
    end

    local vint = require("wkwhwh.efm.vint")
    local stylua = require("wkwhwh.efm.stylua")
    local luacheck = require("wkwhwh.efm.luacheck")
    local staticcheck = require("wkwhwh.efm.staticcheck")
    local go_vet = require("wkwhwh.efm.go_vet")
    local goimports = require("wkwhwh.efm.goimports")
    local black = require("wkwhwh.efm.black")
    local isort = require("wkwhwh.efm.isort")
    local flake8 = require("wkwhwh.efm.flake8")
    local mypy = require("wkwhwh.efm.mypy")
    local prettier = require("wkwhwh.efm.prettier")
    local eslint = require("wkwhwh.efm.eslint")
    local shellcheck = require("wkwhwh.efm.shellcheck")
    local shfmt = require("wkwhwh.efm.shfmt")
    local terraform = require("wkwhwh.efm.terraform")
    local misspell = require("wkwhwh.efm.misspell")
    local opa = require("wkwhwh.efm.opa")
    local cbfmt = require("wkwhwh.efm.cbfmt")

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

    lspconfig["html"].setup({
      capabilities = capabilities,
      on_attach = on_attach,
    })

    lspconfig["tsserver"].setup({
      capabilities = capabilities,
      on_attach = on_attach,
    })

    lspconfig["cssls"].setup({
      capabilities = capabilities,
      on_attach = on_attach,
    })

    lspconfig["tailwindcss"].setup({
      capabilities = capabilities,
      on_attach = on_attach,
    })

    lspconfig["svelte"].setup({
      capabilities = capabilities,
      on_attach = function(client, bufnr)
        on_attach(client, bufnr)

        vim.api.nvim_create_autocmd("BufWritePost", {
          pattern = { "*.js", "*.ts" },
          callback = function(ctx)
            if client.name == "svelte" then
              client.notify("$/onDidChangeTsOrJsFile", { uri = ctx.file })
            end
          end,
        })
      end,
    })

    lspconfig["prismals"].setup({
      capabilities = capabilities,
      on_attach = on_attach,
    })

    lspconfig["graphql"].setup({
      capabilities = capabilities,
      on_attach = on_attach,
      filetypes = { "graphql", "gql", "svelte", "typescriptreact", "javascriptreact" },
    })

    lspconfig["emmet_ls"].setup({
      capabilities = capabilities,
      on_attach = on_attach,
      filetypes = { "html", "typescriptreact", "javascriptreact", "css", "sass", "scss", "less", "svelte" },
    })

    lspconfig["pyright"].setup({
      capabilities = capabilities,
      on_attach = on_attach,
    })

    lspconfig["lua_ls"].setup({
      capabilities = capabilities,
      on_attach = on_attach,
      settings = { -- custom settings for lua
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
  end,
}
