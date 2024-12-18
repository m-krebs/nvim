return {
  { -- Highlight, edit, and navigate code
    'nvim-treesitter/nvim-treesitter',
    event = 'BufReadPre',
    build = ':TSUpdate',
    config = function()
      ---@diagnostic disable-next-line: missing-fields
      require('nvim-treesitter.configs').setup {
        ensure_installed = {
          'bash',
          'c',
          'html',
          'lua',
          'markdown',
          'vim',
          'vimdoc',
          'http',
          'query',
          'rust',
          'json',
          'java',
          'javascript',
          'python',
        },
        auto_install = false,
        highlight = { enable = true },
        indent = { enable = true },
        textobjects = {
          select = {
            enable = true,
            lookahead = true,
            keymaps = {
              ['af'] = '@function.outer',
              ['if'] = '@function.inner',
              ['ac'] = '@class.outer',
              ['ic'] = '@class.inner',
              ['as'] = { query = '@scope', query_grouup = 'locals', desc = 'Select language scope' },
            },
            selection_modes = {
              ['@parameter.outer'] = 'v', --charwise
              ['@function.outer'] = 'V', -- linewise
              ['@class.outer'] = '<c-v>', -- blockwise
            },
            include_surrounding_whitespace = true,
          },
        },
      }
    end,
  },
  {
    'nvim-treesitter/nvim-treesitter-textobjects',
  },
}
