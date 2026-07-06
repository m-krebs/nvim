vim.pack.add { gh 'rubiin/fortune.nvim' }
require('fortune').setup { content_type = 'mixed' }

vim.pack.add { gh 'nvimdev/dashboard-nvim' }
local hour = tonumber(vim.fn.strftime '%H')
local part_id = math.floor((hour + 4) / 8) + 1
local day_part = ({ 'night', 'morning', 'afternoon', 'evening' })[part_id]
local username = vim.loop.os_get_passwd()['username'] or 'USERNAME'

local header = ('Good %s { %s }'):format(day_part, username)

header = string.rep('\n', 8) .. "I'm using neovim (BTW)" .. '\n\n\n' .. header .. '\n\n\n'

local opts = {
  theme = 'doom',
  config = {
    header = vim.split(header, '\n'),
    center = {
      {
        action = 'ene | startinsert',
        desc = ' New File',
        icon = ' ',
        key = 'n',
      },
      {
              -- stylua: ignore
              action = function ()
                require('fzf-lua').files({ cwd = vim.fn.stdpath('config')})
              end,
        desc = ' Config',
        icon = ' ',
        key = 'c',
      },
      {
              -- stylua: ignore
              action = function() require("persistence").load() end,
        desc = ' Restore Session',
        icon = ' ',
        key = 's',
      },
      {
        action = 'Lazy',
        desc = ' Lazy',
        icon = '󰒲 ',
        key = 'l',
      },
      {
        action = 'qa',
        desc = ' Quit',
        icon = ' ',
        key = 'q',
      },
    },
    -- make footer one line (plugins startuptime)
    footer = function()
      local data = {}
      --   -- local stats = require('lazy').stats()
      --   local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
      --
      local fortune = require('fortune').get_fortune()
      --   data[1] = 'loaded ' .. stats.loaded .. '/' .. stats.count .. ' plugins in ' .. ms .. 'ms'
      -- local footer = vim.list_extend(data, { '' })
      --   footer = vim.list_extend(data, { '' })
      -- footer = vim.list_extend(data, fortune)
      return fortune
    end,
  },
}

for _, button in ipairs(opts.config.center) do
  button.desc = button.desc .. string.rep(' ', 20 - #button.desc)
  button.key_format = '  %s'
  button.key_hl = 'String'
end

-- close Lazy and re-open when the dashboard is ready
-- if vim.o.filetype == 'lazy' then
--   vim.cmd.close()
--   vim.api.nvim_create_autocmd('User', {
--     pattern = 'DashboardLoaded',
--     callback = function()
--       require('lazy').show()
--     end,
--   })
-- end

require('dashboard').setup(opts)
