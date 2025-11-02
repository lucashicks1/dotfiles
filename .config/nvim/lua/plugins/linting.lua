-- https://github.com/mfussenegger/nvim-lint?tab=readme-ov-file#available-linters
local linters = {
  python = { 'ruff', 'mypy' },
  terraform = { 'tflint' },
  makefile = { 'bake' },
}

return {
  { -- Linting
    'mfussenegger/nvim-lint',
    event = { 'BufReadPre', 'BufNewFile' },
    config = function()
      local lint = require 'lint'
      lint.linters_by_ft = linters
      -- Create autocommand which carries out the actual linting
      local lint_augroup = vim.api.nvim_create_augroup('lint', { clear = true })
      vim.api.nvim_create_autocmd({ 'BufEnter', 'BufWritePost', 'InsertLeave' }, {
        group = lint_augroup,
        callback = function()
          -- Only try to lint on modifiable buffers
          if vim.bo.modifiable then
            lint.try_lint()
          end
        end,
      })
    end,
  },
}
