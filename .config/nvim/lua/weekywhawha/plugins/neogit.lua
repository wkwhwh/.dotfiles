local setup, neogit = pcall(require, "neogit")
if not setup then
  return
end

neogit.setup {
  console_timeout             = 10000,
  auto_show_console           = true,
  disable_hint                = true,
  disable_commit_confirmation = true,
  ignored_settings            = {
    "NeogitPushPopup--force-with-lease",
    "NeogitPushPopup--force",
    "NeogitCommitPopup--allow-empty",
  },
  commit_popup                = {
    kind = "auto"
  },
  signs                       = {
    section = { "", "" },
    item    = { "", "" },
  },
}
