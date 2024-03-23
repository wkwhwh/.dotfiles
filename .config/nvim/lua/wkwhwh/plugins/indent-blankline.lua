return {
  "lukas-reineke/indent-blankline.nvim",
  main = "ibl",
  opts = {},
  config = function()
    local indent = require("ibl")
    indent.setup({
      scope = {
        show_start = false,
        show_end = false,
      },
      indent = { char = "▏" },
    })
  end,
}
