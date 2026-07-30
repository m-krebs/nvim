vim.pack.add { gh 'nvim-mini/mini.nvim' }

require('mini.surround').setup()
require('mini.icons').setup()
require('mini.ai').setup {
  n_lines = 500,
}
require('mini.pairs').setup {
  mappings = {
    ['`'] = { action = 'closeopen', pair = '``', neigh_pattern = '[^\\`].', register = { cr = false } },
  },
}
require('mini.bufremove').setup {}

vim.keymap.set('n', '<leader>up', function()
  vim.g.minipairs_disable = not vim.g.minipairs_disable
  if vim.g.minipairs_disable then
    Utils.notify.warn('Disabled auto pairs', { title = 'Option' })
  else
    Utils.notify.info('Enabled auto pairs', { title = 'Option' })
  end
end, { desc = 'Toggle Auto [P]airs' })

do -- configure mini.files
  local minifiles = require 'mini.files'
  minifiles.setup {
    windows = {
      preview = true,
      width_focus = 30,
      width_preview = 50,
    },
    options = {
      use_as_default_explorer = true, -- Whether to use for editing directories
    },
  }

  vim.keymap.set('n', '<leader>fm', function()
    minifiles.open(vim.api.nvim_buf_get_name(0), true)
  end, { desc = 'mini.files (relative)' })

  vim.keymap.set('n', '<leader>fM', function()
    minifiles.open(vim.loop.cwd(), true)
  end, { desc = 'mini.files (relative)' })

  local show_dotfiles = true
  local filter_show = function(fs_entry)
    return true
  end
  local filter_hide = function(fs_entry)
    return not vim.startswith(fs_entry.name, '.')
  end

  local toggle_dotfiles = function()
    show_dotfiles = not show_dotfiles
    local new_filter = show_dotfiles and filter_show or filter_hide
    require('mini.files').refresh { content = { filter = new_filter } }
  end

  vim.api.nvim_create_autocmd('User', {
    pattern = 'MiniFilesBufferCreate',
    callback = function(args)
      local buf_id = args.data.buf_id
      -- Tweak left-hand side of mapping to your liking
      vim.keymap.set('n', 'g.', toggle_dotfiles, { buffer = buf_id })
    end,
  })

  -- vim.api.nvim_create_autocmd('User', {
  --   pattern = 'MiniFilesActionRename',
  --   callback = function(event)
  --     require('lazyvim.util').lsp.on_rename(event.data.from, event.data.to)
  --   end,
  -- })
end

-- buffer remove
vim.keymap.set('n', '<leader>bd', function()
  local bd = require('mini.bufremove').delete
  if vim.bo.modified then
    local choice = vim.fn.confirm(('Save changes to %q?'):format(vim.fn.bufname()), '&Yes\n&No\n&Cancel')
    if choice == 1 then -- Yes
      vim.cmd.write()
      bd(0)
    elseif choice == 2 then -- No
      bd(0, true)
    end
  else
    bd(0)
  end
end, { desc = '[D]elete Buffer' })

      -- stylua: ignore
  vim.keymap.set( 'n', "<leader>bD", function() require("mini.bufremove").delete(0, true) end, { desc = "[D]elete Buffer (Force)" })
