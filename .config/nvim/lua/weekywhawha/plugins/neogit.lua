local setup, neogit = pcall(require, "neogit")
if not setup then
  return
end

neogit.setup {
  console_timeout             = 10000,
  disable_hint                = true,
  disable_commit_confirmation = true,
  signs                       = {
    section = { "", "" },
    item    = { "", "" },
  },
}
