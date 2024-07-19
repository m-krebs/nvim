return {
  {
    'mfussenegger/nvim-dap',
    event = 'VeryLazy',
    dependencies = {
      'nvim-neotest/nvim-nio', -- Is required for nvim-dap-ui

      -- Installs the debug adapters for you
      'williamboman/mason.nvim',
      {
        'jay-babu/mason-nvim-dap.nvim',
        opts = {
          automatic_setup = true, -- tries to setup preconfigured debuggers

          -- You can provide additional configuration to the handlers,
          -- see mason-nvim-dap README for more information
          handlers = {},

          -- You'll need to check that you have the required things installed
          -- online, please don't ask me how to install them :)
          ensure_installed = {
            -- Update this to ensure that you have the debuggers for the langs you want
            'delve',
            'java-debug-adapter',
            'java-test',
          },
        },
      },

      -- Add your own debuggers here
      'leoluz/nvim-dap-go',
    },
    -- stylua: ignore
    keys = {
      { '<F5>', function() require('dap').continue() end, desc = 'Debug: Start/Continue' },
      { '<F1>', function () require('dap').step_into() end, desc = 'Debug: Step Into' },
      { '<F2>', function() require('dap').step_over() end, desc = 'Debug: Step Over' },
      { '<F3>', function() require('dap').step_out() end, desc = 'Debug: Step Out' },
      { '<leader>db', function () require('dap').toggle_breakpoint() end, desc = 'Toggle Breakpoint' },
      { '<leader>dB', function() require('dap').set_breakpoint(vim.fn.input 'Breakpoint condition: ') end, desc = 'Debug: Set Breakpoint' },
    },
    config = function()
      local dap = require 'dap'
      local dapui = require 'dapui'

      dap.listeners.after.event_initialized['dapui_config'] = dapui.open
      dap.listeners.before.event_terminated['dapui_config'] = dapui.close
      dap.listeners.before.event_exited['dapui_config'] = dapui.close

      require('dap-go').setup()

      dap.configurations.java = {
        {
          type = 'java',
          request = 'attach',
          name = 'Debug (Attach) - Remote',
          hostName = '127.0.0.1',
          port = 5005,
        },
      }
    end,
  },
  {
    'rcarriga/nvim-dap-ui',
    opts = {
      icons = { expanded = '▾', collapsed = '▸', current_frame = '*' },
      controls = {
        icons = {
          pause = '⏸',
          play = '▶',
          step_into = '⏎',
          step_over = '⏭',
          step_out = '⏮',
          step_back = 'b',
          run_last = '▶▶',
          terminate = '⏹',
          disconnect = '⏏',
        },
      },
    },
    keys = {
      { '<F7>', '<cmd>lua require("dapui").toggle()<CR>', desc = 'Debug: See last session result.' },
      { '<leader>du', '<cmd>lua require("dapui").toggle()<CR>', desc = 'Debug: See last session result.' },
    },
  },
}
