return {
  "saghen/blink.cmp",
  lazy = false,
  dependencies = {
    {
      "L3MON4D3/LuaSnip",
      dependencies = {
        "rafamadriz/friendly-snippets",
      },
      version = "v2.*",
      config = function()
        require("luasnip.loaders.from_vscode").lazy_load()
        require("luasnip").add_snippets("supercollider", require("scnvim/utils").get_snippets())
        require("luasnip.loaders.from_vscode").load({
          paths = { vim.fn.stdpath("config") .. "/snippets" },
        })
      end,
    },
  },
  version = "*",
  build = "cargo build --release",
  opts = {
    snippets = { preset = "luasnip" },
    sources = {
      default = { "lsp", "path", "snippets", "buffer" },
    },
    completion = {
      documentation = {
        auto_show = true,
        auto_show_delay_ms = 50,
      },
      accept = {
        auto_brackets = {
          enabled = true,
        },
      },
    },
    keymap = {
      preset = "default",
      ['<C-e>'] = { 'show', 'show_documentation', 'hide_documentation' },
      ['<C-y>'] = { 'hide' },
      ['<Tab>'] = { 'select_and_accept', 'fallback' },

      ['<Up>'] = {},
      ['<Down>'] = {},
      ['<C-p>'] = { 'select_prev', 'fallback' },
      ['<C-n>'] = { 'select_next', 'fallback' },

      ['<C-u>'] = { 'scroll_documentation_up', 'fallback' },
      ['<C-d>'] = { 'scroll_documentation_down', 'fallback' },

      ['<C-l>'] = { 'snippet_forward', 'fallback' },
      ['<C-h>'] = { 'snippet_backward', 'fallback' },

      ['<C-k>'] = { 'show_signature', 'hide_signature', 'fallback' },
    },
    appearance = {
      use_nvim_cmp_as_default = true,
      nerd_font_variant = "mono",
    },
    signature = {
      enabled = true,
      window = {
        border = "rounded",
      },
    },
  },
  opts_extend = { "sources.default" },
}
