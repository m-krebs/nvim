---@class utility.telescope
---@overload fun(builtin: string, opts: table)
local M = setmetatable({}, {
  __call = function(m, ...)
    return m.telescope(...)
  end,
})

function M.telescope(builtin, opts)
  require('telescope.builtin')[builtin](opts)
end

function M.config_files()
  return M.telescope('find_files', { cwd = vim.fn.stdpath 'config' })
end

return M
