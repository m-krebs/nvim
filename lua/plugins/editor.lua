vim.pack.add {
  gh 'tpope/vim-sleuth',
  gh 'numToStr/Comment.nvim',
  gh 'stevearc/quicker.nvim',
  gh 'error311/wayfinder.nvim',
  gh 'pteroctopus/faster.nvim',
}

return {
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
}
