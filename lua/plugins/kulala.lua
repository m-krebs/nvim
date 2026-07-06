vim.pack.add { gh 'mistweaverco/kulala.nvim' }

require('kulala').setup()

-- stylua: ignore start
vim.keymap.set('n', '<leader>r', '', { desc = '+[R]est' })
vim.keymap.set('n', '<leader>rr', function() require('kulala').run() end, { desc = 'Run request' })
vim.keymap.set('n', '<leader>rR', function() require('kulala').replay() end, { desc = 'Replay last request' })
vim.keymap.set('n', '<leader>r[', function() require('kulala').jump_prev() end, { desc = 'Jump to previous' })
vim.keymap.set('n', '<leader>r]', function() require('kulala').jump_next() end, { desc = 'Jump to next' })
vim.keymap.set('n', '<leader>rv', function() require('kulala').toggle_view() end, { desc = 'Toggle view' })
vim.keymap.set('n', '<leader>r/', function() require('kulala').search() end, { desc = 'Search request files' })
vim.keymap.set('n', '<leader>rs', function() require('kulala').scratchpad() end, { desc = 'Open Scratchpad' })
-- stylua: ignore end
