local colorscheme = 'ayu-mirage'

local is_ok, _ = pcall(vim.cmd, 'colorscheme ' .. colorscheme)
if not is_ok then
  print('colorscheme ' .. colorscheme .. ' not found!')
end
