local setup, neogit = pcall(require, "neogit")
if not setup then
  return
end

neogit.setup {
  kind                        = "split",
  console_timeout             = 10000,
  auto_show_console           = true,
  disable_hint                = true,
  disable_commit_confirmation = true,
  ignored_settings            = {
    "NeogitPushPopup--force-with-lease",
    "NeogitPushPopup--force",
    "NeogitCommitPopup--allow-empty",
  },
  integrations                = {
    diffview = true
  },
  signs                       = {
    section = { "", "" },
    item    = { "", "" },
  },
}
