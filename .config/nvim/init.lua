---=====================
--- Options
---=====================
vim.o.number = true -- show line nums
vim.o.relativenumber = true -- relative line nums
vim.o.cursorline = true -- highlight current line
vim.o.wrap = true
vim.o.breakindent = true
vim.o.scrolloff = 12 -- number of screen lines to keep above and below the cursor.
vim.o.sidescrolloff = 12 -- keep 12 lines left/right of cursor

vim.o.tabstop = 2 -- tab width
vim.o.shiftwidth = 2 -- indent width
vim.o.softtabstop = 2 -- soft tab stops not tabs
vim.o.expandtab = true -- use spaces instead of tabs
vim.o.smartindent = true -- smart
vim.o.autoindent = true -- copy indent from current line

vim.o.ignorecase = true -- Searching
vim.o.smartcase = true -- case sensitive if uppercase in string
vim.o.hlsearch = true -- highlight
vim.o.incsearch = true -- incremental search

vim.o.termguicolors = true
vim.o.signcolumn = "yes" -- always show a sign column
vim.o.colorcolumn = "120" -- show a column at 100 position chars
vim.o.showmatch = true -- highlights matching brackets
vim.o.cmdheight = 1 -- single line command line
vim.o.completeopt = "menuone,noinsert,noselect" -- completion options
vim.o.showmode = false -- do not show the mode, instead have it in statusline

vim.o.pumheight = 10 -- popup menu height
vim.o.pumblend = 10 -- popup menu transparency
vim.o.winblend = 0 -- floating window transparency
vim.o.conceallevel = 2 -- obsidian requirement
vim.o.concealcursor = "" -- do not hide cursorline in markup
vim.o.synmaxcol = 300 -- syntax highlighting limit
vim.opt.fillchars = { eob = " " } -- hide "~" on empty lines

-- providers
vim.g.loaded_python3_provider = 0
vim.g.loaded_ruby_provider = 0
vim.g.loaded_perl_provider = 0
vim.g.loaded_node_provider = 0

-- misc
vim.g.have_nerd_font = true -- toggles nerd-font icons (diagnostics, etc.)
vim.o.clipboard = 'unnamedplus' -- Sync clipboard between OS and Neovim.
vim.o.updatetime = 250 -- Decrease update time
vim.o.timeoutlen = 300 -- Decrease mapped sequence wait time
vim.o.splitright = true -- vert. splits open right
vim.o.splitbelow = true -- hori. splits open below
vim.o.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }
vim.o.inccommand = 'split'
vim.o.confirm = true -- if performing op that would fail due to unsaved changes (like `:q`) show a dialog asking if you wish to save the current file(s)
vim.o.undofile = true -- Save undo history
vim.o.mouse = 'a' -- Enable mouse mode

-- leaders (set before plugins so mappings pick them up)
vim.g.mapleader = ' '
vim.g.maplocalleader = '\\'


---=====================
--- Plugins
---=====================
local pack_build = {
  ['blink.cmp'] = function() require('blink.cmp').build():pwait() end,
  ['nvim-treesitter'] = function() require('nvim-treesitter').update() end,
  ['telescope-fzf-native.nvim'] = function(ev)
    if vim.fn.executable('make') == 1 then
      vim.system({ 'make' }, { cwd = ev.data.path }):wait()
    end
  end,
}
vim.api.nvim_create_autocmd('PackChanged', {
  callback = function(ev)
    local hook = pack_build[ev.data.spec.name]
    if hook and (ev.data.kind == 'install' or ev.data.kind == 'update') then
      hook(ev)
    end
  end,
})

vim.pack.add({
  -- colorscheme
  { src = "https://github.com/ellisonleao/gruvbox.nvim" },

  -- core
  { src = "https://github.com/romgrk/barbar.nvim" },
  { src = "https://github.com/nvim-telescope/telescope.nvim" },
  { src = "https://github.com/nvim-lua/plenary.nvim" }, -- telescope dep (async)
  { src = "https://github.com/nvim-telescope/telescope-fzf-native.nvim" },
  { src = "https://github.com/nvim-telescope/telescope-ui-select.nvim" },
  { src = "https://github.com/nvim-mini/mini.nvim" },
  { src = "https://github.com/stevearc/oil.nvim" },
  { src = "https://github.com/nvim-treesitter/nvim-treesitter", version = "main" },
  { src = "https://github.com/Saghen/blink.cmp" },
  { src = "https://github.com/Saghen/blink.lib" },

  -- editing / formatting
  { src = "https://github.com/stevearc/conform.nvim" },

  -- utils
  { src = "https://github.com/folke/which-key.nvim" },
  { src = "https://github.com/christoomey/vim-tmux-navigator" },
  { src = "https://github.com/wakatime/vim-wakatime" },
})


