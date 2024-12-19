return {
  'saghen/blink.cmp',
  lazy = false,
  dependencies = 'rafamadriz/friendly-snippets',
  version = 'v0.*',
  opts = {
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
      preset = 'default',
      ['<C-space>'] = {}
    },

    appearance = {
      use_nvim_cmp_as_default = true,
      nerd_font_variant = 'mono'
    },
    sources = {
      default = { 'lsp', 'path', 'snippets', 'buffer' },
    },
    signature = {
      enabled = true,
      window = {
        border = 'rounded',
      },
    }
  },
  opts_extend = { "sources.default" }
}
