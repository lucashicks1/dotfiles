lvim.plugins = {
  {"catppuccin/nvim", name="catppuccin", opts = {
    flavour = "mocha"
  }},

  {"lunarvim/colorschemes"},

  {"christoomey/vim-tmux-navigator"},

  {"tpope/vim-surround"},

  {"ThePrimeagen/harpoon"},

  {
    'phaazon/hop.nvim',
    branch = 'v2',
    config = function()
      require('hop').setup()
    end
  },

  {
    'nvim-telescope/telescope.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
    version = '0.1.4',
  },

  {
    'windwp/nvim-autopairs',
    config = function()
      require('nvim-autopairs').setup()
    end
  },

  {
  "kevinhwang91/rnvimr",
    cmd = "RnvimrToggle",
    config = function()
      vim.g.rnvimr_draw_border = 1
      vim.g.rnvimr_pick_enable = 1
      vim.g.rnvimr_bw_enable = 1
      end,
  },

  {
  "mrjones2014/nvim-ts-rainbow",
  },
}

lvim.builtin.treesitter.rainbow.enable = true
