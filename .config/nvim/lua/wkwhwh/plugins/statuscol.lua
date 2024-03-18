return {
  "luukvbaal/statuscol.nvim",
  config = function()
    local builtin = require("statuscol.builtin")
    require("statuscol").setup({
      -- configuration goes here, for example:
      relculright = true,
      segments = {
        {
          sign = { namespace = { "diagnostic" } },
          click = "v:lua.ScSa"
        },
        { text = { builtin.lnumfunc }, click = "v:lua.ScLa", },
        { text = { builtin.foldfunc }, click = "v:lua.ScFa" },
        {
          sign = { namespace = { "gitsign" }, wrap = true },
          click = "v:lua.ScSa"
        },
        {
          sign = { name = { ".*" }, wrap = true },
          click = "v:lua.ScSa"
        },
      }
    })
  end,
}
