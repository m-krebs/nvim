vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.g.have_nerd_font = true -- Set to true if you have a Nerd Font installed

-- [[ Setting options ]]
require 'options'

-- [[ Basic Keymaps ]]
require 'keymaps'

-- [[ Basic Autocommands ]]
require 'autocmds'

-- [[ Load util functions ]]
_G.Utils = require 'util'

-- [[ Install `lazy.nvim` plugin manager ]]
-- this loads plugins configured with lazy
-- that are found under lua/plugins/
require 'lazy-bootstrap'

vim.cmd 'colorscheme eldritch' -- sets colorscheme
