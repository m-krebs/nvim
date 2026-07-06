local map = vim.keymap.set

vim.pack.add { gh 'ibhagwan/fzf-lua', gh 'folke/todo-comments.nvim' }
local fzflua = require 'fzf-lua'
-- register fzflua as vim.ui.select
fzflua.register_ui_select()
fzflua.setup {
  fzf_bin = 'sk',
  previewers = {
    builtin = {
      extensions = {
        ['png'] = { 'chafa' },
        ['jpg'] = { 'chafa' },
      },
    },
  },
  fzf_opts = {
    ['--cycle'] = true,
  },
  file_ignore_patterns = { 'nvim-pack-lock.json' },
  files = {
    formatter = 'path.filename_first',
  },
  buffers = {
    formatter = 'path.filename_first',
  },
}

map({ 'n', 'v' }, '<leader><space>', '<cmd>FzfLua files<cr>', { desc = 'Find files' })
map({ 'n', 'v' }, '<leader>sb', '<cmd>FzfLua blines<cr>', { desc = 'FuzzyFind [b]uffer' })
map({ 'n', 'v' }, '<leader>/', function()
  require('fzf-lua').live_grep_native { filter = "rg -v 'nvim-pack-lock.json'" }
end, { desc = 'Grep project' })
map({ 'n', 'v' }, '<leader>,', '<cmd>FzfLua buffers<cr>', { desc = 'Search buffers' })
map({ 'n', 'v' }, '<leader>sk', '<cmd>FzfLua keymaps<cr>', { desc = 'Search [k]eymaps' })
map({ 'n', 'v' }, '<leader>sm', '<cmd>FzfLua marks<cr>', { desc = 'Search [m]arks' })
map({ 'n', 'v' }, '<leader>sM', '<cmd>FzfLua manpages<cr>', { desc = 'Search [M]an-pages' })
map({ 'n', 'v' }, '<leader>sh', '<cmd>FzfLua helptags<cr>', { desc = 'Search [H]elptags' })
map({ 'n', 'v' }, '<leader>sr', '<cmd>FzfLua resume<cr>', { desc = 'Search [R]esume' })
map({ 'n', 'v' }, '<leader>sd', '<cmd>FzfLua diagnostics_document<cr>', { desc = 'Search [d]iagnostics' })
map({ 'n', 'v' }, '<leader>sc', '<cmd>FzfLua commands<cr>', { desc = 'Search [c]ommands' })
map({ 'n', 'v' }, '<leader>sw', '<cmd>FzfLua grep_cWord<cr>', { desc = 'Search current [w]ord' })
map({ 'n', 'v' }, '<leader>f.', '<cmd>FzfLua oldfiles<cr>', { desc = 'Search oldfiles' })

require('todo-comments').setup { signs = false }
vim.keymap.set('n', '<leader>st', '<cmd>TodoFzfLua<cr>', { desc = '[S]earch [T]odo' })
