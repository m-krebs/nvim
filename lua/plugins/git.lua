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
    opts = {
      signs = {
        add = { text = '▎' },
        change = { text = '▎' },
        delete = { text = '' },
        topdelete = { text = '' },
        changedelete = { text = '▎' },
        untracked = { text = '▎' },
      },
    },
  },
}
