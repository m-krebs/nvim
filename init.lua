vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.g.have_nerd_font = true -- Set to true if you have a Nerd Font installed

-- [[ Setting options ]]
require 'config.options'

-- [[ Basic Keymaps ]]
require 'config.keymaps'

-- [[ Basic Autocommands ]]
require 'config.autocmds'

-- [[ Load util functions ]]
_G.Utils = require 'utility'

-- [[ Install `lazy.nvim` plugin manager ]]
-- loads plugins configured with
-- lazy found under lua/plugins/
require 'config.lazy'

require 'colorscheme'
