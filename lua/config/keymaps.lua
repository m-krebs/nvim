-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- ctrl+backspace delete previous word
vim.keymap.set("i", "<C-BS>", "<C-W>")
vim.keymap.set("i", "<C-H>", "<C-W>")

-- make current file executable
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })
