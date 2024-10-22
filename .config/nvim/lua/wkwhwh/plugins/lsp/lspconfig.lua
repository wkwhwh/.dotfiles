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
    -- local lsp_format = require("lsp-format")

    local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
    function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
      opts = opts or {}
      opts.border = "rounded"
      return orig_util_open_floating_preview(contents, syntax, opts, ...)
    end

    local opts = { noremap = true, silent = true }
    local on_attach = function(client, bufnr)
      -- lsp_format.on_attach(client)
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
      vim.keymap.set("n", "<leader>cr", vim.lsp.buf.rename, opts)        -- smart rename
      vim.keymap.set("n", "<leader>cd", vim.diagnostic.open_float, opts) -- show diagnostics for line

      local diagnostic_goto = function(next, severity)
        local go = next and vim.diagnostic.goto_next or vim.diagnostic.goto_prev
        severity = severity and vim.diagnostic.severity[severity] or nil
        return function()
          go({ severity = severity })
        end
      end
      vim.keymap.set("n", "[d", diagnostic_goto(false), opts) -- jump to previous diagnostic in buffer
      vim.keymap.set("n", "]d", diagnostic_goto(true), opts)  -- jump to next diagnostic in buffer
      vim.keymap.set("n", "[e", diagnostic_goto(false, "ERROR"), opts)
      vim.keymap.set("n", "]e", diagnostic_goto(true, "ERROR"), opts)
      vim.keymap.set("n", "[w", diagnostic_goto(false, "WARN"), opts)
      vim.keymap.set("n", "]w", diagnostic_goto(true, "WARN"), opts)

      vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)              -- show documentation for what is under cursor
      vim.keymap.set("n", "<leader>dr", "<cmd>LspRestart<CR>", opts) -- mapping to restart lsp if necessary

      vim.g["diagnostics_active"] = true
      local toggle_diagnostic = function()
        if vim.g.diagnostics_active then
          vim.g.diagnostics_active = false
          vim.diagnostic.disable()
        else
          vim.g.diagnostics_active = true
          vim.diagnostic.enable()
        end
      end

      vim.keymap.set("n", "<leader>dd", toggle_diagnostic, opts)
    end

    local capabilities = cmp_nvim_lsp.default_capabilities()

    vim.diagnostic.config({
      float = {
        source = "always",
        border = vim.g.FloatBorders,
        title = "Diagnostics",
        title_pos = "left",
        header = "",
      },
      underline = true,
      signs = {
        text = {
          [vim.diagnostic.severity.ERROR] = "",
          [vim.diagnostic.severity.WARN] = "",
          [vim.diagnostic.severity.INFO] = "",
          [vim.diagnostic.severity.HINT] = "",
        },
        linehl = {
          [vim.diagnostic.severity.ERROR] = "",
          [vim.diagnostic.severity.WARN] = "",
          [vim.diagnostic.severity.INFO] = "",
          [vim.diagnostic.severity.HINT] = "",
        },
        numhl = {
          [vim.diagnostic.severity.ERROR] = "",
          [vim.diagnostic.severity.WARN] = "",
          [vim.diagnostic.severity.INFO] = "",
          [vim.diagnostic.severity.HINT] = "",
        },
      },
      update_in_insert = true,
      severity_sort = true,
      virtual_text = {
        prefix = "•",
      },
    })

    lspconfig["eslint"].setup({
      capabilities = capabilities,
      on_attach = on_attach,
      filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact", "vue", "svelte" },
      settings = {
        workingDirectory = { mode = "auto" },
        format = true,
      },
    })

    lspconfig["html"].setup({
      capabilities = capabilities,
      on_attach = on_attach,
    })

    lspconfig["ts_ls"].setup({
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

        if client.name == "svelte" then
          vim.api.nvim_create_autocmd("BufWritePost", {
            pattern = { "*.js", "*.ts" },
            group = vim.api.nvim_create_augroup("svelte_ondidchangetsorjsfile", { clear = true }),
            callback = function(ctx)
              -- Here use ctx.match instead of ctx.file
              client.notify("$/onDidChangeTsOrJsFile", { uri = ctx.match })
            end,
          })
        end
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

    lspconfig["pyright"].setup({
      capabilities = capabilities,
      on_attach = on_attach,
    })

    lspconfig["rust_analyzer"].setup({
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
