-- https://github.com/astral-sh/ty
-- ty's language server (extremely fast Python type checker, written in Rust).
-- Install with `pip install ty` (or `uv tool install ty`). Runs alongside ruff:
-- ty does type checking, ruff does linting + formatting.

---@type vim.lsp.Config
return {
  cmd = { 'ty', 'server' },
  filetypes = { 'python' },
  root_markers = { 'ty.toml', 'pyproject.toml', 'setup.py', 'setup.cfg', 'requirements.txt', '.git' },
  -- pin utf-16 so it agrees with ruff when both attach to a python buffer
  capabilities = {
    general = {
      positionEncodings = { 'utf-16' },
    },
  },
}
