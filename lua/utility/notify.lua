---@class utility.notify
---@overload fun(message: string|string[], level: string, opts: table): fun()
local M = setmetatable({}, {
  __call = function(m, ...)
    return m.notify(...)
  end,
})

---@private
---@param message string|string[]
---@param ... any
function M.notify(message, ...)
  local args = { ... }
  if #args == 1 then
    if type(args[1]) == 'table' then
      vim.notify(message, 'info', ...)
    else
      vim.notify(message, args[1], {})
    end
  elseif #args == 2 then
    vim.notify(message, ...)
  else
    vim.notify(message, 'info', {})
  end
end

---@param message string|string[]
---@param opts table
function M.info(message, opts)
  M.notify(message, opts)
end

---@param message string|string[]
---@param opts table
function M.warn(message, opts)
  M.notify(message, 'warn', opts)
end

---@param message string|string[]
---@param opts table
function M.error(message, opts)
  M.notify(message, 'error', opts)
end

---@param message string|string[]
---@param opts table
function M.debug(message, opts)
  M.notify(message, 'debug', opts)
end

return M
