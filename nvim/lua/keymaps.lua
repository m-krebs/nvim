vim.g.mapleader = " "
-- Telescope mappings in after/plugin/telescope.lua

-----------------
-- Normal mode --
-----------------
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.keymap.set("n", "<C-n>", vim.cmd.NvimTreeToggle)
vim.keymap.set("n", "<leader>pb", vim.cmd.bprevious)        -- Switches to previous Buffer
vim.keymap.set("n", "<leader>nb", vim.cmd.bnext)            -- Switches to next Buffer
vim.keymap.set("n", "<leader>bd", vim.cmd.bd)               -- Closes current Buffer

-----------------
-- Visual mode --
-----------------

-----------------
-- Insert mode --
-----------------
vim.keymap.set("i", "<C-H>", "<C-W>")                       -- Adds ctrl+backspace functionality in insert mode
