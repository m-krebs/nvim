return {
  { 'tpope/vim-sleuth' }, -- Detect tabstop and shiftwidth automatically
  { 'numToStr/Comment.nvim', opts = {}, event = 'BufRead' },
  {
    'folke/flash.nvim',
    version = '*',
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
  {
    'ibhagwan/fzf-lua',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    lazy = false,
    config = function()
      local fzflua = require 'fzf-lua'

      fzflua.register_ui_select()
      fzflua.setup {
        files = {
          formatter = 'path.filename_first',
        },
      }
    end,
    keys = {
      { '<leader><space>', '<cmd>FzfLua files<CR>', desc = 'Find files' },
      { '<leader>sb', '<cmd>FzfLua blines<CR>', desc = 'FuzzyFind [b]uffer' },
      { '<leader>/', '<cmd>FzfLua live_grep_native<CR>', desc = 'Grep project' },
      { '<leader>,', '<cmd>FzfLua buffers<CR>', desc = 'Search buffers' },
      { '<leader>sk', '<cmd>FzfLua keymaps<CR>', desc = 'Search [k]eymaps' },
      { '<leader>sm', '<cmd>FzfLua marks<CR>', desc = 'Search [m]arks' },
      { '<leader>sM', '<cmd>FzfLua manpages<CR>', desc = 'Search [M]an-pages' },
      { '<leader>sh', '<cmd>FzfLua helptags<CR>', desc = 'Search [H]elptags' },
      { '<leader>sr', '<cmd>FzfLua resume<CR>', desc = 'Search [R]esume' },
      { '<leader>s.', '<cmd>FzfLua oldfiles<CR>', desc = 'Search oldfiles' },
      { '<leader>sd', '<cmd>FzfLua diagnostics_document<CR>', desc = 'Search [d]iagnostics' },
      { '<leader>sc', '<cmd>FzfLua commands<CR>', desc = 'Search [c]ommands' },
      { '<leader>sw', '<cmd>FzfLua grep_cWord<CR>', desc = 'Search current [w]ord' },
      { '<leader>sp', '<cmd>FzfLua zoxide<CR>', desc = 'Search [p]rojects' },
    },
  },
  -- Pretty diagnostics, references, quickfix, location lists
  {
    'folke/trouble.nvim',
    version = '*',
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
    'stevearc/overseer.nvim',
    version = '*',
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
  -- util for quicklist
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
