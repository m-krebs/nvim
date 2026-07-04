vim.pack.add {
  gh 'folke/persistence.nvim',
  gh 'meznaric/key-analyzer.nvim',
  gh '2kabhishek/nerdy.nvim', -- finds nerd glyphs easily
    gh 'Hashino/doing.nvim',
}

local persistence = require 'persistence'
persistence.setup { options = vim.opt.sessionoptions:get() }

-- stylua: ignore start
-- vim.keymap.set('<leader>qs', function() persistence.load() end, { desc = 'Restore Session' })
-- vim.keymap.set('<leader>ql', function() persistence.load { last = true } end, { desc = 'Restore Last Session' })
-- vim.keymap.set('<leader>qd', function() persistence.stop() end, { desc = "Don't Save Current Session" })
-- vim.keymap.set('<leader>sp', function() persistence.select() end, { desc = 'Search [p]rojects' })
-- stylua: ignore end

vim.keymap.set('n', '<leader>da', function() require('doing').add() end, { desc = '[D]oing: [A]dd' })
vim.keymap.set('n', '<leader>dn', function() require('doing').done() end, { desc = '[D]oing: Do[n]e' })
vim.keymap.set('n', '<leader>de', function() require('doing').edit() end, { desc = '[D]oing: [E]dit' })

return {
  {
    'MeanderingProgrammer/render-markdown.nvim',
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

  -- {
  --   'mistricky/codesnap.nvim',
  --   build = 'make build_generator',
  --   cmd = { 'CodeSnap', 'CodeSnapSave', 'CodeSnapSaveHighlight', 'CodeSnapASCII' },
  -- },

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
    'mluders/comfy-line-numbers.nvim',
    event = 'BufReadPre',
    opts = {
      hidden_filetypes = { 'dashboard', 'minifiles' },
    },
  },

  -- {
  --   'shahshlok/vim-coach.nvim',
  --   lazy = false,
  -- },
  {
    'AlejandroSuero/freeze-code.nvim',
    opts = {
      dir = vim.fn.expand '~' .. '/Pictures/screenshots', -- Auto generate file name based on time (absolute or relative to cwd)
      freeze_config = {
        output = 'code_screen',
      },
    },
  },
}
