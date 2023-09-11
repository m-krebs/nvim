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
	use { 'nvim-tree/nvim-tree.lua', requires = { 'nvim-tree/nvim-web-devicons' }, config = function() require('nvim-tree').setup {} end }
	use { 'mhartington/formatter.nvim' }
	use { 'akinsho/bufferline.nvim', tag = '*', requires = 'nvim-tree/nvim-web-devicons'}
	use { 'lukas-reineke/indent-blankline.nvim', requires = 'nvim-treesitter/nvim-treesitter' }
	use { 'nvim-telescope/telescope.nvim', tag = '0.1.0', requires = { { 'nvim-lua/plenary.nvim' } } }
	use { 'nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' } }
    use { 'towolf/vim-helm' }
    use { 'voldikss/vim-floaterm' }
    use { 'theprimeagen/harpoon' }
    use { 'mbbill/undotree' }
    use { 'tpope/vim-fugitive' }
    use { 'sbdchd/neoformat' }
    use { 'VonHeikemen/lsp-zero.nvim',
        branch = 'v2.x',
        requires = {
            -- LSP Support
            { 'neovim/nvim-lspconfig'},             -- Required
            { 'williamboman/mason.nvim', { run = ':MasonUpdate' } },           -- Optional
            { 'williamboman/mason-lspconfig.nvim'}, -- Optional

            -- Autocompletion
            { 'hrsh7th/nvim-cmp' },     -- Required
            { 'hrsh7th/cmp-nvim-lsp' }, -- Required
            { 'hrsh7th/cmp-nvim-lua' }, -- Required
            { 'hrsh7th/cmp-buffer', after = 'nvim-cmp' },   -- Optional
            { 'hrsh7th/cmp-path', after = 'nvim-cmp' },     -- Optional
            { 'hrsh7th/cmp-cmdline', after = 'nvim-cmp' },  -- Optional
            { 'saadparwaiz1/cmp_luasnip' },                 -- Optional

            -- Snippets
            { 'L3MON4D3/LuaSnip' },
            { 'rafamadriz/friendly-snippets' },
        }
    }

 if packer_bootstrap then
    require('packer').sync()
  end
end)
