---@param repo string
---@return string
function _G.gh(repo)
  return 'https://github.com/' .. repo
end

vim.pack.add { gh 'scottmckendry/cyberdream.nvim' }

require 'plugins'
