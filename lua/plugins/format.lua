return {
  -- Autoformat
  {
    'stevearc/conform.nvim',
    opts = {
      notify_on_error = false,
      format_on_save = {
        timeout_ms = 800,
        lsp_fallback = true,
      },
      formatters = {
        kulala = {
          command = 'kulala-fmt',
          args = { '$FILENAME' },
          stdin = false,
        },
      },
      formatters_by_ft = {
        sh = { 'shfmt' },
        lua = { 'stylua' },
        json = { 'prettier' },
        javascript = { 'prettier' },
        html = { 'prettier' },
        http = { 'kulala' },
        rest = { 'kulala' },
        -- Conform can also run multiple formatters sequentially
        -- python = { "isort", "black" },
        --
        -- You can use a sub-list to tell conform to run *until* a formatter
        -- is found.
        -- javascript = { { "prettierd", "prettier" } },
      },
    },
  },
}