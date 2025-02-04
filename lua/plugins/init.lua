return {
  { 'folke/lazy.nvim', tag = 'stable' },
  {
    'folke/snacks.nvim',
    tag = 'stable',
    opts = {
      lazygit = { enabled = true },
      zen = { enabled = true },
      scroll = { enabled = true },
    },
    lazy = false,
    keys = {
      {
        '<leader>z',
        function()
          Snacks.zen()
        end,
        { desc = 'Toggle [z]en mode' },
      },
      {
        '<leader>e',
        function()
          Snacks.explorer()
        end,
        { desc = 'Toggle [e]xplorer' },
      },
    },
  },
}
