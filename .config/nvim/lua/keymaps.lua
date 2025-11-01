vim.g.mapleader = ' '
vim.g.maplocalleader = '\\'

-- Clear highlights on search when pressing <Esc> in normal mode
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostics
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Disable arrow keys in normal mode - DONT BE LIKE JACKSON
vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

-- Keybinds to make split navigation easier.
-- CTRL+<hjkl> to switch between windows
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.hl.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

local function map(mode, lhs, rhs, desc)
  local opts = vim.tbl_extend('force', { noremap = true, silent = true }, { desc = desc })
  vim.keymap.set(mode, lhs, rhs, opts)
end

-- [[ BarBar Binds ]]
-- Move to previous/next
map('n', '<A-,>', '<Cmd>BufferPrevious<CR>', 'Previous buffer')
map('n', '<A-.>', '<Cmd>BufferNext<CR>', 'Next Buffer')

-- Goto buffer in position...
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

-- Close buffer
map('n', '<A-c>', '<Cmd>BufferClose<CR>', 'Close Buffer')
map('n', '<A-s-c>', '<Cmd>BufferRestore<CR>', 'Restore Buffer')

-- Close commands -- :BufferCloseAllButCurrent, :BufferCloseAllButPinned, :BufferCloseAllButCurrentOrPinned, :BufferCloseBuffersLeft, :BufferCloseBuffersRight

-- Sort automatically by...
map('n', '<Space>bb', '<Cmd>BufferOrderByBufferNumber<CR>', 'Buffer order - number')
map('n', '<Space>bw', '<Cmd>BufferOrderByWindowNumber<CR>', 'Buffer order - win number')
