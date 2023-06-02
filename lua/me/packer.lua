vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
	use { 'wbthomason/packer.nvim' }
	use { 'folke/tokyonight.nvim' }
	use { 'nvim-lualine/lualine.nvim', requires = { 'nvim-tree/nvim-web-devicons' } }
	use { 'nvim-tree/nvim-tree.lua', requires = { 'nvim-tree/nvim-web-devicons', }, config = function() require("nvim-tree").setup {} end }
	use { 'mhartington/formatter.nvim' }
	use { 'akinsho/bufferline.nvim', tag = "*", requires = 'nvim-tree/nvim-web-devicons'}
	use { 'lukas-reineke/indent-blankline.nvim', requires = 'nvim-treesitter/nvim-treesitter' }
	use { 'glepnir/dashboard-nvim', event = 'VimEnter', requires = {'nvim-tree/nvim-web-devicons'} }
	use { 'nvim-telescope/telescope.nvim', tag = '0.1.0', requires = { { 'nvim-lua/plenary.nvim' } } }
	use { 'nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' } }
end)
