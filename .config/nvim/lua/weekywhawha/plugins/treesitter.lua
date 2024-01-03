local setup, treesitter = pcall(require, "nvim-treesitter.configs")
if not setup then
  return
end

treesitter.setup({
  -- enable syntax highlighting
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = { "markdown" },
  },
  -- enable indentation
  indent = { enable = true },
  -- enable autotagging (w/ nvim-ts-autotag plugin)
  autotag = { enable = true },
  -- ensure these language parsers are installed
  ensure_installed = {
    "json",
    "javascript",
    "typescript",
    "tsx",
    "yaml",
    "html",
    "css",
    "markdown",
    "markdown_inline",
    "svelte",
    "graphql",
    "bash",
    "lua",
    "vim",
    "dockerfile",
    "gitignore",
    "rust"
  },
  context_commentstring = {
    languages = {
      javascript = {
        __default = '// %s',
        jsx_element = '{/* %s */}',
        jsx_fragment = '{/* %s */}',
        jsx_attribute = '// %s',
        comment = '// %s',
      },
      typescript = { __default = '// %s', __multiline = '/* %s */' },
    },
  },
})
