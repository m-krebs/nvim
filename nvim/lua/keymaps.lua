vim.g.floaterm_keymap_new    = '<F7>'
vim.g.floaterm_keymap_toggle = '<F12>'

-- Telescope mappings at after/plugin/telescope.lua

-----------------
-- Normal mode --
-----------------
vim.keymap.set('n', '<leader>pv', vim.cmd.Ex)
vim.keymap.set('n', '<C-n>', vim.cmd.NvimTreeToggle)
vim.keymap.set('n', '<leader>pb', vim.cmd.bprevious)        -- Switches to previous Buffer
vim.keymap.set('n', '<leader>nb', vim.cmd.bnext)            -- Switches to next Buffer
vim.keymap.set('n', '<leader>bd', vim.cmd.bd)               -- Closes current Buffer

vim.keymap.set("n", "J", "mzJ`z") -- Keep cursor when appending below line
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Better window navigation
vim.keymap.set('n', '<C-h>', '<C-w>h', opts)
vim.keymap.set('n', '<C-j>', '<C-w>j', opts)
vim.keymap.set('n', '<C-k>', '<C-w>k', opts)
vim.keymap.set('n', '<C-l>', '<C-w>l', opts)

-----------------
-- Visual mode --
-----------------

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '>-2<CR>gv=gv")

-----------------
-- Insert mode --
-----------------
vim.keymap.set('i', '<C-H>', '<C-W>')                       -- Adds ctrl+backspace functionality in insert mode

-- greatest remap ever
vim.keymap.set("x", "<leader>p", "\"_dP")

-- add to clipboard
vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>Y", "\"+Y")

vim.keymap.set("n", "<leader>s", ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>")
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })
