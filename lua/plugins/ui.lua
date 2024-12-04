return {
  {
    'akinsho/bufferline.nvim',
    event = 'VeryLazy',
    keys = {
      { '<leader>bp', '<Cmd>BufferLineTogglePin<CR>', desc = 'Toggle [p]in' },
      { '<leader>bP', '<Cmd>BufferLineGroupClose ungrouped<CR>', desc = 'Delete non-[p]inned buffers' },
      { '<leader>bo', '<Cmd>BufferLineCloseOthers<CR>', desc = 'Delete [o]ther buffers' },
      { '<leader>br', '<Cmd>BufferLineCloseRight<CR>', desc = 'Delete buffers to the [r]ight' },
      { '<leader>bl', '<Cmd>BufferLineCloseLeft<CR>', desc = 'Delete buffers to the [l]eft' },
      { '<S-h>', '<cmd>BufferLineCyclePrev<cr>', desc = 'Prev buffer' },
      { '<S-l>', '<cmd>BufferLineCycleNext<cr>', desc = 'Next buffer' },
      { '[b', '<cmd>BufferLineCyclePrev<cr>', desc = 'Prev buffer' },
      { ']b', '<cmd>BufferLineCycleNext<cr>', desc = 'Next buffer' },
    },
    opts = {
      options = {
        -- stylua: ignore
        close_command = function(n) require("mini.bufremove").delete(n, false) end,
        -- stylua: ignore
        right_mouse_command = function(n) require("mini.bufremove").delete(n, false) end,
        diagnostics = 'nvim_lsp',
        always_show_bufferline = false,
        -- diagnostics_indicator = function(_, _, diag)
        --   local icons = require('lazyvim.config').icons.diagnostics
        --   local ret = (diag.error and icons.Error .. diag.error .. ' ' or '') .. (diag.warning and icons.Warn .. diag.warning or '')
        --   return vim.trim(ret)
        -- end,
        offsets = {
          {
            filetype = 'neo-tree',
            text = 'Neo-tree',
            highlight = 'Directory',
            text_align = 'left',
          },
        },
      },
    },
    config = function(_, opts)
      require('bufferline').setup(opts)
      -- Fix bufferline when restoring a session
      vim.api.nvim_create_autocmd('BufAdd', {
        callback = function()
          vim.schedule(function()
            pcall(nvim_bufferline)
          end)
        end,
      })
    end,
  },

  -- statusline
  {
    'nvim-lualine/lualine.nvim',
    event = 'VeryLazy',
    opts = function()
      return {
        options = {
          globalstatus = true,
        },
      }
    end,
    dependencies = { 'nvim-tree/nvim-web-devicons' },
  },

  -- Highly experimental plugin that completely replaces the UI for messages, cmdline and the popupmenu.
  {
    'folke/noice.nvim',
    event = 'VeryLazy',
    opts = {
      presets = {
        bottom_search = true,
        command_palette = true,
        inc_rename = true,
      },
    },
    dependencies = {
      -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
      'MunifTanjim/nui.nvim',
      { 'rcarriga/nvim-notify', opts = { render = 'compact', style = 'static', top_down = false } },
    },
  },
  {
    'nvimdev/dashboard-nvim',
    event = 'VimEnter',
    opts = function()
      local hour = tonumber(vim.fn.strftime '%H')
      local part_id = math.floor((hour + 4) / 8) + 1
      local day_part = ({ 'evening', 'morning', 'afternoon', 'evening' })[part_id]
      local username = vim.loop.os_get_passwd()['username'] or 'USERNAME'

      local header = ('Good %s, [ %s ]'):format(day_part, username)

      header = string.rep('\n', 8) .. "I'm using neovim (BTW)" .. '\n\n\n' .. header .. '\n\n\n'

      local opts = {
        theme = 'doom',
        config = {
          header = vim.split(header, '\n'),
          center = {
            {
              action = 'ene | startinsert',
              desc = ' New File',
              icon = ' ',
              key = 'n',
            },
            {
              -- stylua: ignore
              action = function() Utils.telescope.config_files() end,
              desc = ' Config',
              icon = ' ',
              key = 'c',
            },
            {
              -- stylua: ignore
              action = function() require("persistence").load() end,
              desc = ' Restore Session',
              icon = ' ',
              key = 's',
            },
            {
              action = 'Lazy',
              desc = ' Lazy',
              icon = '󰒲 ',
              key = 'l',
            },
            {
              action = 'qa',
              desc = ' Quit',
              icon = ' ',
              key = 'q',
            },
          },
          -- make footer one line (plugins startuptime)
          footer = function()
            local stats = require('lazy').stats()
            local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
            return { 'loaded ' .. stats.loaded .. '/' .. stats.count .. ' plugins in ' .. ms .. 'ms' }
          end,
        },
      }

      for _, button in ipairs(opts.config.center) do
        button.desc = button.desc .. string.rep(' ', 20 - #button.desc)
        button.key_format = '  %s'
        button.key_hl = 'String'
      end

      -- close Lazy and re-open when the dashboard is ready
      if vim.o.filetype == 'lazy' then
        vim.cmd.close()
        vim.api.nvim_create_autocmd('User', {
          pattern = 'DashboardLoaded',
          callback = function()
            require('lazy').show()
          end,
        })
      end

      return opts
    end,
  },
  {
    'folke/which-key.nvim',
    event = 'VeryLazy',
    opts = {
      icons = {
        rules = false,
      },
    },
    config = function(_, opts)
      local wk = require 'which-key'
      wk.add {
        { '<leader>b', group = '[B]uffer' },
        { '<leader>b_', hidden = true },
        { '<leader>c', group = '[C]ode' },
        { '<leader>c_', hidden = true },
        { '<leader>d', group = '[D]ocument' },
        { '<leader>d_', hidden = true },
        { '<leader>f', group = '[F]ile/find' },
        { '<leader>f_', hidden = true },
        { '<leader>g', group = '[G]it' },
        { '<leader>g_', hidden = true },
        { '<leader>q', group = '[Q]uit/session' },
        { '<leader>q_', hidden = true },
        { '<leader>r', group = '[R]est' },
        { '<leader>r_', hidden = true },
        { '<leader>s', group = '[S]earch' },
        { '<leader>s_', hidden = true },
        { '<leader>t', group = '[T]oggleTerminal' },
        { '<leader>t_', hidden = true },
        { '<leader>u', group = 'Options' },
        { '<leader>u_', hidden = true },
        { '<leader><tab>', group = 'Tabs' },
        { '<leader><tab>_', hidden = true },
        { '<leader>w', group = '[W]indow' },
        { '<leader>w_', hidden = true },
        { '<leader>x', group = 'Diagnostics' },
        { '<leader>x_', hidden = true },
      }
      wk.setup(opts)
    end,
  },
  {
    'lukas-reineke/indent-blankline.nvim',
    event = 'BufRead',
    opts = {
      indent = {
        char = '│',
        tab_char = '│',
      },
      scope = { enabled = false },
      exclude = {
        filetypes = {
          'help',
          'alpha',
          'dashboard',
          'neo-tree',
          'Trouble',
          'trouble',
          'lazy',
          'mason',
          'notify',
          'toggleterm',
          'lazyterm',
        },
      },
    },
    main = 'ibl',
  },
  -- show marks in signcolumn
  {
    'chentoast/marks.nvim',
    opts = {},
  },
  'nvim-treesitter/nvim-treesitter-context',

  --  _______________
  -- | Colorschemes |
  -- ---------------

  -- set priority to 1000 of the primary one
  { 'Shatur/neovim-ayu', lazy = true, priority = 1000 },
  { 'folke/tokyonight.nvim', lazy = true },
  { 'eldritch-theme/eldritch.nvim', lazy = true },
  { 'rebelot/kanagawa.nvim', lazy = true },

  -- Highlight todo, notes, etc in comments
  {
    'folke/todo-comments.nvim',
    event = 'BufRead',
    dependencies = { 'nvim-lua/plenary.nvim' },
    opts = { signs = false },
    keys = {
      {
        '<leader>st',
        '<cmd>TodoTelescope<cr>',
        desc = '[S]earch [T]odo',
      },
    },
  },

  { 'nvchad/minty', lazy = true, dependencies = { 'nvchad/volt', lazy = true } },
}
