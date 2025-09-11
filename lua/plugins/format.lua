return {
  -- Autoformat
  {
    'stevearc/conform.nvim',
    version = '*',
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
        json = { 'prettier', 'biome' },
        javascript = { 'prettier', 'biome' },
        html = { 'prettier' },
        http = { 'kulala' },
        rest = { 'kulala' },
        svelte = { 'biome' },
        python = { 'black' },
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
