local map = vim.keymap.set

vim.pack.add {
  gh 'tpope/vim-sleuth',
  gh 'numToStr/Comment.nvim',
  gh 'stevearc/quicker.nvim',
  gh 'error311/wayfinder.nvim',
  gh 'pteroctopus/faster.nvim',
  gh 'folke/flash.nvim',
  gh 'folke/trouble.nvim',
}

require('quicker').setup()
require('flash').setup {
  modes = {
    search = { enabled = true },
  },
}

-- stylua: ignore start
map({ 'n', 'x', 'o' }, 's', function() require('flash').jump() end, { desc = 'Flash' })
map({ 'n', 'o', 'x' }, 'S', function() require('flash').treesitter() end, { desc = 'Flash Treesitter' })
map('o', 'r', function() require('flash').remote() end, { desc = 'Remote Flash' })
map({ 'o', 'x' }, 'R', function() require('flash').treesitter_search() end, { desc = 'Treesitter Search' })
map('c', '<c-s>', function() require('flash').toggle() end, { desc = 'Toggle Flash Search' })
-- stylua: ignore end

require('trouble').setup {}
map('n', '<leader>xx', '<cmd>Trouble diagnostics toggle<cr>', { desc = 'Diagnostics' })
map('n', '<leader>cs', '<cmd>Trouble symbols toggle focus=false<cr>', { desc = '[S]ymbols' })
