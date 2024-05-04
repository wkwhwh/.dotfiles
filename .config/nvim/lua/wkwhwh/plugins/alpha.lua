return {
  "goolord/alpha-nvim",
  event = "VimEnter",
  config = function()
    local alpha = require("alpha")
    local dashboard = require("alpha.themes.dashboard")

    -- Set header
    dashboard.section.header.val = {
      [[                                     ]],
      [[                                     ]],
      [[                                     ]],
      [[                                     ]],
      [[                                     ]],
      [[                                     ]],
      [[      __                _            ]],
      [[   /\ \ \___  ___/\   /(_)_ __ ___   ]],
      [[  /  \/ / _ \/ _ \ \ / | | '_ ` _ \  ]],
      [[ / /\  |  __| (_) \ V /| | | | | | | ]],
      [[ \_\ \/ \___|\___/ \_/ |_|_| |_| |_| ]],
      [[                                     ]],
      [[                                     ]],
      [[                                     ]],
      [[                                     ]],
      [[                                     ]],
      [[                                     ]],
    }

    -- Set menu
    dashboard.section.buttons.val = {
      dashboard.button("e", "  > New File", "<cmd>ene<CR>"),
      dashboard.button("-", "  > Toggle file explorer", "<cmd>Oil --float<CR>"),
      dashboard.button("󱁐 ff", "󰱼  > Find File", "<cmd>Telescope find_files<CR>"),
      dashboard.button("󱁐 fs", "  > Find Word", "<cmd>Telescope live_grep<CR>"),
      dashboard.button("󱁐 sr", "󰁯  > Restore Session For Current Directory", "<cmd>SessionRestore<CR>"),
      dashboard.button("q", "  > Quit NVIM", "<cmd>qa<CR>"),
    }

    -- Send config to alpha
    alpha.setup(dashboard.opts)

    -- Disable folding on alpha buffer
    vim.cmd([[autocmd FileType alpha setlocal nofoldenable]])
  end,
}
