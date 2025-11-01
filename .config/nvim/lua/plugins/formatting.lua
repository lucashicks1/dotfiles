return {
  'stevearc/conform.nvim',
  event = { 'BufWritePre' },
  cmd = { 'ConformInfo' },
  keys = {
    {
      '<leader>f',
      function()
        require('conform').format { async = true, lsp_format = 'fallback' }
      end,
      mode = '',
      desc = '[F]ormat buffer',
    },
  },
  opts = {
    notify_on_error = true,
    notify_no_formatters = true,
    format_on_save = {
      timeout_ms = 500,
      lsp_format = 'fallback',
    },
    formatters_by_ft = {
      -- Prog. Languages
      bash = { 'shfmt' },
      python = { 'ruff_format', 'ruff_fix', 'ruff_organize_imports' },
      go = { 'goimports', 'gofmt' },
      c = { 'clang-format ' },
      cpp = { 'clang-format ' },
      typscript = { 'prettierd', 'prettier', stop_after_first = true },
      lua = { 'stylua' },
      rust = { 'rustfmt' },

      -- Config langs
      docker = { 'dockerfmt' },
      terraform = { 'terraform_fmt' },
      typst = { 'prettypst' },

      -- General formatters
      ['*'] = { 'codespell' },
      ['_'] = { 'trim_whitespace' },
    },
  },
}
