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
  integrations                = {
    diffview = true
  },
  signs                       = {
    section = { "", "" },
    item    = { "", "" },
  },
}
