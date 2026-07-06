vim.pack.add {
  gh 'nvim-treesitter/nvim-treesitter',
  gh 'nvim-treesitter/nvim-treesitter-context',
  gh 'nvim-treesitter/nvim-treesitter-textobjects',
}

require('nvim-treesitter').setup {
  ensure_installed = {
    'bash',
    'c',
    'html',
    'lua',
    'vim',
    'vimdoc',
    'http',
    'query',
    'rust',
    'json',
    'java',
    'javascript',
    'typescript',
    'python',
    'graphql',
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
        ['as'] = { query = '@scope', query_group = 'locals', desc = 'Select language scope' },
      },
      selection_modes = {
        ['@parameter.outer'] = 'v',
        ['@function.outer'] = 'V',
        ['@class.outer'] = '<c-v>',
      },
      include_surrounding_whitespace = true,
    },
  },
}
