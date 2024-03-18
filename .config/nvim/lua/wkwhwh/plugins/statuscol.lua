return {
  "luukvbaal/statuscol.nvim",
  config = function()
    local builtin = require("statuscol.builtin")
    require("statuscol").setup({
      relculright = true,
      bt_ignore = { "nofile" },
      segments = {
        { text = { builtin.foldfunc }, click = "v:lua.ScFa" },
        {
          sign = { namespace = { "diagnostic" } },
          click = "v:lua.ScSa"
        },
        { text = { builtin.lnumfunc }, click = "v:lua.ScLa", },
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
