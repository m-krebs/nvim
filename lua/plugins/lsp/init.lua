return {
  {
    'folke/neoconf.nvim',
    opts = true,
  },
  { -- LSP Configuration & Plugins
    'neovim/nvim-lspconfig',
    event = 'BufReadPre',
    dependencies = {
      -- Automatically install LSPs and related tools to stdpath for neovim
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',
      'WhoIsSethDaniel/mason-tool-installer.nvim',

      -- Useful status updates for LSP.
      { 'j-hui/fidget.nvim', opts = {} },
    },
    -- stylua: ignore
    keys = {
      -- Execute a code action, usually your cursor needs to be on top of an error
      -- or a suggestion from your LSP for this to activate.
      { '<leader>ca', function() vim.lsp.buf.code_action() end, desc = '[C]ode [A]ctions' },
      -- Rename the variable under your cursor
      --  Most Language Servers support renaming across files, etc.
      { '<leader>cr', function () vim.lsp.buf.rename() end, desc = '[C]ode [R]ename' },
      -- Jump to the definition of the word under your cursor. Jump back with <C-T>.
      { 'gd', function() require('telescope.builtin').lsp_definitions() end, desc = '[G]oto [D]efinition' },
      -- Find references for the word under your cursor.
      { 'gr', function() require('telescope.builtin').lsp_references() end, desc = '[G]oto [R]eferences' },
      -- Jump to the implementation of the word under your cursor.
      --  Useful when your language has ways of declaring types without an actual implementation.
      { 'gI', function() require('telescope.builtin').lsp_implementations() end, desc = '[G]oto [I]mplementation' },
      -- Jump to the type of the word under your cursor.
      --  Useful when you're not sure what type a variable is and you want to see
      --  the definition of its *type*, not where it was *defined*.
      { '<leader>D', function() require('telescope.builtin').lsp_type_definitions() end, desc = 'Type [D]efinition' },
      -- Fuzzy find all the symbols in your current document.
      --  Symbols are things like variables, functions, types, etc.
      { '<leader>ds', function() require('telescope.builtin').lsp_document_symbols() end, desc = '[D]ocument [S]ymbols' },
      -- Fuzzy find all the symbols in your current workspace
      --  Similar to document symbols, except searches over your whole project.
      { '<leader>ws', function() require('telescope.builtin').lsp_dynamic_workspace_symbols() end, desc = '[W]orkspace [S]ymbols' },
      -- Opens a popup that displays documentation about the word under your cursor
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
        },
      }
    end,
    config = function(_, opts)
      vim.api.nvim_create_autocmd('LspAttach', {
        group = vim.api.nvim_create_augroup('kickstart-lsp-attach', { clear = true }),
        callback = function(event)
          -- helper function to ease of defining mapping for LSP related items
          -- (sets mode, buffer, description)
          local map = function(keys, func, desc)
            vim.keymap.set('n', keys, func, { buffer = event.buf, desc = 'LSP: ' .. desc })
          end

          -- The following two autocommands are used to highlight references of the
          -- word under your cursor when your cursor rests there for a little while.
          --    See `:help CursorHold` for information about when this is executed
          --
          -- When you move your cursor, the highlights will be cleared (the second autocommand).
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

      -- LSP servers and clients are able to communicate to each other what features they support.
      --  By default, Neovim doesn't support everything that is in the LSP Specification.
      --  When you add nvim-cmp, luasnip, etc. Neovim now has *more* capabilities.
      --  So, we create new capabilities with nvim cmp, and then broadcast that to the servers.
      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities = vim.tbl_deep_extend('force', capabilities, require('cmp_nvim_lsp').default_capabilities())

      -- Enable the following language servers
      --  Feel free to add/remove any LSPs that you want here. They will automatically be installed.
      --
      --  Add any additional override configuration in the following tables. Available keys are:
      --  - cmd (table): Override the default command used to start the server
      --  - filetypes (table): Override the default list of associated filetypes for the server
      --  - capabilities (table): Override fields in capabilities. Can be used to disable certain LSP features.
      --  - settings (table): Override the default settings passed when initializing the server.
      --        For example, to see the options for `lua_ls`, you could go to: https://luals.github.io/wiki/settings/
      local servers = {
        -- clangd = {},
        -- gopls = {},
        pyright = {},
        -- rust_analyzer = {},
        -- ... etc. See `:help lspconfig-all` for a list of all the pre-configured LSPs
        --
        -- Some languages (like typescript) have entire language plugins that can be useful:
        --    https://github.com/pmizio/typescript-tools.nvim
        --
        -- But for many setups, the LSP (`tsserver`) will work just fine
        -- tsserver = {},
        --
      }

      -- Ensure the servers and tools above are installed
      --  To check the current status of installed tools and/or manually install
      --  other tools, you can run
      --    :Mason
      --
      --  You can press `g?` for help in this menu
      require('mason').setup()

      -- You can add other tools here that you want Mason to install
      -- for you, so that they are available from within Neovim.
      local ensure_installed = vim.tbl_keys(servers or {})
      vim.list_extend(ensure_installed, {
        'stylua', -- Used to format lua code
      })
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
  {
    'mrcjkb/rustaceanvim',
    version = '^5', -- Recommended
    lazy = false, -- This plugin is already lazy
  },
}
