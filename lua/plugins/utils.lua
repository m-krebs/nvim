vim.pack.add {
  gh 'nvim-tree/nvim-web-devicons',
  gh 'tiagovla/scope.nvim', -- required by bufferline
  gh 'dstein64/vim-startuptime',
  gh 'nvim-lua/plenary.nvim',
  gh 'nvzone/volt', -- required by nvzone/minty
  gh 'MunifTanjim/nui.nvim', -- required by noice
  gh 'rcarriga/nvim-notify', -- required by noice
}

vim.g.startuptime_tries = 10

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
