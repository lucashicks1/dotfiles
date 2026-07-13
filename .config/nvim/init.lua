---=====================
--- Options
---=====================

vim.g.mapleader = ' '
vim.g.maplocalleader = '\\'

-- colours
vim.o.termguicolors = true
vim.cmd.colorscheme("habamax")

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
vim.o.fillchars = { eob = " " } -- hide "~" on empty lines

-- providers
vim.g.loaded_python3_provider = 0
vim.g.loaded_ruby_provider = 0
vim.g.loaded_perl_provider = 0
vim.g.loaded_node_provider = 0

-- misc
vim.o.clipboard = 'unnamedplus' -- Sync clipboard between OS and Neovim.
vim.o.updatetime = 250 -- Decrease update time
vim.o.timeoutlen = 300 -- Decrease mapped sequence wait time
vim.o.splitright = true -- vert. splits open right
vim.o.splitbelow = true -- hori. splits open below
vim.o.list = true
vim.o.listchars = { tab = '» ', trail = '·', nbsp = '␣' }
vim.o.inccommand = 'split'
vim.o.confirm = true -- if performing op that would fail due to unsaved changes (like `:q`) show a dialog asking if you wish to save the current file(s)
vim.o.undofile = true -- Save undo history
vim.o.mouse = 'a' -- Enable mouse mode

---=====================
--- Plugins
---=====================




-- loads
require 'lazy_init'
require 'keymaps'
