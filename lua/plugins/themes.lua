return {
  {
    'scottmckendry/cyberdream.nvim',
    priority = 1000,
    config = function()
      vim.cmd.colorscheme 'cyberdream'
    end,
  },
  {
    'Shatur/neovim-ayu',
    event = 'VeryLazy',
    config = function()
      vim.api.nvim_set_hl(0, 'LineNr', { fg = '#34383f' })
    end,
  },
  { 'sainnhe/sonokai', event = 'VeryLazy' },
  { 'folke/tokyonight.nvim', event = 'VeryLazy' },
  { 'eldritch-theme/eldritch.nvim', event = 'VeryLazy' },
  { 'rebelot/kanagawa.nvim', event = 'VeryLazy' },
}
