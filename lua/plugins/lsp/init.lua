local map = vim.keymap.set

-- status updates for LSP
vim.pack.add {
  gh 'j-hui/fidget.nvim',
  gh 'neovim/nvim-lspconfig',
  gh 'mason-org/mason.nvim',
  gh 'williamboman/mason-lspconfig.nvim',
  gh 'WhoIsSethDaniel/mason-tool-installer.nvim',
}
require('fidget').setup {}
require('mason').setup {
  ui = {
    icons = {
      package_pending = '',
      package_installed = '',
      package_uninstalled = '',
    },
  },
}
map('n', '<leader>cm', '<cmd>Mason<cr>', { desc = 'Mason' })

-- faster luaLS configuration
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
-- Jump to the type of the word under your cursor.
--  Useful when you're not sure what type a variable is and you want to see
--  the definition of its *type*, not where it was *defined*.
map('n', '<leader>D', function() require('fzf-lua').lsp_typedefs() end, { desc = 'Type [D]efinition' })
-- Fuzzy find all the symbols in your current document.
--  Symbols are things like variables, functions, types, etc.
map('n', '<leader>ds', function() require('fzf-lua').lsp_document_symbols() end, { desc = '[D]ocument [S]ymbols' })
-- Fuzzy find all the symbols in your current workspace
--  Similar to document symbols, except searches over your whole project.
map('n', '<leader>ws', function() require('fzf-lua').lsp_workspace_symbols() end, { desc = '[W]orkspace [S]ymbols' })
map('n', 'K', function() vim.lsp.buf.hover() end, { desc = 'Hover Documentation' })
-- In C this would take you to the header
map('n', 'gD', function() vim.lsp.buf.declaration() end, { desc = '[G]oto [D]eclaration' })
-- stylua: ignore end

local servers = {
  -- See `:help lspconfig-all` for a list of pre-configured LSPs
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
  ts_ls = {},
  svelte = {},
}

local ensure_installed = vim.tbl_keys(servers or {})

require('mason-tool-installer').setup { ensure_installed = ensure_installed }

for name, server in pairs(servers) do
  vim.lsp.config(name, server)
  vim.lsp.enable(name)
end

require 'plugins.lsp.rust'

return {
  require 'plugins.lsp.rust',
  require 'plugins.lsp.powershell',

  {
    'neovim/nvim-lspconfig',
    event = { 'BufReadPre', 'BufNewFile' },
    dependencies = {
      { 'folke/neoconf.nvim', version = '*', cmd = 'Neoconf', opts = {} },
      -- lsp package manager
      { 'mason-org/mason.nvim' },
      { 'williamboman/mason-lspconfig.nvim', version = '*' },
      { 'WhoIsSethDaniel/mason-tool-installer.nvim' },
      -- Useful status updates for LSP.
      { 'j-hui/fidget.nvim', version = '*', opts = {} },
    },
    -- stylua: ignore
    opts = function()
      return {
        setup = {
          jdtls = function()
            return true -- let nvim-jdtls handle the setup
          end,
          rust_analyzer = function()
            return true -- let rustaceanvim handle the setup
          end,
        },
      }
    end,
    config = function(_, opts)
      vim.api.nvim_create_autocmd('LspAttach', {
        group = vim.api.nvim_create_augroup('lsp-attach', { clear = true }),
        callback = function(event)
          -- Highlights references of word under cursor. Clears on move (2nd aucmd)
          --    See `:help CursorHold` for information about when this is executed
          local client = vim.lsp.get_client_by_id(event.data.client_id)
          if client and client.server_capabilities.documentHighlightProvider then
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

      -- capabilities = vim.tbl_deep_extend('force', capabilities, require('cmp_nvim_lsp').default_capabilities())
      local capabilities = require('blink.cmp').get_lsp_capabilities()

      -- Enable the following language servers
      --  Add any additional override configuration in the following tables. Available keys are:
      --  - cmd (table): Override the default command used to start the server
      --  - filetypes (table): Override the default list of associated filetypes for the server
      --  - capabilities (table): Override fields in capabilities. Can be used to disable certain LSP features.
      --  - settings (table): Override the default settings passed when initializing the server.
      --        For example, to see the options for `lua_ls`, you could go to: https://luals.github.io/wiki/settings/
      local servers = {
        -- See `:help lspconfig-all` for a list of pre-configured LSPs
        stylua = {},
        lua_ls = {},
        svelte = {},
        kotlin_lsp = {},
      }

      require('mason').setup()

      local ensure_installed = vim.tbl_keys(servers or {})

      require('mason-tool-installer').setup { ensure_installed = ensure_installed }

      require('mason-lspconfig').setup {
        handlers = {
          function(server_name)
            local server_opts = vim.tbl_deep_extend('force', {
              capabilities = vim.deepcopy(capabilities),
            }, servers[server_name] or {})

            -- checks if there is
            if opts.setup[server_name] then
              if opts.setup[server_name](server_name, server_opts) then
                return
              end
            elseif opts.setup['*'] then
              if opts.setup['*'](server_name, server_opts) then
                return
              end
            end
            require('lspconfig')[server_name].setup(server_opts)
          end,
        },
      }
    end,
  },
}
