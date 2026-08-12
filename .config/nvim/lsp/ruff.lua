-- https://github.com/astral-sh/ruff
-- Ruff's built-in language server (linter + formatter). Install with `pip install ruff`.
-- Server settings go under `init_options.settings` (see ruff docs), not `settings`.

---@type vim.lsp.Config
return {
  cmd = { 'ruff', 'server' },
  filetypes = { 'python' },
  root_markers = { 'pyproject.toml', 'ruff.toml', '.ruff.toml', '.git' },
  -- ruff only speaks utf-16; pin it so it doesn't clash with another python LS
  capabilities = {
    general = {
      positionEncodings = { 'utf-16' },
    },
  },
  settings = {},
}
