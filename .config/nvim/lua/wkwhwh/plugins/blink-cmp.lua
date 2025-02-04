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
      ["<C-space>"] = {},
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
