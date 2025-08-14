return {
  {
    'akinsho/toggleterm.nvim',
    version = '*',
    opts = {},
    config = {
      vim.keymap.set('n', '\\', '<CMD>ToggleTerm direction=float<CR>', { desc = 'Open parent directory' }),
    },
  },
}
