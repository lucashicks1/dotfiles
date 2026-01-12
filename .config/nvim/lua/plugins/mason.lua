-- Tooling so things like lsps and formatters + linters are installed and setup
return {
  {
    'williamboman/mason.nvim',
    cmd = { 'Mason', 'MasonInstall', 'MasonUninstall', 'MasonUpdate' },
    opts = {
      ui = {
        icons = {
          package_installed = '✓',
          package_pending = '➜',
          package_uninstalled = '✗',
        },
      },
    },
  },
  {
    'williamboman/mason-lspconfig.nvim',
    dependencies = { { 'williamboman/mason.nvim', opts = {} } },
    event = { 'BufReadPre', 'BufNewFile' },
    opts = {
      -- list of lsp for mason to install
      ensure_installed = {
        -- Languages
        'bashls', -- Bash

        -- Python
        'basedpyright',

        'gopls', -- Go
        -- 'rust-analyzer', -- THIS IS ALREADY HANDLED BY RUSTACEANNVIM
        'ts_ls', -- Typescript (just in case)
        'lua_ls', -- Lua

        -- Markup/Config
        'tinymist', -- Typst
        'marksman', -- Markdown
        'dockerls', -- Docker
        'jsonls', -- JSON
        'yamlls', -- Yaml
      },
    },
  },
  {
    'WhoIsSethDaniel/mason-tool-installer.nvim',
    dependencies = { { 'williamboman/mason.nvim', opts = {} } },
    event = { 'BufReadPre', 'BufNewFile' },
    opts = {
      -- list of formatter and linter for mason to install
      ensure_installed = {
        -- Languages
        'shfmt', -- sh formatter with bash support

        -- Python
        'ruff',

        'goimports', -- Go
        'eslint', -- Typescript
        'prettierd', -- Prettierd
        'stylua', -- Lua

        -- Config
        'prettypst', -- Typst
        'mbake', -- Makefiles
      },
    },
  },
}
