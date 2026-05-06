return {
  'nvim-telescope/telescope.nvim',
  dependencies = {
    'nvim-lua/plenary.nvim', -- async
    { -- See telescope-fzf-native README for installation instructions
      'nvim-telescope/telescope-fzf-native.nvim',
      build = 'make',
      cond = function()
        return vim.fn.executable 'make' == 1
      end,
    },
    { 'nvim-telescope/telescope-ui-select.nvim' }, -- sets vim.ui.select to telescope

    -- Useful for getting pretty icons, but requires a Nerd Font.
    { 'nvim-tree/nvim-web-devicons', enabled = vim.g.have_nerd_font },
  },
  config = function()
    require('telescope').setup {
      defaults = {
        file_ignore_patterns = {
          '.git/',
          '__pycache__',
          '%.mypy_cache',
          '%.pytest_cache',
          '%.ruff_cache',
        },
        mappings = {
          i = {
            ['<c-enter>'] = 'to_fuzzy_refine',
          },
          n = {
            ['<esc>'] = require('telescope.actions').close,
          },
        },
      },
      extensions = {
        ['ui-select'] = {
          require('telescope.themes').get_dropdown(),
        },
      },
    }

    -- Enable Telescope extensions if they are installed
    pcall(require('telescope').load_extension, 'fzf')
    pcall(require('telescope').load_extension, 'ui-select')
  end,
}
