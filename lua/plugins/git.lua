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
      current_line_blame_opts = {
        delay = 300
      },
      current_line_blame = true,
      signs = {
        add = { text = '▎' },
        change = { text = '▎' },
        delete = { text = '' },
        topdelete = { text = '' },
        changedelete = { text = '▎' },
        untracked = { text = '▎' },
      },
    },
    keys = {
      { "<leader>gbb", "<cmd>Gitsigns blame<cr>", desc = "[G]itsigns [b]lame [b]uffer"}
    }
  },
}
