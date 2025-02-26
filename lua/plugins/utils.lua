return {
  {
    'dstein64/vim-startuptime',
    version = '*',
    cmd = 'StartupTime',
    config = function()
      vim.g.startuptime_tries = 10
    end,
  },

  -- library used by other plugins
  { 'nvim-lua/plenary.nvim', lazy = true },
}
