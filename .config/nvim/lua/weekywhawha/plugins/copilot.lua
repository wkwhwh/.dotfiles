local setup, copilot = pcall(require, "copilot")
if not setup then
  return
end

copilot.setup({
  panel = {
    enabled = true,
    auto_refresh = true,
  },
  suggestion = {
    enabled = true,
    auto_trigger = true,
    accept = false, -- disable built-in keymapping
  },
})
