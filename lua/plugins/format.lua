return {
  -- Autoformat
  {
    'stevearc/conform.nvim',
    version = '*',
    event = { 'BufWritePre' },
    cmd = { 'ConformInfo' },
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
        javascript = { 'biome', 'prettier' },
        typescript = { 'biome', 'prettier' },
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
    keys = {
      {
        '<leader>uf',
        function()
          vim.g.disable_autoformat = not vim.g.disable_autoformat
          Utils.notify.info((vim.g.disable_autoformat and 'Dis' or 'En') .. 'abled autoformat (global)', { title = 'Option' })
        end,
        desc = 'Toggle Auto [F]ormat (Global)',
      },
      {
        '<leader>uF',
        function()
          vim.b.disable_autoformat = not vim.b.disable_autoformat
          Utils.notify.info((vim.b.disable_autoformat and 'Dis' or 'En') .. 'abled autoformat (buffer)', { title = 'Option' })
        end,
        desc = 'Toggle Auto [F]ormat (Buffer)',
      },
    },
  },
}
