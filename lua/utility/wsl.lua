---@class utility.wsl
local M = setmetatable({}, {
  __call = function(m, ...)
    return m.wsl(...)
  end,
})

function M.is_wsl()
  local wsl_distro = vim.fn.getenv('WSL_DISTRO_NAME')
  if (wsl_distro ~= '') then
    return true
  else
    return false
  end
end

return M
