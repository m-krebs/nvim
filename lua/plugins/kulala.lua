vim.pack.add {
  gh 'mistweaverco/kulala.nvim',
  gh 'nvim-treesitter/nvim-treesitter',
}

require('kulala').setup()

require('nvim-treesitter').setup {
  ensure_installed = {
    'http',
    'graphql',
  },
}

-- stylua: ignore start
vim.keymap.set('<leader>r', '', { desc = '+[R]est' })
vim.keymap.set('<leader>rr', function() require('kulala').run() end, { desc = 'Run request' })
vim.keymap.set('<leader>rR', function() require('kulala').replay() end, { desc = 'Replay last request' })
vim.keymap.set('<leader>r[', function() require('kulala').jump_prev() end, { desc = 'Jump to previous' })
vim.keymap.set('<leader>r]', function() require('kulala').jump_next() end, { desc = 'Jump to next' })
vim.keymap.set('<leader>rv', function() require('kulala').toggle_view() end, { desc = 'Toggle view' })
vim.keymap.set('<leader>r/', function() require('kulala').search() end, { desc = 'Search request files' })
vim.keymap.set('<leader>rs', function() require('kulala').scratchpad() end, { desc = 'Open Scratchpad' })
-- stylua: ignore end
