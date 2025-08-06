return {
  'numToStr/Comment.nvim',
  opts = {
    -- add any options here
  },

  config = function()
    -- Ctrl+'/' to comment
    vim.keymap.set('n', '<C-_>', function()
      require('Comment.api').toggle.linewise.current()
    end, { noremap = true, silent = true })
  end,
}
