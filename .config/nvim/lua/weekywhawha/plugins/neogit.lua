local setup, neogit = pcall(require, "neogit")
if not setup then
  return
end

neogit.setup {
  kind = "split",
  integrations = {
    diffview = true
  },
}
