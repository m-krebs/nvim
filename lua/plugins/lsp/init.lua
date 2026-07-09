local map = vim.keymap.set

vim.pack.add {
  gh 'j-hui/fidget.nvim',
  gh 'neovim/nvim-lspconfig',
  gh 'mason-org/mason.nvim',
  gh 'williamboman/mason-lspconfig.nvim',
  gh 'WhoIsSethDaniel/mason-tool-installer.nvim',
  gh 'folke/neoconf.nvim',
}
require('fidget').setup {}
require('neoconf').setup {}
require('mason').setup {
  ui = {
    icons = {
      package_pending = '',
      package_installed = '',
      package_uninstalled = '',
    },
  },
}
map('n', '<leader>cm', '<cmd>Mason<cr>', { desc = 'Mason' })

vim.pack.add { gh 'folke/lazydev.nvim' }
require('lazydev').setup {
  library = {
    { path = '${3rd}/luv/library', words = { 'vim%.uv' } },
  },
}

-- stylua: ignore start
map('n', '<leader>ca', function() vim.lsp.buf.code_action() end, { desc = '[C]ode [A]ctions' })
map('n', '<leader>cr', function() vim.lsp.buf.rename() end, { desc = '[C]ode [R]ename' })
map('n', 'gd', function() vim.lsp.buf.definition() end, { desc = '[G]oto [D]efinition' })
map('n', 'gr', '<cmd>FzfLua lsp_references<CR>', { desc = '[G]oto [R]eferences' })
map('n', 'gI', function() require('fzf-lua').lsp_implementations() end, { desc = '[G]oto [I]mplementation' })
map('n', '<leader>D', function() require('fzf-lua').lsp_typedefs() end, { desc = 'Type [D]efinition' })
map('n', '<leader>ds', function() require('fzf-lua').lsp_document_symbols() end, { desc = '[D]ocument [S]ymbols' })
map('n', '<leader>ws', function() require('fzf-lua').lsp_workspace_symbols() end, { desc = '[W]orkspace [S]ymbols' })
map('n', 'K', function() vim.lsp.buf.hover() end, { desc = 'Hover Documentation' })
map('n', 'gD', function() vim.lsp.buf.declaration() end, { desc = '[G]oto [D]eclaration' })
-- stylua: ignore end

vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('lsp-attach', { clear = true }),
  callback = function(event)
    local client = vim.lsp.get_client_by_id(event.data.client_id)
    if client and client.supports_method 'textDocument/documentHighlight' then
      vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
        buffer = event.buf,
        callback = vim.lsp.buf.document_highlight,
      })
      vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
        buffer = event.buf,
        callback = vim.lsp.buf.clear_references,
      })
    end
  end,
})

vim.lsp.config('*', {
  capabilities = require('blink.cmp').get_lsp_capabilities(),
})

local servers = {
  stylua = {},
  lua_ls = {
    on_init = function(client)
      client.server_capabilities.documentFormattingProvider = false

      if client.workspace_folders then
        local path = client.workspace_folders[1].name
        if path ~= vim.fn.stdpath 'config' and (vim.uv.fs_stat(path .. '/.luarc.json') or vim.uv.fs_stat(path .. '/.luarc.jsonc')) then
          return
        end
      end

      client.config.settings.Lua = vim.tbl_deep_extend('force', client.config.settings.Lua, {
        runtime = {
          version = 'LuaJIT',
          path = { 'lua/?.lua', 'lua/?/init.lua' },
        },
        workspace = {
          checkThirdParty = false,
          library = vim.tbl_extend('force', vim.api.nvim_get_runtime_file('', true), {
            '${3rd}/luv/library',
            '${3rd}/busted/library',
          }),
        },
      })
    end,
    ---@type lspconfig.settings.lua_ls
    settings = {},
  },
  tsgo = {},
  svelte = {},
  kotlin_lsp = {},
}

local ensure_installed = vim.tbl_keys(servers)
require('mason-tool-installer').setup { ensure_installed = ensure_installed }

for name, server in pairs(servers) do
  vim.lsp.config(name, server)
  vim.lsp.enable(name)
end

require 'plugins.lsp.rust'
require 'plugins.lsp.powershell'
