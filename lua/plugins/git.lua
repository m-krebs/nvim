return {
  {
    'tpope/vim-fugitive',
    cmd = {
      'Git',
      'G',
      'Gdiff',
      'Gedit',
      'Gdiffsplit',
      'Gread',
      'Gwrite',
      'Ggrep',
      'GMove',
      'GDelete',
      'GBrowse',
    },
  },
  {
    'lewis6991/gitsigns.nvim',
    version = '*',
    event = 'BufRead',
    ---@module "gitsigns"
    ---@type Gitsigns.Config|{}
    opts = {
      current_line_blame_opts = {
        delay = 300,
      },
      current_line_blame = true,
      signs = {
        add = { show_count = true, text = '▎' },
        change = { show_count = true, text = '▎' },
        delete = { show_count = true, text = '' },
        topdelete = { show_count = true, text = '' },
        changedelete = { show_count = true, text = '▎' },
        untracked = { show_count = true, text = '▎' },
      },
    },
    keys = {
      { '<leader>gbb', '<cmd>Gitsigns blame<cr>', desc = '[G]itsigns [b]lame [b]uffer' },
    },
  },
  {
    'dlyongemallo/diffview.nvim',
    version = '*',
  },
}
