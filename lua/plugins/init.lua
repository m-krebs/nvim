return {
  { 'folke/lazy.nvim', tag = 'stable' },
  {
    'folke/snacks.nvim',
    lazy = false,
    opts = {
      lazygit = { enabled = true },
      zen = { enabled = true },
      scroll = { enabled = true },
    },
    keys = {
      {
        '<leader>z',
        function()
          Snacks.zen()
        end,
        desc = 'Toggle [z]en mode',
      },
      {
        '<leader>e',
        function()
          Snacks.explorer()
        end,
        desc = 'Toggle [e]xplorer',
      },
    },
  },
}
