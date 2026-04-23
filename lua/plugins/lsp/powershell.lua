return {
  {
    'TheLeoP/powershell.nvim',
    ft = 'ps1',
    ---@type powershell.user_config
    opts = {
      bundle_path = vim.fn.stdpath 'data' .. '/mason/packages/powershell-editor-services/PowerShellEditorServices',
    },
  },
}