-- PLUGIN - mini.nvim
require('mini.icons').setup()
MiniIcons.mock_nvim_web_devicons() -- lets barbar/oil/telescope use mini.icons
require('mini.ai').setup { n_lines = 500 }
require('mini.move').setup()
require('mini.pairs').setup()
require('mini.surround').setup()
require('mini.trailspace').setup()
require('mini.bracketed').setup()
require('mini.cursorword').setup()


-- PLUGIN - gruvbox (colorscheme)
vim.o.background = 'dark'
require('gruvbox').setup({ italic = { strings = false } })
vim.cmd.colorscheme('gruvbox')


-- PLUGIN - barbar
vim.g.barbar_auto_setup = false
require("barbar").setup({
  animation = false,
  clickable = true,
  tabpages = true,
  focus_on_close = "left",
  icons = {
    filetype = {
      enabled = false,
    },
  },
})


-- PLUGIN - telescope
local telescope = require('telescope')
local tele_builtin = require('telescope.builtin') -- used by keymaps below
telescope.setup({
  defaults = {
    file_ignore_patterns = {
      '%.git/',
      '__pycache__',
      '%.mypy_cache',
      '%.pytest_cache',
      '%.ruff_cache',
      '%.venv/',
      'node_modules/',
      '%.DS_Store',
      'target/', -- rust
      'dist/',
      'build/',
    },
    mappings = {
      i = {
        ['<c-enter>'] = 'to_fuzzy_refine',
      },
      n = {
        ['<esc>'] = require('telescope.actions').close,
      },
    },
  },
  extensions = {
    ['ui-select'] = {
      require('telescope.themes').get_dropdown(),
    },
  },
})

-- Enable telescope extensions if they are installed
pcall(telescope.load_extension, 'fzf') -- native fzf sorter (needs `make` build)
pcall(telescope.load_extension, 'ui-select') -- routes vim.ui.select through telescope


-- PLUGIN - oil
local OIL_ALWAYS_HIDDEN = {
  __pycache__ = true,
  [".mypy_cache"] = true,
  [".pytest_cache"] = true,
  [".ruff_cache"] = true,
  [".venv"] = true,
  node_modules = true,
}
require('oil').setup({
  default_file_explorer = true,
  delete_to_trash = true,
  skip_confirm_for_simple_edits = true,
  view_options = {
    show_hidden = true,
    is_always_hidden = function(name, _)
      return OIL_ALWAYS_HIDDEN[name] or false
    end,
  },
  columns = {
    'icon',
  },
  keymaps = {
    ['<C-h>'] = '<cmd>TmuxNavigateLeft<cr>',
    ['<C-j>'] = '<cmd>TmuxNavigateDown<cr>',
    ['<C-k>'] = '<cmd>TmuxNavigateUp<cr>',
    ['<C-l>'] = '<cmd>TmuxNavigateRight<cr>',
    ['-'] = { 'actions.parent', mode = 'n' },
  },
})


-- PLUGIN - treesitter
require('nvim-treesitter').install({
  "bash",
  "c",
  "diff",
  "lua",
  "markdown",
  "markdown_inline",
  "vim",
  "vimdoc",
  "python",
  "yaml",
  "json",
  "toml",
  "rust",
  "typst",
})
vim.api.nvim_create_autocmd('FileType', {
  desc = 'Enable treesitter highlighting/indent where a parser exists',
  callback = function()
    if pcall(vim.treesitter.start) then
      vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
    end
  end,
})


-- PLUGIN - blink.cmp (completion)
require('blink.cmp').setup({
  keymap = { preset = 'enter' },
  appearance = { nerd_font_variant = 'mono' },
  completion = {
    documentation = { auto_show = true, auto_show_delay_ms = 500 },
    ghost_text = { enabled = true },
  },
  sources = {
    default = { 'lsp', 'path', 'snippets' },
  },
  fuzzy = { implementation = 'prefer_rust_with_warning' },
  signature = { enabled = true },
})


-- PLUGIN - LSP
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('lsp-attach', { clear = true }),
  callback = function(event)
    local client = vim.lsp.get_client_by_id(event.data.client_id)
    if client and client:supports_method(vim.lsp.protocol.Methods.textDocument_documentHighlight, event.buf) then
      local highlight_augroup = vim.api.nvim_create_augroup('lsp-highlight', { clear = false })
      vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
        buffer = event.buf,
        group = highlight_augroup,
        callback = vim.lsp.buf.document_highlight,
      })
      vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
        buffer = event.buf,
        group = highlight_augroup,
        callback = vim.lsp.buf.clear_references,
      })
      vim.api.nvim_create_autocmd('LspDetach', {
        group = vim.api.nvim_create_augroup('lsp-detach', { clear = true }),
        callback = function(event2)
          vim.lsp.buf.clear_references()
          vim.api.nvim_clear_autocmds { group = 'lsp-highlight', buffer = event2.buf }
        end,
      })
    end
  end,
})

vim.diagnostic.config {
  severity_sort = true,
  float = { border = 'rounded', source = 'if_many' },
  underline = { severity = vim.diagnostic.severity.ERROR },
  signs = vim.g.have_nerd_font and {
    text = {
      [vim.diagnostic.severity.ERROR] = '󰅚 ',
      [vim.diagnostic.severity.WARN] = '󰀪 ',
      [vim.diagnostic.severity.INFO] = '󰋽 ',
      [vim.diagnostic.severity.HINT] = '󰌶 ',
    },
  } or {},
  virtual_text = {
    source = 'if_many',
    spacing = 2,
    format = function(diagnostic)
      return diagnostic.message
    end,
  },
}

-- config lives in `lsp/<name>.lua`
vim.lsp.enable({ 'lua_ls', 'ruff', 'ty', 'tinymist', 'rust_analyzer', 'clangd' })


-- PLUGIN - conform (formatting)
-- Only formatters with no language server live here; ruff/rust_analyzer/tinymist
-- format via their LSP, so they are intentionally omitted.
require('conform').setup({
  notify_on_error = true,
  notify_no_formatters = true,
  formatters_by_ft = {
    bash = { 'shfmt' },
    lua = { 'stylua' },
    typescript = { 'prettierd', 'prettier', stop_after_first = true },
    dockerfile = { 'dockerfmt' },
    make = { 'bake' },
    ['*'] = { 'codespell' },
    ['_'] = { 'trim_whitespace' },
  },
})


-- PLUGIN - which-key
local wk = require('which-key')
wk.setup { preset = 'helix' }
wk.add {
  { '<leader>c', group = 'LSP: Code' },
  { '<leader>l', group = 'LSP: Info' },
  { '<leader>s', group = 'Search:' },
  { '<leader>g', group = 'Git:' },
  {
    '<leader>?',
    function()
      wk.show { global = false }
    end,
    desc = 'Buffer Local Keymaps',
  },
}


---=====================
--- Terminal (floating)
---=====================
local terminal_state = { buf = nil, win = nil, is_open = false }

local function FloatingTerminal()
  if terminal_state.is_open and vim.api.nvim_win_is_valid(terminal_state.win) then
    vim.api.nvim_win_close(terminal_state.win, false)
    terminal_state.is_open = false
    return
  end

  if not terminal_state.buf or not vim.api.nvim_buf_is_valid(terminal_state.buf) then
    terminal_state.buf = vim.api.nvim_create_buf(false, true)
    vim.bo[terminal_state.buf].bufhidden = 'hide'
  end

  local width = math.floor(vim.o.columns * 0.8)
  local height = math.floor(vim.o.lines * 0.8)
  terminal_state.win = vim.api.nvim_open_win(terminal_state.buf, true, {
    relative = 'editor',
    width = width,
    height = height,
    row = math.floor((vim.o.lines - height) / 2),
    col = math.floor((vim.o.columns - width) / 2),
    style = 'minimal',
    border = 'rounded',
  })

  vim.wo[terminal_state.win].winblend = 0
  vim.wo[terminal_state.win].winhighlight = 'Normal:FloatingTermNormal,FloatBorder:FloatingTermBorder'
  vim.api.nvim_set_hl(0, 'FloatingTermNormal', { bg = 'none' })
  vim.api.nvim_set_hl(0, 'FloatingTermBorder', { bg = 'none' })

  local lines = vim.api.nvim_buf_get_lines(terminal_state.buf, 0, -1, false)
  if #lines == 0 or (#lines == 1 and lines[1] == '') then
    vim.fn.jobstart(os.getenv('SHELL'), { term = true })
  end

  terminal_state.is_open = true
  vim.cmd('startinsert')
  vim.api.nvim_create_autocmd('BufLeave', {
    buffer = terminal_state.buf,
    once = true,
    callback = function()
      if terminal_state.is_open and vim.api.nvim_win_is_valid(terminal_state.win) then
        vim.api.nvim_win_close(terminal_state.win, false)
        terminal_state.is_open = false
      end
    end,
  })
