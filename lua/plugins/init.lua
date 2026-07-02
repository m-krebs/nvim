require 'plugins.dashboard'
require 'plugins.navigation'
require 'plugins.mini'
require 'plugins.format'
require 'plugins.lsp'
require 'plugins.git'
require 'plugins.snacks'
require 'plugins.toggleterm'

-- return {
--   {
--     'folke/snacks.nvim',
--     lazy = false,
--     opts = {
--       lazygit = { enabled = true },
--       zen = { enabled = true },
--       scroll = { enabled = true },
--     },
--     keys = {
--       {
--         '<leader>z',
--         function()
--           Snacks.zen()
--         end,
--         desc = 'Toggle [z]en mode',
--       },
--       {
--         '<leader>e',
--         function()
--           Snacks.explorer()
--         end,
--         desc = 'Toggle [e]xplorer',
--       },
--     },
--   },
-- }
