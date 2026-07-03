vim.pack.add { gh 'stevearc/overseer.nvim' }

vim.keymap.set('n', '<leader>o', '<cmd>OverseerRun<cr>', { desc = 'Overseer Run' })
vim.keymap.set('n', '<leader>ot', '<cmd>OverseerToggle<cr>', { desc = 'Overseer [T]oggle' })
vim.keymap.set('n', '<leader>oq', '<cmd>OverseerQuickAction<cr>', { desc = 'Overseer [Q]uickAction' })
