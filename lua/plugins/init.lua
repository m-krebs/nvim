local function map(keys)
  if type(keys) == 'string' then
    -- simple case: just lhs, no rhs
    vim.keymap.set('n', keys, '<nop>')
    return
  end

  if vim.islist(keys) then
    for _, k in ipairs(keys) do
      map(k)
    end
    return
  end

  -- LazyKeysSpec-style table
  local lhs = keys[1]
  local rhs = keys[2]
  local mode = keys.mode or 'n'
  local ft = keys.ft

  -- copy opts except our custom fields
  local opts = {}
  for k, v in pairs(keys) do
    if k ~= 1 and k ~= 2 and k ~= 'mode' and k ~= 'ft' then
      opts[k] = v
    end
  end

  if ft then
    vim.api.nvim_create_autocmd('FileType', {
      pattern = ft,
      callback = function(ev)
        vim.keymap.set(mode, lhs, rhs, vim.tbl_extend('force', opts, {
          buffer = ev.buf,
        }))
      end,
    })
  else
    vim.keymap.set(mode, lhs, rhs, opts)
  end
end

do
vim.pack.add { gh 'ibhagwan/fzf-lua' }
local fzflua = require 'fzf-lua'
fzflua.register_ui_select() -- register fzflua as vim.ui.select
fzflua.setup(
{
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
      file_ignore_patterns = { 'lazy-lock.json' },
      files = {
        formatter = 'path.filename_first',
      },
      buffers = {
        formatter = 'path.filename_first',
      },
    }
)

  -- vim.keymap.set({ 'n', 'v' }, '<leader><space>', function() require('conform').format { async = true } end, { desc = '[F]ormat buffer' })
  vim.keymap.set({ 'n', 'v' }, '<leader><space>', '<cmd>FzfLua files<CR>', { desc = 'Find files' })
  map({ '<leader>sb', '<cmd>FzfLua blines<CR>', desc = 'FuzzyFind [b]uffer' })
      map({ '<leader><space>', '<cmd>FzfLua files<CR>', desc = 'Find files' })
map(      {
        '<leader>/',
        function()
          require('fzf-lua').live_grep_native { filter = "rg -v 'lazy-lock.json'" }
        end,
        desc = 'Grep project',
      })
   map(   { '<leader>,', '<cmd>FzfLua buffers<CR>', desc = 'Search buffers' })
      map({ '<leader>sk', '<cmd>FzfLua keymaps<CR>', desc = 'Search [k]eymaps' })
      map({ '<leader>sm', '<cmd>FzfLua marks<CR>', desc = 'Search [m]arks' })
      map({ '<leader>sM', '<cmd>FzfLua manpages<CR>', desc = 'Search [M]an-pages' })
      map({ '<leader>sh', '<cmd>FzfLua helptags<CR>', desc = 'Search [H]elptags' })
      map({ '<leader>sr', '<cmd>FzfLua resume<CR>', desc = 'Search [R]esume' })
      map({ '<leader>sd', '<cmd>FzfLua diagnostics_document<CR>', desc = 'Search [d]iagnostics' })
      map({ '<leader>sc', '<cmd>FzfLua commands<CR>', desc = 'Search [c]ommands' })
      map({ '<leader>sw', '<cmd>FzfLua grep_cWord<CR>', desc = 'Search current [w]ord' })
      map({ '<leader>f.', '<cmd>FzfLua oldfiles<CR>', desc = 'Search oldfiles' })
end

require 'plugins.dashboard'
require 'plugins.mini'

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
