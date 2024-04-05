local M = setmetatable({}, {
  __call = function(m, ...)
    return m.telescope(...)
  end,
})

function M.telescope(builtin, opts)
  require('telescope.builtin')[builtin](opts)
end

function M.config_files()
  return Utils.telescope('find_files', { cwd = vim.fn.stdpath 'config' })
end

return M
