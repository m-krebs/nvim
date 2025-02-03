return {
  { 'folke/lazy.nvim', tag = 'stable' },
  {
    'folke/snacks.nvim',
    tag = 'stable',
    opts = {
      lazygit = { enabled = true },
      zen = { enabled = true },
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
    },
  },
}
