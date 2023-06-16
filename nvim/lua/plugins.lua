local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
	use { 'wbthomason/packer.nvim' }
	use { 'folke/tokyonight.nvim' }
	use { 'nvim-lualine/lualine.nvim', requires = { 'nvim-tree/nvim-web-devicons' } }
	use { 'nvim-tree/nvim-tree.lua', requires = { 'nvim-tree/nvim-web-devicons', }, config = function() require("nvim-tree").setup {} end }
	use { 'mhartington/formatter.nvim' }
	use { 'akinsho/bufferline.nvim', tag = "*", requires = 'nvim-tree/nvim-web-devicons'}
	use { 'lukas-reineke/indent-blankline.nvim', requires = 'nvim-treesitter/nvim-treesitter' }
	use { 'nvim-telescope/telescope.nvim', tag = '0.1.0', requires = { { 'nvim-lua/plenary.nvim' } } }
	use { 'nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' } }
  if packer_bootstrap then
    require('packer').sync()
  end

end)
