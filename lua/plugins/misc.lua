vim.filetype.add {
  extension = {
    ['http'] = 'http',
  },
}
return {
  -- Session management
  {
    'folke/persistence.nvim',
    event = 'BufReadPre',
    opts = { options = vim.opt.sessionoptions:get() },
    -- stylua: ignore
    keys = {
      { "<leader>qs", function() require("persistence").load() end, desc = "Restore Session" },
      { "<leader>ql", function() require("persistence").load({ last = true }) end, desc = "Restore Last Session" },
      { "<leader>qd", function() require("persistence").stop() end, desc = "Don't Save Current Session" },
    },
  },
  {
    'mistweaverco/kulala.nvim', -- HTTP REST-Client Interface
    ft = 'http',
    opts = {},
    dependencies = {
      {
        'nvim-treesitter/nvim-treesitter',
        opts = {
          ensure_installed = { 'http', 'graphql' },
        },
      },
    },
    -- stylua: ignore
    keys = {
      {"<leader>r", "", desc = "+[R]est"},
      {"<leader>rr", function () require('kulala').run() end, desc = 'Run request'},
      {"<leader>r[", function () require('kulala').jump_prev() end, desc = 'Jump to previous'},
      {"<leader>r]", function () require('kulala').jump_next() end, desc = 'Jump to next'},
      {"<leader>rv", function () require('kulala').toggle_view() end, desc = 'Toggle view'}
    },
  },
  {
    'MeanderingProgrammer/markdown.nvim',
    ft = 'markdown',
    dependencies = {
      'nvim-treesitter/nvim-treesitter',
      'nvim-tree/nvim-web-devicons',
    },
    opts = {},
  },
}
