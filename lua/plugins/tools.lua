vim.pack.add {
  gh 'folke/persistence.nvim',
  gh 'meznaric/key-analyzer.nvim',
  gh '2kabhishek/nerdy.nvim',
  gh 'Hashino/doing.nvim',
  gh 'mgierada/lazydocker.nvim',
  gh 'backdround/global-note.nvim',
  gh 'tris203/hawtkeys.nvim',
  gh 'mluders/comfy-line-numbers.nvim',
  gh 'AlejandroSuero/freeze-code.nvim',
}

local persistence = require 'persistence'
persistence.setup { options = vim.opt.sessionoptions:get() }

-- stylua: ignore start
vim.keymap.set('n', '<leader>qs', function() persistence.load() end, { desc = 'Restore Session' })
vim.keymap.set('n', '<leader>ql', function() persistence.load { last = true } end, { desc = 'Restore Last Session' })
vim.keymap.set('n', '<leader>qd', function() persistence.stop() end, { desc = "Don't Save Current Session" })
vim.keymap.set('n', '<leader>sp', function() persistence.select() end, { desc = 'Search [p]rojects' })
-- stylua: ignore end

require('doing').setup {}
vim.keymap.set('n', '<leader>da', function()
  require('doing').add()
end, { desc = '[D]oing: [A]dd' })
vim.keymap.set('n', '<leader>dn', function()
  require('doing').done()
end, { desc = '[D]oing: Do[n]e' })
vim.keymap.set('n', '<leader>de', function()
  require('doing').edit()
end, { desc = '[D]oing: [E]dit' })

require('lazydocker').setup {}
vim.keymap.set('n', '<leader>ld', function()
  require('lazydocker').open()
end, { desc = 'Open Lazydocker' })

require('global-note').setup {}
vim.keymap.set('n', '<leader>n', function()
  require('global-note').toggle_note()
end, { desc = 'Global Note' })

require('hawtkeys').setup {}

require('comfy-line-numbers').setup {
  hidden_filetypes = { 'dashboard', 'minifiles' },
}

require('freeze-code').setup {
  dir = vim.fn.expand '~' .. '/Pictures/screenshots',
  freeze_config = { output = 'code_screen' },
}
