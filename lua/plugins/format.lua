return {
  -- Autoformat
  {
    'stevearc/conform.nvim',
    version = '*',
    opts = {
      notify_on_error = false,
      format_on_save = function(bufnr)
        if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
          return
        end
        return { timeout_ms = 800, lsp_format = 'fallback' }
      end,
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
        json = { 'biome' },
        javascript = { 'biome' },
        typescript = { 'biome' },
        html = { 'prettier' },
        http = { 'kulala' },
        rest = { 'kulala' },
        svelte = { 'biome', 'prettier' },
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
