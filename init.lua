-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
vim.g.mapleader = ' '
vim.g.maplocalleader = '\\'

vim.g.have_nerd_font = true -- Set to true if you have a Nerd Font installed

-- [[ Setting options ]]
require 'config.options'

-- [[ Basic Keymaps ]]
require 'config.keymaps'

-- [[ Basic Autocommands ]]
require 'config.autocmds'

-- [[ Load util functions ]]
_G.Utils = require 'utility'

-- [[ Install `lazy.nvim` plugin manager ]]
-- handles plugins in lua/plugins/
require 'config.lazy_setup'

require 'config.colorscheme'

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
