return {
  {
    'folke/neoconf.nvim',
    version = '*',
    opts = true,
  },
  {
    'neovim/nvim-lspconfig',
    event = 'BufReadPre',
    dependencies = {
      'saghen/blink.cmp',
      {
        'folke/lazydev.nvim',
        version = '*',
        ft = 'lua',
        opts = {
          library = {
            { path = '${3rd}/luv/library', words = { 'vim%.uv' } },
          },
        },
      },
      'williamboman/mason.nvim', -- lsp package manager
      { 'williamboman/mason-lspconfig.nvim', version = '*' },
      'WhoIsSethDaniel/mason-tool-installer.nvim',

      -- Useful status updates for LSP.
      { 'j-hui/fidget.nvim', version = '*', opts = {} },
    },
    -- stylua: ignore
    keys = {
      { '<leader>ca', function() vim.lsp.buf.code_action() end, desc = '[C]ode [A]ctions' },
      { '<leader>cr', function () vim.lsp.buf.rename() end, desc = '[C]ode [R]ename' },
      { 'gd', function () vim.lsp.buf.definition() end, desc = '[G]oto [D]efinition' },
      { 'gr', '<cmd>FzfLua lsp_references<CR>', desc = '[G]oto [R]eferences' },
      { 'gI', function() require('fzf-lua').lsp_implementations() end, desc = '[G]oto [I]mplementation' },
      -- Jump to the type of the word under your cursor.
      --  Useful when you're not sure what type a variable is and you want to see
      --  the definition of its *type*, not where it was *defined*.
      { '<leader>D', function() require('fzf-lua').lsp_typedefs() end, desc = 'Type [D]efinition' },
      -- Fuzzy find all the symbols in your current document.
      --  Symbols are things like variables, functions, types, etc.
      { '<leader>ds', function() require('fzf-lua').lsp_document_symbols() end, desc = '[D]ocument [S]ymbols' },
      -- Fuzzy find all the symbols in your current workspace
      --  Similar to document symbols, except searches over your whole project.
      { '<leader>ws', function() require('fzf-lua').lsp_workspace_symbols() end, desc = '[W]orkspace [S]ymbols' },
      { 'K', function() vim.lsp.buf.hover() end, desc = 'Hover Documentation' },
      -- In C this would take you to the header
      { 'gD', function() vim.lsp.buf.declaration() end, desc = '[G]oto [D]eclaration' },
    },
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
      -- capabilities = vim.tbl_deep_extend('force', capabilities, require('cmp_nvim_lsp').default_capabilities())

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
  {
    'williamboman/mason.nvim',
    cmd = 'Mason',
    keys = { { '<leader>cm', '<cmd>Mason<cr>', desc = 'Mason' } },
    build = ':MasonUpdate',
    opts = {
      ui = {
        icons = {
          package_installed = '',
          package_uninstalled = '',
          package_pending = '',
        },
      },
    },
  },
}
