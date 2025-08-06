return {
  {
    'stevearc/oil.nvim',
    dependencies = { { 'echasnovski/mini.icons', opts = {} } },
    lazy = false,
    opts = {
      default_file_explorer = true,
      columns = {
        'type',
        'icon',
      },
      buf_options = {
        buflisted = false,
        bufhidden = 'hide',
      },
      skip_confirm_for_simple_edits = true,
      lsp_file_methods = {
        enabled = true, -- Enable or disable LSP file operations
        timeout_ms = 1000, -- Time to wait for LSP file operations to complete before skipping
        autosave_changes = false,
      },

      view_options = {
        show_hidden = true,
      },
    },
    config = function()
      require('oil').setup {} -- make sure oil is loaded
      -- then do the keymap
      vim.keymap.set('n', '-', '<CMD>Oil<CR>', { desc = 'Open parent directory' })
    end,
  },
  -- LSP diags
  {
    'JezerM/oil-lsp-diagnostics.nvim',
    dependencies = { 'stevearc/oil.nvim' },
    opts = {},
  },
  -- git status extension for oil
}
