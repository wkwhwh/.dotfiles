-- import nvim-autopairs safely
local autopairs_setup, autopairs = pcall(require, "nvim-autopairs")
if not autopairs_setup then
  return
end

-- configure autopairs
autopairs.setup({
  fast_wrap = {
    chars = { "{", "[", "(", '"', "'", "`" },
    map = "<C-l>",
    keys = "asdfghjklqwertyuiop",
    pattern = [=[[%'%"%)%>%]%)%}%,]]=],
    check_comma = true,
    end_key = "L",
    highlight = "PmenuSel",
    hightlight_grey = "NonText",
  },
  check_ts = true,
  enable_check_bracket_line = true,
})

-- import nvim-autopairs completion functionality safely
local cmp_autopairs_setup, cmp_autopairs = pcall(require, "nvim-autopairs.completion.cmp")
if not cmp_autopairs_setup then
  return
end

-- import nvim-cmp plugin safely (completions plugin)
local cmp_setup, cmp = pcall(require, "cmp")
if not cmp_setup then
  return
end

-- make autopairs and completion work together
cmp.event:on("confirm_done",
  cmp_autopairs.on_confirm_done({
    map_char = {
      tex = "",
    },
  }))
