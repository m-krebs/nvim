local colorscheme = 'ayu'

local is_ok, _ = pcall(vim.cmd, 'colorscheme ' .. colorscheme)
if not is_ok then
  vim.notify('colorscheme ' .. colorscheme .. ' not found!', vim.log.levels.ERROR)
end
