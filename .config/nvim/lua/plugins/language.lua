return {
  -- configure lua for neovim
  {
    'folke/lazydev.nvim',
    ft = 'lua',
    opts = {},
  },
  -- rust goodies
  {
    'mrcjkb/rustaceanvim',
    version = '^6',
  },
  -- manage rust crates
  {
    'saecki/crates.nvim',
    event = 'BufRead Cargo.toml',
    opts = {
      lsp = {
        enabled = true,
        actions = true,
        completion = true,
        hover = true,
      },
    },
  },
  -- latex
  {
    'lervag/vimtex',
    ft = 'tex',
  },
  -- preview markdown on browser
  {
    'iamcco/markdown-preview.nvim',
    cmd = { 'MarkdownPreviewToggle', 'MarkdownPreview', 'MarkdownPreviewStop' },
    ft = 'markdown',
    build = function()
      vim.fn['mkdp#util#install']()
    end,
  },
}
