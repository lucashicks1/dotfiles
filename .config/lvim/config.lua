-- Lua files
reload('user.plugins')
reload('user.dashboard')
reload('user.keybinds')
reload('user.which_key')

-- General Options
lvim.format_on_save.enabled = true
lvim.format_on_save.pattern = { "*.py" }
lvim.colorscheme = "catppuccin"
lvim.transparent_window = true

-- Treesitter
lvim.builtin.treesitter.ensure_installed = {
  "python",
  "lua",
  "yaml",
  "bash",
  "dockerfile",
}

-- Help nvim know what project you're in
lvim.builtin.project.patterns = {
  ".git",
  "pyproject.toml",
  "requirements.txt"
}

-- Python 
local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup { { name = "black" }, }

local linters = require "lvim.lsp.null-ls.linters"
linters.setup { { command = "ruff",  } }
