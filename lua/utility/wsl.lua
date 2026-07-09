---@class utility.wsl
local M = setmetatable({}, {
  __call = function(m, ...)
    return m.wsl(...)
  end,
})

function M.is_wsl()
  local wsl_distro = vim.fn.getenv 'WSL_DISTRO_NAME'
  return wsl_distro ~= vim.NIL
end

return M
