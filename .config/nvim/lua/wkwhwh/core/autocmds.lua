vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  pattern = "*.ejs",
  command = "set filetype=html",
})

vim.api.nvim_create_user_command("MacOSQuicklook", function()
  local oil = require("oil")
  local entry = oil.get_cursor_entry()
  if entry then
    vim.system({
      "open",
      "-a",
      "QLManage",
      "--args",
      "-p",
      oil.get_current_dir() .. entry.name
    }, {
      detach = true
    })
  else
    print("Can only do quicklook in Oil")
  end
end, {})
