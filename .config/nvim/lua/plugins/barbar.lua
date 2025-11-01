return {
  {
    'romgrk/barbar.nvim',
    dependencies = {
      'lewis6991/gitsigns.nvim',
      'nvim-tree/nvim-web-devicons',
    },
    init = function()
      vim.g.barbar_auto_setup = false
    end,
    opts = {
      animation = false,
      clickable = true,
      tabpages = true,
      focus_on_close = 'left',
      icons = {
        filetype = {
          enabled = false,
        },
      },
    },
  },
}
