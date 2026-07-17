vim.pack.add {
  gh 'scottmckendry/cyberdream.nvim',
  gh 'Shatur/neovim-ayu',
  gh 'sainnhe/sonokai',
  gh 'folke/tokyonight.nvim',
  gh 'eldritch-theme/eldritch.nvim',
  gh 'rebelot/kanagawa.nvim',
  gh 'mitander/flume.nvim',
}

vim.cmd.colorscheme 'cyberdream'

-- function() vim.api.nvim_set_hl(0, 'LineNr', { fg = '#34383f' })
