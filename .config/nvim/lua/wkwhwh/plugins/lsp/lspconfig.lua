return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "saghen/blink.cmp",
    { "antosha417/nvim-lsp-file-operations", config = true },
  },
  config = function()
    local blink_cmp = require("blink.cmp")

    -- Configure floating window borders
    local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
    function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
      opts = opts or {}
      opts.border = "rounded"
      return orig_util_open_floating_preview(contents, syntax, opts, ...)
    end

    -- Helper function to check if LSP client supports a method
    local function has_capability(bufnr, method)
      if type(method) == "table" then
        for _, m in ipairs(method) do
          if has_capability(bufnr, m) then
            return true
          end
        end
        return false
      end
      method = method:find("/") and method or "textDocument/" .. method
      local clients = vim.lsp.get_clients({ bufnr = bufnr })
      for _, client in ipairs(clients) do
        if client.supports_method(method) then
          return true
        end
      end
      return false
    end

    -- Diagnostic navigation helper
    local function diagnostic_goto(next, severity)
      local go = next and vim.diagnostic.goto_next or vim.diagnostic.goto_prev
      severity = severity and vim.diagnostic.severity[severity] or nil
      return function()
        go({ severity = severity })
      end
    end

    -- Centralized keymap setup function
    local function setup_buffer_keymaps(bufnr)
      local opts = { noremap = true, silent = true, buffer = bufnr }

      -- LSP keybinds with capability checking
      local lsp_keybinds = {
        { "<leader>cl", function() Snacks.picker.lsp_config() end,            desc = "Lsp Info" },
        { "gd",         function() Snacks.picker.lsp_definitions() end,       desc = "Goto Definition" },
        { "gD",         function() Snacks.picker.lsp_declarations() end,      desc = "Goto Declaration" },
        { "gr",         function() Snacks.picker.lsp_references() end,        nowait = true,                       desc = "References" },
        { "gI",         function() Snacks.picker.lsp_implementations() end,   desc = "Goto Implementation" },
        { "gy",         function() Snacks.picker.lsp_type_definitions() end,  desc = "Goto T[y]pe Definition" },
        { "<leader>ss", function() Snacks.picker.lsp_symbols() end,           desc = "LSP Symbols" },
        { "<leader>sS", function() Snacks.picker.lsp_workspace_symbols() end, desc = "LSP Workspace Symbols" },
        { "K",          vim.lsp.buf.hover,                                    desc = "Hover" },
        { "gK",         vim.lsp.buf.signature_help,                           desc = "Signature Help",             has = "signatureHelp" },
        { "<c-k>",      vim.lsp.buf.signature_help,                           desc = "Signature Help",             mode = "i",           has = "signatureHelp" },
        { "<leader>ca", vim.lsp.buf.code_action,                              desc = "Code Action",                mode = { "n", "v" },  has = "codeAction" },
        { "<leader>cc", vim.lsp.codelens.run,                                 desc = "Run Codelens",               mode = { "n", "v" },  has = "codeLens" },
        { "<leader>cC", vim.lsp.codelens.refresh,                             desc = "Refresh & Display Codelens", mode = { "n" },       has = "codeLens" },
        { "<leader>cr", vim.lsp.buf.rename,                                   desc = "Rename",                     has = "rename" },
        {
          "<leader>cA",
          function()
            vim.lsp.buf.code_action({
              context = { only = { "source" }, diagnostics = {} },
            })
          end,
          desc = "Source Action",
          has = "codeAction"
        }
      }

      -- Set LSP keybinds with capability checking
      for _, keys in ipairs(lsp_keybinds) do
        local has_cap = not keys.has or has_capability(bufnr, keys.has)
        if has_cap then
          local key_opts = vim.tbl_extend("force", opts, {
            desc = keys.desc,
            nowait = keys.nowait,
          })
          vim.keymap.set(keys.mode or "n", keys[1], keys[2], key_opts)
        end
      end

      -- Diagnostic navigation keybinds (always available)
      local diagnostic_keybinds = {
        { "[d",         diagnostic_goto(false),          desc = "Prev Diagnostic" },
        { "]d",         diagnostic_goto(true),           desc = "Next Diagnostic" },
        { "[e",         diagnostic_goto(false, "ERROR"), desc = "Prev Error" },
        { "]e",         diagnostic_goto(true, "ERROR"),  desc = "Next Error" },
        { "[w",         diagnostic_goto(false, "WARN"),  desc = "Prev Warning" },
        { "]w",         diagnostic_goto(true, "WARN"),   desc = "Next Warning" },
        { "<leader>cd", vim.diagnostic.open_float,       desc = "Show Line Diagnostics" },
      }

      for _, keys in ipairs(diagnostic_keybinds) do
        local key_opts = vim.tbl_extend("force", opts, { desc = keys.desc })
        vim.keymap.set("n", keys[1], keys[2], key_opts)
      end
    end

    -- Shared on_attach function (renamed for clarity)
    local global_on_attach = function(client, bufnr)
      setup_buffer_keymaps(bufnr)
    end

    -- Get capabilities from blink.cmp
    local capabilities = blink_cmp.get_lsp_capabilities()

    -- Configure diagnostics
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
        linehl = {},
        numhl = {},
      },
      update_in_insert = true,
      severity_sort = true,
      virtual_text = { prefix = "•" },
    })

    -- Server configurations
    local servers = {
      eslint = {},
      html = {},
      ts_ls = {},
      cssls = {},
      tailwindcss = {},
      prismals = {},
      graphql = {},
      pyright = {},
      rust_analyzer = {},
      lua_ls = {},
      svelte = {},
    }

    -- Setup servers with shared configuration
    for server, opts in pairs(servers) do
      -- Merge the user's server-specific config (like filetypes, custom settings, etc.)
      -- This will overwrite 'on_attach' or 'capabilities' if they are defined in user_server_config.
      local cfg = vim.tbl_deep_extend("force", {
        on_attach    = global_on_attach,
        capabilities = capabilities,
      }, opts)

      vim.lsp.config(server, cfg)
    end
  end,
}
