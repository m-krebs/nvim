vim.pack.add { gh 'folke/snacks.nvim' }
require('snacks').setup {
  lazygit = { enabled = true },
  zen = { enabled = true },
  scroll = { enabled = true },
}

-- stylua: ignore start
vim.keymap.set('n', '<leader>z', function() Snacks.zen() end, { desc = 'Toggle [z]en mode' })
vim.keymap.set('n', '<leader>e', function() Snacks.explorer() end, { desc = 'Toggle [e]xplorer' })
-- stylua: ignore end
