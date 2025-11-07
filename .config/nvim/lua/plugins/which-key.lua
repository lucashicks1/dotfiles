return {
  'folke/which-key.nvim',
  event = 'VeryLazy',
  init = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 300
  end,
  config = function()
    local wk = require 'which-key'
    wk.setup { preset = 'helix' }

    wk.add {
      { '<leader>g', group = 'LSP: Goto' },
      { '<leader>c', group = 'LSP: Code' },
      { '<leader>l', group = 'LSP: Info' },
      { '<leader>x', group = 'Diagnostics:' },
      { '<leader>s', group = 'Search:' },
      { '<leader>D', group = 'Debug:' },
      { '<leader>p', group = 'Preview:' },
      {
        '<leader>?',
        function()
          wk.show { global = false }
        end,
        desc = 'Buffer Local Keymaps',
      },
    }
  end,
}
