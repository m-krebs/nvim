-- enables faster startup by caching compiled lua modules
vim.loader.enable()

-- NOTE: must happen before plugins are loaded, or wrong leader will be set
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Set to true if you have a Nerd Font installed
vim.g.have_nerd_font = true

-- [[ Load util functions ]]
_G.Utils = require 'utility'

---@param repo string
---@return string
function _G.gh(repo)
  return 'https://github.com/' .. repo
end

require 'core.options'
require 'core.colorscheme'
require 'core.keymaps'
require 'core.autocmds'

require 'plugins'

-- [[ Install `lazy.nvim` plugin manager ]]
-- handles plugins in lua/plugins/
-- require 'config.lazy_setup'

-- workaround for rust-analyzer server cancelled request
for _, method in ipairs { 'textDocument/diagnostic', 'workspace/diagnostic' } do
  local default_diagnostic_handler = vim.lsp.handlers[method]
  vim.lsp.handlers[method] = function(err, result, context, config)
    if err ~= nil and err.code == -32802 then
      return
    end
    return default_diagnostic_handler(err, result, context, config)
  end
end
