return {
  'catppuccin/nvim',
  name = 'catppuccin',
  priority = 1000, -- Make sure to load this before all the other start plugins.
  config = function()
    require('catppuccin').setup {
      flavour = 'mocha',
      background = { -- :h background
        light = 'latte',
        dark = 'mocha',
      },
      float = {
        transparent = false, -- enable transparent floating windows
        solid = false, -- use solid styling for floating windows, see |winborder|
      },
      auto_integrations = true,
      integrations = {
        cmp = true,
        gitsigns = true,
        nvimtree = true,
        notify = true,
        dap = true,
        blink_cmp = {
          enabled = true,
          style = 'bordered',
        },
        mini = {
          enabled = true,
        },
        barbar = true,
        treesitter_context = true,
        telescope = {
          enabled = true,
        },
        lsp_trouble = true,
      },
    }

    vim.cmd.colorscheme 'catppuccin-mocha'
  end,
}
