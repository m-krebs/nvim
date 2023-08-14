vim.g.mapleader = ' '
vim.g.floaterm_keymap_new    = '<F7>'
vim.g.floaterm_keymap_toggle = '<F12>'

-- Telescope mappings in after/plugin/telescope.lua

-----------------
-- Normal mode --
-----------------
vim.keymap.set('n', '<leader>pv', vim.cmd.Ex)
vim.keymap.set('n', '<C-n>', vim.cmd.NvimTreeToggle)
vim.keymap.set('n', '<leader>pb', vim.cmd.bprevious)        -- Switches to previous Buffer
vim.keymap.set('n', '<leader>nb', vim.cmd.bnext)            -- Switches to next Buffer
vim.keymap.set('n', '<leader>bd', vim.cmd.bd)               -- Closes current Buffer

-- Better window navigation
vim.keymap.set('n', '<C-h>', '<C-w>h', opts)
vim.keymap.set('n', '<C-j>', '<C-w>j', opts)
vim.keymap.set('n', '<C-k>', '<C-w>k', opts)
vim.keymap.set('n', '<C-l>', '<C-w>l', opts)



-----------------
-- Visual mode --
-----------------

-----------------
-- Insert mode --
-----------------
vim.keymap.set('i', '<C-H>', '<C-W>')                       -- Adds ctrl+backspace functionality in insert mode
