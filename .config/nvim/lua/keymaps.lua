vim.g.mapleader = ' '
vim.g.maplocalleader = '\\'

local function map(mode, lhs, rhs, desc)
  local opts = vim.tbl_extend('force', { noremap = true, silent = true }, { desc = desc })
  vim.keymap.set(mode, lhs, rhs, opts)
end

-- Clear highlights on search when pressing <Esc> in normal mode
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Highlight when yanking (copying) text
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

---------------------------------------------------
---- Buffer Navigation ('A' is just Alt)
---------------------------------------------------
map('n', '<A-,>', '<Cmd>BufferPrevious<CR>', 'Previous buffer')
map('n', '<A-.>', '<Cmd>BufferNext<CR>', 'Next Buffer')
map('n', '<A-1>', '<Cmd>BufferGoto 1<CR>', 'Goto Buffer 1')
map('n', '<A-2>', '<Cmd>BufferGoto 2<CR>', 'Goto Buffer 2')
map('n', '<A-3>', '<Cmd>BufferGoto 3<CR>', 'Goto Buffer 3')
map('n', '<A-4>', '<Cmd>BufferGoto 4<CR>', 'Goto Buffer 1')
map('n', '<A-5>', '<Cmd>BufferGoto 5<CR>', 'Goto Buffer 5')
map('n', '<A-6>', '<Cmd>BufferGoto 6<CR>', 'Goto Buffer 6')
map('n', '<A-7>', '<Cmd>BufferGoto 7<CR>', 'Goto Buffer 7')
map('n', '<A-8>', '<Cmd>BufferGoto 8<CR>', 'Goto Buffer 8')
map('n', '<A-9>', '<Cmd>BufferGoto 9<CR>', 'Goto Buffer 9')
map('n', '<A-0>', '<Cmd>BufferLast<CR>', 'Goto Last Buffer')
map('n', '<A-c>', '<Cmd>BufferClose<CR>', 'Close Buffer')
map('n', '<A-s-c>', '<Cmd>BufferRestore<CR>', 'Restore Buffer')

---------------------------------------------------
---- LSP/Code
---------------------------------------------------
local lsp = vim.lsp
-- Gotos
map('n', 'gr', lsp.buf.references, 'LSP: Goto References')
map('n', 'gi', lsp.buf.implementation, 'LSP: Goto Implementation')
map('n', 'gd', lsp.buf.definition, 'LSP: Goto Definition')
map('n', 'gD', lsp.buf.declaration, 'LSP: Goto Declaration')

-- Editor Actions
map('n', '<leader>cr', lsp.buf.rename, 'LSP: Rename symbol')
map({ 'n', 'x' }, '<leader>ca', lsp.buf.code_action, 'LSP: Show Code Actions')
map('', '<leader>f', function()
  require('conform').format { async = true, lsp_format = 'fallback' }
end, 'Format')

-- Docs & hints
map('n', 'K', vim.lsp.buf.hover, 'Hover Information')

-- LSP Server Commands
map('n', '<leader>li', '<cmd>LspInfo<cr>', 'LSP Info')
map('n', '<leader>lr', ':LspRestart<cr>', 'LSP Restart')
map('n', '<leader>ll', ':LspLog<cr>', 'LSP Log')

---------------------------------------------------
---- Terminal
---------------------------------------------------
local term = require 'terminal'
map('n', '<leader>t', term.FloatingTerminal, 'Toggle floating terminal')
map('t', '<Esc>', term.CloseFloatingTerminal, 'Close floating terminal from terminal mode')

---------------------------------------------------
---- Diagnostics
---------------------------------------------------
map('n', '<leader>xd', '<cmd>Trouble diagnostics toggle filter.buf=0<CR>', 'Open trouble document diagnostics')
map('n', '<leader>xw', '<cmd>Trouble diagnostics toggle<CR>', 'Open trouble workspace diagnostics')
map('n', '<leader>d', vim.diagnostic.open_float, 'LSP: Show Diagnostics')

---------------------------------------------------
---- Searching (with telescope of course)
---------------------------------------------------
local telescope = require 'telescope.builtin'
map('n', '<leader>sh', telescope.help_tags, 'Search: Help')
map('n', '<leader>sk', telescope.keymaps, 'Search: Keymaps')
map('n', '<leader>sg', telescope.live_grep, 'Search: Grep')
map('n', '<leader>sd', telescope.diagnostics, 'Search: Diagnostics')
map('n', '<leader>sw', telescope.lsp_dynamic_workspace_symbols, 'Search: Workspace Symbols')
map('n', '<leader>sr', function()
  telescope.resume { initial_mode = 'normal' }
end, 'Search: Resume in Normal Mode')
map('n', '<leader>sf', function()
  telescope.find_files { no_ignore = true, hidden = true }
end, 'Search: Files')

---------------------------------------------------
---- Debuggin
---------------------------------------------------
local dap = require 'dap'
map('n', '<F5>', dap.continue, 'Debug: Start/Continue')
map('n', '<F1>', dap.step_into, 'Debug: Step Into')
map('n', '<F2>', dap.step_over, 'Debug: Step Over')
map('n', '<F3>', dap.step_out, 'Debug: Step Out')
map('n', '<F7>', require('dapui').toggle, 'Debug: See last session result')
map('n', '<leader>Db', dap.toggle_breakpoint, 'Debug: Toggle Breakpoint')

map({ 'n', 'v' }, '<leader>DB', function()
  dap.set_breakpoint(vim.fn.input 'Breakpoint condition: ')
end, 'Debug: Set Breakpoint')

---------------------------------------------------
---- Previewing Docs (typst, latex, etc.)
---------------------------------------------------
local omnipreview = require 'omni-preview.commands'
map('n', '<leader>po', omnipreview.start, 'Preview: Start')
map('n', '<leader>pc', omnipreview.stop, 'Preview: Stop')

---------------------------------------------------
---- Files
---------------------------------------------------
map('n', '-', '<CMD>Oil<CR>', 'Open parent directory')
