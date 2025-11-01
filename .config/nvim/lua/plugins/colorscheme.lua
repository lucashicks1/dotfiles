return {
  'catppuccin/nvim',
  name = 'catppuccin',
  priority = 1000, -- Make sure to load this before all the other start plugins.
  config = function()
    require('catppuccin').setup {
      styles = {
        comments = { 'italic' }, -- Disable italics in comments
      },
      flavour = 'mocha',
      integrations = {
        cmp = true,
        gitsigns = true,
        nvimtree = true,
        mini = {
          enabled = true,
        },
      },
    }

    vim.cmd.colorscheme 'catppuccin-mocha'
  end,
}
