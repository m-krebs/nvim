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
        { desc = 'Global Note' },
      },
    },
  },
}
