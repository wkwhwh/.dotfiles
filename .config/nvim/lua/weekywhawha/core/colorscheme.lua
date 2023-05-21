-- set colorscheme to kanagawa with protected call
-- in case it isn't installed

-- import kanagawa plugin safely
local setup, kanagawa = pcall(require, "kanagawa")
if not setup then
  return
end

kanagawa.setup({
  compile = true,
  dimInactive = false,
  overrides = function(colors)
    local theme = colors.theme
    return {
      TelescopeTitle = { fg = theme.ui.special, bold = true },
      TelescopePromptNormal = { bg = theme.ui.bg_p1 },
      TelescopePromptBorder = { fg = theme.ui.bg_p1, bg = theme.ui.bg_p1 },
      TelescopeResultsNormal = { fg = theme.ui.fg_dim, bg = theme.ui.bg_m1 },
      TelescopeResultsBorder = { fg = theme.ui.bg_m1, bg = theme.ui.bg_m1 },
      TelescopePreviewNormal = { bg = theme.ui.bg_dim },
      TelescopePreviewBorder = { bg = theme.ui.bg_dim, fg = theme.ui.bg_dim },
      NormalFloat = { bg = "none" },
      FloatTitle = { bg = "none" },
      FloatBorder = { bg = "none" },
      LazyNormal = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },
      MasonNormal = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },
      Pmenu = { fg = theme.ui.shade0, bg = theme.ui.bg_p1, blend = vim.o.pumblend },
      PmenuSel = { fg = "NONE", bg = theme.ui.bg_p2 },
      PmenuSbar = { bg = theme.ui.bg_m1 },
      PmenuThumb = { bg = theme.ui.bg_p2 },
      NormalDark = { fg = theme.ui.fg_dim, bg = theme.ui.bg_m3 },
    }
  end,
})


local status, _ = pcall(vim.cmd, "colorscheme kanagawa")
if not status then
  print("Colorscheme not found!") -- print error if colorscheme not installed
  return
end
