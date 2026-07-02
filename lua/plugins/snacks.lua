vim.pack.add { gh 'folke/snacks.nvim' }
require('snacks').setup {
  lazygit = { enabled = true },
  zen = { enabled = true },
  scroll = { enabled = true },
}

vim.keymap.set('n', '<leader>z', function()
  Snacks.zen()
end, { desc = 'Toggle [z]en mode' })

vim.keymap.set('n', '<leader>e', function()
  Snacks.explorer()
end, { desc = 'Toggle [e]xplorer' })

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
