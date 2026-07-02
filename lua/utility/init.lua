---@class utility
---@field notify utility.notify
---@field terminal utility.terminal
---@field telescope utility.telescope
---@field wsl utility.wsl
local M = {}

setmetatable(M, {
  __index = function(t, k)
    t[k] = require('utility.' .. k)
    return t[k]
  end,
})

return M
