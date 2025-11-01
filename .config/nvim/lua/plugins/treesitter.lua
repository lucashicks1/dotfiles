return {
  'nvim-treesitter/nvim-treesitter',
  build = ':TSUpdate',
  opt = {
    ensure_installed = {
      'bash',
      'c',
      'diff',
      'lua',
      'luadoc',
      'markdown',
      'vim',
      'vimdoc',
      'python',
      'go',
      'yaml',
      'json',
      'rust',
    },
    sync_install = true,
    highlight = { enable = true },
    indent = { enable = true },
  },
}
