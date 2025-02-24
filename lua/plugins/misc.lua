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
    version = '*',
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
      {"<leader>rR", function () require('kulala').replay() end, desc = 'Replay last request'},
      {"<leader>r[", function () require('kulala').jump_prev() end, desc = 'Jump to previous'},
      {"<leader>r]", function () require('kulala').jump_next() end, desc = 'Jump to next'},
      {"<leader>rv", function () require('kulala').toggle_view() end, desc = 'Toggle view'},
      {"<leader>r/", function () require('kulala').search() end, desc = 'Search request files'},
      {"<leader>rs", function () require('kulala').scratchpad() end, desc = 'Open Scratchpad'},
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
  {
    'iamcco/markdown-preview.nvim',
    cmd = { 'MarkdownPreviewToggle', 'MarkdownPreview', 'MarkdownPreviewStop' },
    ft = 'markdown',
    build = function()
      vim.opt.rtp:prepend(vim.fn.stdpath 'data' .. '/lazy/markdown-preview.nvim')
      vim.fn['mkdp#util#install']()
    end,
  },
  {
    'mgierada/lazydocker.nvim',
    dependencies = { 'akinsho/toggleterm.nvim' },
    config = function()
      require('lazydocker').setup {}
    end,
    cmd = 'Lazydocker',
    event = 'BufRead',
    keys = {
      {
        '<leader>ld',
        function()
          require('lazydocker').open()
        end,
        desc = 'Open Lazydocker floating window',
      },
    },
  },
  {
    'mistricky/codesnap.nvim',
    build = 'make build_generator',
    cmd = { 'CodeSnap', 'CodeSnapSave', 'CodeSnapSaveHighlight', 'CodeSnapASCII' },
  },
  {
    'meznaric/key-analyzer.nvim',
    cmd = 'KeyAnalyzer',
    opts = {},
  },
  {
    'backdround/global-note.nvim',
    opts = {},
    cmd = 'GlobalNote',
    keys = {
      {
        '<leader>n',
        function()
          require('global-note').toggle_note()
        end,
        desc = 'Global Note',
      },
    },
  },
  {
    'tris203/hawtkeys.nvim',
    cmd = {
      'Hawtkeys',
      'HawtkeysAll',
      'HawtkeysDupes',
    },
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-treesitter/nvim-treesitter',
    },
    opts = {},
  },
  {
    'Hashino/doing.nvim',
    lazy = true,
    cmd = 'Do',
    keys = {
      {
        '<leader>da',
        function()
          require('doing').add()
        end,
        desc = '[D]oing: [A]dd',
      },
      {
        '<leader>dn',
        function()
          require('doing').done()
        end,
        desc = '[D]oing: Do[n]e',
      },
      {
        '<leader>de',
        function()
          require('doing').edit()
        end,
        desc = '[D]oing: [E]dit',
      },
    },
  },
  {
    '2kabhishek/nerdy.nvim',
    cmd = 'Nerdy',
  },
}
