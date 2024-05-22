return {
  {
    'backdround/global-note.nvim',
    opts = {},
    cmd = 'GlobalNote',
    keys = {
      {
        '<leader>n',
        function()
          require('global-note').toggle_note()
        end,
        desc = 'Global Note',
      },
    },
  },
  {
    'tris203/hawtkeys.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-treesitter/nvim-treesitter',
    },
    opts = {},
  },
}
