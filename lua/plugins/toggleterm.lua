local function vim_cmd_vcount(opts)
  if opts == nil then
    vim.cmd(vim.v.count .. 'ToggleTerm')
  else
    vim.cmd(vim.v.count .. opts)
  end
end

return {
  'akinsho/toggleterm.nvim',
  cmd = { 'ToggleTerm', 'TermExec', 'ToggleTermToggleAll' },
  opts = {
    direction = 'float',
    size = function(term)
      if term.direction == 'horizontal' then
        return 15
      elseif term.direction == 'vertical' then
        return vim.o.columns * 0.3
      end
    end,
  },
  keys = {
    {
      '<c-_>',
      vim_cmd_vcount,
      mode = { 'n', 't' },
      desc = 'ToggleTerm',
    },
    {
      -- duplicate from above,
      '<c-/>',
      vim_cmd_vcount,
      mode = { 'n', 't' },
      desc = 'ToggleTerm',
    },
    {
      '<leader>tv',
      function()
        vim_cmd_vcount 'ToggleTerm direction=vertical'
      end,
      mode = { 'n' },
      desc = 'ToggleTerm [v]ertical',
    },
    {
      '<leader>th',
      function()
        vim_cmd_vcount 'ToggleTerm direction=horizontal'
      end,
      '<cmd>ToggleTerm direction=horizontal size=20<cr>',
      mode = { 'n' },
      desc = 'ToggleTerm [h]orizontal',
    },
    {
      '<leader>tf',
      function()
        vim_cmd_vcount 'ToggleTerm direction=float'
      end,
      mode = { 'n' },
      desc = 'ToggleTerm [f]loat',
    },
  },
}
