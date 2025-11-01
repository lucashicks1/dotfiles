-- Tabs
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.o.relativenumber = true
vim.opt.smartindent = true
vim.o.breakindent = true
vim.o.signcolumn = 'yes'

-- Editor
vim.o.mouse = 'a' -- Enable mouse mode

vim.o.undofile = true -- Save undo history

vim.o.ignorecase = true -- Searching
vim.opt.incsearch = true -- incremental search
vim.o.smartcase = true

vim.schedule(function()
  vim.o.clipboard = 'unnamedplus' -- Sync clipboard between OS and Neovim.
end)

-- Misc
vim.o.showmode = false
vim.opt.termguicolors = true
vim.o.updatetime = 250 -- Decrease update time
vim.o.timeoutlen = 300 -- Decrease mapped sequence wait time

-- Configure how new splits should be opened
vim.o.splitright = true
vim.o.splitbelow = true

-- Sets how neovim will display certain whitespace characters in the editor.
vim.o.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- Preview substitutions live, as you type!
vim.o.inccommand = 'split'

-- Show which line your cursor is on
vim.o.cursorline = true

-- Minimal number of screen lines to keep above and below the cursor.
vim.o.scrolloff = 12

-- if performing an operation that would fail due to unsaved changes in the buffer (like `:q`),
-- instead raise a dialog asking if you wish to save the current file(s)
-- See `:help 'confirm'`
vim.o.confirm = true
