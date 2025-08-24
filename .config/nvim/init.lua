--[[

Kickstart helpful commands:
- `:Tutor` - help of course
- `:help` - getting more help
- `:checkhealth` - checking if you need help or not
]]
--

require 'set' -- settings
require 'keymap' -- keymaps

local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  local out = vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
  if vim.v.shell_error ~= 0 then
    error('Error cloning lazy.nvim:\n' .. out)
  end
end

local rtp = vim.opt.rtp
rtp:prepend(lazypath)

require('lazy').setup({

  -- COLOUR SCHEME
  {
    'catppuccin/nvim',
    name = 'catppuccin',
    priority = 1000, -- Make sure to load this before all the other start plugins.
    config = function()
      ---@diagnostic disable-next-line: missing-fields
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
  },

  { import = 'kickstart.plugins' }, -- kickstart plugins
  { import = 'custom.plugins' }, -- custom plugins
  require 'lsp', -- lsp

  'NMAC427/guess-indent.nvim',
  { 'folke/todo-comments.nvim', event = 'VimEnter', dependencies = { 'nvim-lua/plenary.nvim' }, opts = { signs = false } },
}, {
  ui = {
    icons = {},
  },
})
