return {
  'davidgranstrom/scnvim',
  config = function()
    local scnvim = require('scnvim')
    local map = scnvim.map
    local map_expr = scnvim.map_expr

    scnvim.setup {
      keymaps = {
        ['<C-e>'] = {
          map('editor.send_block', { 'i', 'n' }),
          map('editor.send_selection', 'x'),
        },
        ['<CR>'] = map('postwin.toggle'),
        ['<M-CR>'] = map('postwin.toggle', 'i'),
        ['<M-L>'] = map('postwin.clear', { 'n', 'i' }),
        ['<F12>'] = map('sclang.hard_stop', { 'n', 'x', 'i' }),
        ['<leader>st'] = map('sclang.start'),
        ['<leader>sk'] = map('sclang.recompile'),
        ['<leader>sp'] = map('sclang.stop'),
        ['<F1>'] = map_expr('s.boot'),
        ['<F2>'] = map_expr('s.meter'),
      },
    }
  end,
}
