local function vim_cmd_vcount(opts)
  if opts == nil then
    vim.cmd(vim.v.count .. 'ToggleTerm')
  else
    vim.cmd(vim.v.count .. opts)
  end
end

vim.pack.add { gh 'akinsho/toggleterm.nvim' }

require('toggleterm').setup {
  direction = 'float',
  size = function(term)
    if term.direction == 'horizontal' then
      return 15
    elseif term.direction == 'vertical' then
      return vim.o.columns * 0.3
    end
  end,
}

vim.keymap.set({ 'n', 't' }, '<c-_>', vim_cmd_vcount, { desc = 'ToggleTerm' })

-- duplicate from above,
vim.keymap.set({ 'n', 't' }, '<c-/>', vim_cmd_vcount, { desc = 'ToggleTerm' })

vim.keymap.set('n', '<leader>tv', function()
  vim_cmd_vcount 'ToggleTerm direction=vertical'
end, { desc = 'ToggleTerm [v]ertical' })

vim.keymap.set('n', '<leader>th', function()
  vim_cmd_vcount 'ToggleTerm direction=horizontal size=20'
end, { desc = 'ToggleTerm [h]orizontal' })

vim.keymap.set('n', '<leader>tf', function()
  vim_cmd_vcount 'ToggleTerm direction=float'
end, { desc = 'ToggleTerm [f]loat' })

vim.keymap.set('n', '<leader>gg', function()
  Snacks.lazygit()
end, { desc = 'Lazygit' })
