---@class lazyvim.util.terminal
---@overload fun(message: string|string[], level: string, opts: LazyTermOpts): LazyFloat
local M = setmetatable({}, {
  __call = function(m, ...)
    return m.notify(...)
  end,
})

function M.notify(message, ...)
  local args = { ... }
  if #args == 1 then
    if type(args[1]) == 'table' then
      require 'notify'(message, 'info', ...)
    else
      require 'notify'(message, args[1], {})
    end
  elseif #args == 2 then
    require 'notify'(message, ...)
  else
    require 'notify'(message, 'info', {})
  end
end

function M.info(message, opts)
  M.notify(message, opts)
end

function M.warn(message, opts)
  M.notify(message, 'warn', opts)
end

function M.error(message, opts)
  M.notify(message, 'error', opts)
end

function M.debug(message, opts)
  M.notify(message, 'debug', opts)
end

return M
