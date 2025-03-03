return {
  {
    'echasnovski/mini.files',
    version = '*',
    opts = {
      windows = {
        preview = true,
        width_focus = 30,
        width_preview = 50,
      },
      options = {
        use_as_default_explorer = true, -- Whether to use for editing directories
      },
    },
    keys = {
      {
        '<leader>fm',
        function()
          require('mini.files').open(vim.api.nvim_buf_get_name(0), true)
        end,
        desc = 'mini.files (relative)',
      },
      {
        '<leader>fM',
        function()
          require('mini.files').open(vim.loop.cwd(), true)
        end,
        desc = 'mini.files (root)',
      },
    },
    config = function(_, opts)
      require('mini.files').setup(opts)

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
    end,
  },
  -- buffer remove
  {
    'echasnovski/mini.bufremove',
    version = '*',
    keys = {
      {
        '<leader>bd',
        function()
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
        end,
        desc = '[D]elete Buffer',
      },
      -- stylua: ignore
      { "<leader>bD", function() require("mini.bufremove").delete(0, true) end, desc = "[D]elete Buffer (Force)" },
    },
  },
}
