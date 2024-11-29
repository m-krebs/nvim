return {
  {
    'echasnovski/mini.files',
    opts = {
      windows = {
        preview = true,
        width_focus = 30,
        width_preview = 50,
      },
      options = {
        use_as_default_explorer = true, -- Whether to use for editing directories
      },
    },
    keys = {
      {
        '<leader>fm',
        function()
          require('mini.files').open(vim.api.nvim_buf_get_name(0), true)
        end,
        desc = 'Open mini.files (directory of current file)',
      },
      {
        '<leader>fM',
        function()
          require('mini.files').open(vim.loop.cwd(), true)
        end,
        desc = 'Open mini.files (cwd)',
      },
    },
    config = function(_, opts)
      require('mini.files').setup(opts)

      local show_dotfiles = true
      local filter_show = function(fs_entry)
        return true
      end
      local filter_hide = function(fs_entry)
        return not vim.startswith(fs_entry.name, '.')
      end

      local toggle_dotfiles = function()
        show_dotfiles = not show_dotfiles
        local new_filter = show_dotfiles and filter_show or filter_hide
        require('mini.files').refresh { content = { filter = new_filter } }
      end

      vim.api.nvim_create_autocmd('User', {
        pattern = 'MiniFilesBufferCreate',
        callback = function(args)
          local buf_id = args.data.buf_id
          -- Tweak left-hand side of mapping to your liking
          vim.keymap.set('n', 'g.', toggle_dotfiles, { buffer = buf_id })
        end,
      })

      -- vim.api.nvim_create_autocmd('User', {
      --   pattern = 'MiniFilesActionRename',
      --   callback = function(event)
      --     require('lazyvim.util').lsp.on_rename(event.data.from, event.data.to)
      --   end,
      -- })
    end,
  },
  -- Flash enhances the built-in search functionality by showing labels
  -- at the end of each match, letting you quickly jump to a specific
  -- location.
  {
    'folke/flash.nvim',
    event = 'VeryLazy',
    vscode = true,
    opts = {
      modes = {
        search = {
          enabled = true,
        },
      },
    },
    -- stylua: ignore
    keys = {
      { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
      { "S", mode = { "n", "o", "x" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
      { "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
      { "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
      { "<c-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
    },
  },
  -- buffer remove
  {
    'echasnovski/mini.bufremove',
    keys = {
      {
        '<leader>bd',
        function()
          local bd = require('mini.bufremove').delete
          if vim.bo.modified then
            local choice = vim.fn.confirm(('Save changes to %q?'):format(vim.fn.bufname()), '&Yes\n&No\n&Cancel')
            if choice == 1 then -- Yes
              vim.cmd.write()
              bd(0)
            elseif choice == 2 then -- No
              bd(0, true)
            end
          else
            bd(0)
          end
        end,
        desc = '[D]elete Buffer',
      },
      -- stylua: ignore
      { "<leader>bD", function() require("mini.bufremove").delete(0, true) end, desc = "[D]elete Buffer (Force)" },
    },
  },
  { -- Fuzzy Finder (files, lsp, etc)
    'nvim-telescope/telescope.nvim',
    -- cmd = { 'Telescope' },
    version = '*', -- stable (excludes prereleases)
    dependencies = {
      'nvim-lua/plenary.nvim',
      {
        'FabianWirth/search.nvim',
        opts = {
          -- stylua: ignore
          tabs = {
            { name = 'Files', function() Utils.telescope('find_files', { hidden = true }) end, },
            { name = 'Git files', function() Utils.telescope 'git_files' end, },
            { name = 'Grep', function() Utils.telescope 'live_grep' end, },
            { name = 'Buffers', function() Utils.telescope('buffers', { sort_mru = true, sort_lastused = true }) end, },
          },
          collections = {
            git = {
              tabs = {
                {
                  name = 'Commits',
                  function()
                    Utils.telescope 'git_commits'
                  end,
                },
              },
            },
            search = {
              tabs = {
                {
                  name = 'Help',
                  function()
                    Utils.telescope 'help_tags'
                  end,
                },
                {
                  name = 'Keymaps',
                  function()
                    Utils.telescope 'keymaps'
                  end,
                },
                {
                  name = 'Commands',
                  function()
                    Utils.telescope 'commands'
                  end,
                },
                {
                  name = 'Man Pages',
                  function()
                    Utils.telescope 'man_pages'
                  end,
                },
              },
            },
          },
        },
      },
      { -- If encountering errors, see telescope-fzf-native README for install instructions
        'nvim-telescope/telescope-fzf-native.nvim',

        -- `build` is used to run some command when the plugin is installed/updated.
        -- This is only run then, not every time Neovim starts up.
        build = 'make',

        -- `cond` is a condition used to determine whether this plugin should be
        -- installed and loaded.
        cond = function()
          return vim.fn.executable 'make' == 1
        end,
      },
      { 'nvim-telescope/telescope-ui-select.nvim' },

      -- Useful for getting pretty icons, but requires a Nerd Font.
      { 'nvim-tree/nvim-web-devicons', enabled = vim.g.have_nerd_font },
    },
    config = function()
      local filename_first = function(_, path)
        local tail = vim.fs.basename(path)
        local parent = vim.fs.dirname(path)
        if parent == '.' then
          return tail
        end
        return string.format('%s\t\t%s', tail, parent)
      end

      vim.api.nvim_create_autocmd('FileType', {
        pattern = 'TelescopeResults',
        callback = function(ctx)
          vim.api.nvim_buf_call(ctx.buf, function()
            vim.fn.matchadd('TelescopeParent', '\t\t.*$')
            vim.api.nvim_set_hl(0, 'TelescopeParent', { link = 'Comment' })
          end)
        end,
      })
      -- [[ Configure Telescope ]]
      -- See `:help telescope` and `:help telescope.setup()`
      require('telescope').setup {
        -- defaults = {
        --   mappings = {
        --     i = { ['<c-enter>'] = 'to_fuzzy_refine' },
        --   },
        -- },
        pickers = {
          find_files = { path_display = filename_first },
        },
        extensions = {
          ['ui-select'] = {
            require('telescope.themes').get_dropdown(),
          },
        },
      }

      -- Enable telescope extensions, if they are installed
      pcall(require('telescope').load_extension, 'fzf')
      pcall(require('telescope').load_extension, 'ui-select')

      -- See `:help telescope.builtin`
      local builtin = require 'telescope.builtin'
      local search = require 'search'

      vim.keymap.set('n', '<leader><space>', function()
        search.open()
      end, { desc = '[ ] Find files (root dir)' })
      -- find
      vim.keymap.set('n', '<leader>fc', function()
        builtin.find_files { name = 'Git Files', cwd = vim.fn.stdpath 'config' }
      end, { desc = 'Find Neovim [C]onfig files' })
      -- search
      vim.keymap.set('n', '<leader>/', function()
        search.open { tab_name = 'Grep' }
      end, { desc = 'Grep (root dir)' })

      vim.keymap.set('n', '<leader>sC', function()
        search.open { collection = 'search', tab_name = 'Commands' }
      end, { desc = '[S]earch [C]ommands' })

      vim.keymap.set('n', '<leader>sh', function()
        search.open { collection = 'search' }
      end, { desc = '[H]elp Pages' })

      vim.keymap.set('n', '<leader>sk', function()
        search.open { collection = 'search', tab_name = 'Keymaps' }
      end, { desc = '[K]ey Maps' })

      vim.keymap.set('n', '<leader>sf', search.open, { desc = '[S]earch [F]iles' })
      vim.keymap.set('n', '<leader>sm', builtin.marks, { desc = 'Jump to [M]ark' })
      vim.keymap.set('n', '<leader>sM', function()
        search.open { collection = 'search', tab_name = 'Man Pages' }
      end, { desc = '[S]earch [M]an Pages' })
      vim.keymap.set('n', '<leader>ss', builtin.builtin, { desc = '[S]earch [S]elect Telescope' })
      vim.keymap.set('n', '<leader>sw', builtin.grep_string, { desc = '[S]earch current [W]ord' })
      vim.keymap.set('n', '<leader>sg', function()
        search.open { tab_name = 'Grep' }
      end, { desc = '[S]earch by [G]rep' })
      vim.keymap.set('n', '<leader>sd', builtin.diagnostics, { desc = '[S]earch [D]iagnostics' })
      vim.keymap.set('n', '<leader>sr', builtin.resume, { desc = '[S]earch [R]esume' })
      vim.keymap.set('n', '<leader>s.', builtin.oldfiles, { desc = '[S]earch Recent Files ("." for repeat)' })

      vim.keymap.set('n', '<leader>sb', function()
        -- You can pass additional configuration to telescope to change theme, layout, etc.
        builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
          winblend = 4,
          previewer = false,
        })
      end, { desc = 'Fuzzily search in current [b]uffer' })
      vim.keymap.set('n', '<leader>,', function()
        search.open { tab_name = 'Buffers' }
      end, { desc = 'Switch [B]uffer' })

      -- Also possible to pass additional configuration options.
      --  See `:help telescope.builtin.live_grep()` for information about particular keys
      vim.keymap.set('n', '<leader>s/', function()
        builtin.live_grep {
          grep_open_files = true,
          prompt_title = 'Live Grep in Open Files',
        }
      end, { desc = '[S]earch [/] in Open Files' })
    end,
  },

  -- Pretty diagnostics, references, quickfix, location lists
  {
    'folke/trouble.nvim',
    cmd = { 'Trouble' },
    keys = {
      {
        '<leader>xx',
        '<cmd>Trouble diagnostics toggle<cr>',
        desc = 'Diagnostics',
      },
      {
        '<leader>cs',
        '<cmd>Trouble symbols toggle focus=false<cr>',
        desc = '[S]ymbols',
      },
    },
    opts = {},
  },
  {
    'rachartier/tiny-inline-diagnostic.nvim',
    event = 'BufRead',
    opts = {},
  },
  {
    'stevearc/overseer.nvim',
    lazy = true,
    cmd = {
      'OverseerBuild',
      'OverseerClearCache',
      'OverseerClose',
      'OverseerDeleteBundle',
      'OverseerLoadBundle',
      'OverseerInfo',
      'OverseerOpen',
      'OverseerQuickAction',
      'OverseerRun',
      'OverseerRunCmd',
      'OverseerSaveBundle',
      'OverseerTaskAction',
      'OverseerToggle',
    },
    keys = {
      {
        '<leader>o',
        '<cmd>OverseerRun<cr>',
        desc = 'Overseer Run',
      },
      {
        '<leader>ot',
        '<cmd>OverseerToggle<cr>',
        desc = 'Overseer [T]oggle',
      },
      {
        '<leader>oq',
        '<cmd>OverseerQuickAction<cr>',
        desc = 'Overseer [Q]uickAction',
      },
    },
    opts = {},
  },
  {
    'gabrielpoca/replacer.nvim',
    keys = {
      {
        '<leader>h',
        function()
          require('replacer').run()
        end,
        desc = 'Replacer',
      },
    },
  },
}
