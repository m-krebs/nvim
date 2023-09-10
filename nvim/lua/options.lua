--  type `:h <option>` to figure out the meaning if needed
vim.opt.clipboard = 'unnamedplus'	-- use system clipboard
vim.opt.mouse = 'a'

-- Tab
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

-- UI config
vim.opt.wrap = false

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true
vim.opt.termguicolors = true

vim.opt.scrolloff = 8

-- Searching
vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- History
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"

-- Other
vim.opt.updatetime = 50
vim.opt.colorcolumn = "80"

vim.g.mapleader = " "
