vim.pack.add { gh 'tpope/vim-fugitive' }
vim.pack.add { gh 'lewis6991/gitsigns.nvim' }
vim.pack.add { { src = gh 'dlyongemallo/diffview.nvim', version = vim.version.range 'v*' } }

require('gitsigns').setup {
  current_line_blame_opts = {
    delay = 300,
  },
  current_line_blame = true,
  signs = {
    add = { show_count = false, text = '▎' },
    change = { show_count = false, text = '▎' },
    delete = { show_count = false, text = '' },
    topdelete = { show_count = false, text = '' },
    changedelete = { show_count = false, text = '▎' },
    untracked = { show_count = false, text = '▎' },
  },
}

vim.keymap.set('n', '<leader>gbb', '<cmd>Gitsigns blame<cr>', { desc = '[G]itsigns [b]lame [b]uffer' })

-- return {
--   {
--     'tpope/vim-fugitive',
--     cmd = {
--       'Git',
--       'G',
--       'Gdiff',
--       'Gedit',
--       'Gdiffsplit',
--       'Gread',
--       'Gwrite',
--       'Ggrep',
--       'GMove',
--       'GDelete',
--       'GBrowse',
--     },
--   },
-- }
