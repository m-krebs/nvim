vim.pack.add { gh 'stevearc/conform.nvim' }
require('conform').setup {
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
    -- use list to run sequentially
    sh = { 'shfmt' },
    lua = { 'stylua' },
    json = { 'biome' },
    javascript = { 'prettier' },
    typescript = { 'prettier' },
    html = { 'prettier' },
    http = { 'kulala' },
    rest = { 'kulala' },
    svelte = { 'prettier' },
    python = { 'black' },
    dockerfile = { 'dockerfmt' },
  },
}
vim.keymap.set('n', '<leader>uF', function()
  vim.g.disable_autoformat = not vim.g.disable_autoformat
  Utils.notify.info((vim.g.disable_autoformat and 'Dis' or 'En') .. 'abled autoformat (global)', { title = 'Option' })
end, { desc = 'Toggle Auto [F]ormat (Global)' })

vim.keymap.set('n', '<leader>uf', function()
  vim.b.disable_autoformat = not vim.b.disable_autoformat
  Utils.notify.info((vim.b.disable_autoformat and 'Dis' or 'En') .. 'abled autoformat (buffer)', { title = 'Option' })
end, { desc = 'Toggle Auto [F]ormat (Buffer)' })