end

local function CloseFloatingTerminal()
  if terminal_state.is_open and vim.api.nvim_win_is_valid(terminal_state.win) then
    vim.api.nvim_win_close(terminal_state.win, false)
    terminal_state.is_open = false
  end
end

vim.api.nvim_create_autocmd('TermClose', {
  callback = function()
    if vim.v.event.status == 0 then
      pcall(vim.api.nvim_buf_delete, 0, {})
    end
  end,
})
vim.api.nvim_create_autocmd('TermOpen', {
  callback = function()
    vim.opt_local.number = false
    vim.opt_local.relativenumber = false
    vim.opt_local.signcolumn = 'no'
  end,
})


---=====================
--- Keymaps
---=====================
local function map(mode, lhs, rhs, desc)
  vim.keymap.set(mode, lhs, rhs, { noremap = true, silent = true, desc = desc })
end

-- Clear search highlight
map('n', '<Esc>', '<cmd>nohlsearch<CR>', 'Clear search highlight')

-- Highlight on yank
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('highlight-yank', { clear = true }),
  callback = function()
    vim.hl.on_yank()
  end,
})

-- Buffer navigation (barbar; 'A' is Alt)
map('n', '<A-,>', '<Cmd>BufferPrevious<CR>', 'Previous buffer')
map('n', '<A-.>', '<Cmd>BufferNext<CR>', 'Next buffer')
map('n', '<A-c>', '<Cmd>BufferClose<CR>', 'Close buffer')

-- Wrap-aware movement
vim.keymap.set('n', 'j', function()
  return vim.v.count == 0 and 'gj' or 'j'
end, { expr = true, silent = true, desc = 'Down (wrap-aware)' })
vim.keymap.set('n', 'k', function()
  return vim.v.count == 0 and 'gk' or 'k'
end, { expr = true, silent = true, desc = 'Up (wrap-aware)' })

-- LSP
map('n', 'gr', tele_builtin.lsp_references, 'LSP: Goto References')
map('n', 'gi', tele_builtin.lsp_implementations, 'LSP: Goto Implementation')
map('n', 'gd', tele_builtin.lsp_definitions, 'LSP: Goto Definition')
map('n', 'gD', vim.lsp.buf.declaration, 'LSP: Goto Declaration')
map('n', '<leader>cr', vim.lsp.buf.rename, 'LSP: Rename symbol')
map({ 'n', 'x' }, '<leader>ca', vim.lsp.buf.code_action, 'LSP: Code Actions')
map('n', 'K', function()
  vim.lsp.buf.hover { border = 'rounded' }
end, 'LSP: Hover Documentation')
map('n', '<leader>li', '<cmd>checkhealth vim.lsp<cr>', 'LSP: Info (health)')
map('n', '<leader>lr', '<cmd>lsp restart<cr>', 'LSP: Restart')
map('n', '<leader>ll', function()
  vim.cmd.split(vim.lsp.log.get_filename())
end, 'LSP: Log')
map('n', '<leader>d', vim.diagnostic.open_float, 'LSP: Show diagnostics')

-- Formatting
map({ 'n', 'x' }, '<leader>f', function()
  require('conform').format { async = true, lsp_format = 'fallback' }
end, 'Format buffer/selection')

-- Terminal
map('n', '<leader>t', FloatingTerminal, 'Toggle floating terminal')
map('t', '<Esc>', CloseFloatingTerminal, 'Close floating terminal')

-- Git
map('n', '<leader>gs', tele_builtin.git_status, 'Git: Status')
map('n', '<leader>gb', tele_builtin.git_branches, 'Git: Branches')

-- Search
map('n', '<leader>sg', tele_builtin.live_grep, 'Search: Grep')
map('n', '<leader>sf', function()
  tele_builtin.find_files { no_ignore = true, hidden = true }
end, 'Search: Files')
map('n', '<leader>sb', tele_builtin.buffers, 'Search: Buffers')
map('n', '<leader>sr', function()
  tele_builtin.resume { initial_mode = 'normal' }
end, 'Search: Resume in Normal Mode')
map('n', '<leader>sk', tele_builtin.keymaps, 'Search: Keymaps')
map('n', '<leader>sh', tele_builtin.help_tags, 'Search: Help')
map('n', '<leader>sd', tele_builtin.diagnostics, 'Search: Diagnostics')
map('n', '<leader>sw', tele_builtin.lsp_dynamic_workspace_symbols, 'Search: Workspace Symbols')

-- Oil
map('n', '-', '<CMD>Oil<CR>', 'Open parent directory')
