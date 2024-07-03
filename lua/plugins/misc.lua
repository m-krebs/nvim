return {
  {
    'andweeb/presence.nvim',
    opts = {
      neovim_image_text = 'The One True Text Editor',
    },
    enabled = false,
  },
  -- HTTP REST-Client Interface
  { 'mistweaverco/kulala.nvim' },
  -- markdown
  { 'MeanderingProgrammer/markdown.nvim', dependencies = {
    'nvim-treesitter/nvim-treesitter',
    'nvim-tree/nvim-web-devicons',
  }, opts = {} },
}
