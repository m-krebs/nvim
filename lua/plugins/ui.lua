vim.pack.add {
  gh 'akinsho/bufferline.nvim',
  gh 'nvim-lualine/lualine.nvim',
  gh 'rcarriga/nvim-notify',
  gh 'folke/twilight.nvim',
  gh 'folke/which-key.nvim',
  gh 'folke/noice.nvim',
  gh 'lukas-reineke/indent-blankline.nvim',
  gh 'chentoast/marks.nvim',
  gh 'folke/todo-comments.nvim',
  gh 'rachartier/tiny-inline-diagnostic.nvim',
  gh 'rachartier/tiny-glimmer.nvim',
}

require('todo-comments').setup { signs = false }

vim.keymap.set('n', '<leader>st', '<cmd>TodoFzfLua<cr>', { desc = '[S]earch [T]odo' })

require('tiny-glimmer').setup {
  overwrite = {
    undo = {
      enabled = true,
    },
  },
}

require('lualine').setup {
  options = {
    globalstatus = true,
  },
  sections = {
    lualine_b = {
      {
        -- shows macro recording in statusline
        'macro',
        fmt = function()
          local reg = vim.fn.reg_recording()
          if reg ~= '' then
            return 'Recording @' .. reg
          end
          return nil
        end,
        color = { fg = '#ff9e64' },
        draw_empty = false,
      },
    },
  },
}

do
  require('bufferline').setup {
    options = {
        -- stylua: ignore
        close_command = function(n) require("mini.bufremove").delete(n, false) end,
        -- stylua: ignore
        right_mouse_command = function(n) require("mini.bufremove").delete(n, false) end,
      diagnostics = 'nvim_lsp',
      always_show_bufferline = true,
      -- diagnostics_indicator = function(_, _, diag)
      --   local icons = require('lazyvim.config').icons.diagnostics
      --   local ret = (diag.error and icons.Error .. diag.error .. ' ' or '') .. (diag.warning and icons.Warn .. diag.warning or '')
      --   return vim.trim(ret)
      -- end,
      offsets = {
        {
          filetype = 'neo-tree',
          text = 'Neo-tree',
          highlight = 'Directory',
          text_align = 'left',
        },
      },
    },
  }

  vim.api.nvim_create_autocmd('BufAdd', {
    callback = function()
      vim.schedule(function()
        pcall(nvim_bufferline)
      end)
    end,
  })

  vim.keymap.set('n', '<leader>bp', '<Cmd>BufferLineTogglePin<CR>', { desc = 'Toggle [p]in' })
  vim.keymap.set('n', '<leader>bP', '<Cmd>BufferLineGroupClose ungrouped<CR>', { desc = 'Delete non-[p]inned buffers' })
  vim.keymap.set('n', '<leader>bo', '<Cmd>BufferLineCloseOthers<CR>', { desc = 'Delete [o]ther buffers' })
  vim.keymap.set('n', '<leader>br', '<Cmd>BufferLineCloseRight<CR>', { desc = 'Delete buffers to the [r]ight' })
  vim.keymap.set('n', '<leader>bl', '<Cmd>BufferLineCloseLeft<CR>', { desc = 'Delete buffers to the [l]eft' })
  vim.keymap.set('n', '<S-h>', '<cmd>BufferLineCyclePrev<cr>', { desc = 'Prev buffer' })
  vim.keymap.set('n', '<S-l>', '<cmd>BufferLineCycleNext<cr>', { desc = 'Next buffer' })
  vim.keymap.set('n', '[b', '<cmd>BufferLineCyclePrev<cr>', { desc = 'Prev buffer' })
  vim.keymap.set('n', ']b', '<cmd>BufferLineCycleNext<cr>', { desc = 'Next buffer' })
end

require('notify').setup { render = 'compact', style = 'static', top_down = false }

vim.keymap.set('n', '<leader>ut', '<cmd>Twilight<cr>', { desc = 'Toggle [T]wilight' })

require('ibl').setup {
  indent = {
    char = '│',
    tab_char = '│',
  },
  scope = { enabled = false },
  exclude = {
    filetypes = {
      'help',
      'alpha',
      'dashboard',
      'neo-tree',
      'Trouble',
      'trouble',
      'lazy',
      'mason',
      'notify',
      'toggleterm',
      'lazyterm',
    },
  },
}
-- main = 'ibl',

require('noice').setup {
  cmdline = {
    view = 'cmdline',
  },
  presets = {
    bottom_search = true,
    command_palette = true,
    inc_rename = true,
    lsp_doc_border = true,
  },
  lsp = {
    override = {
      ['vim.lsp.util.convert_input_to_markdown_lines'] = true,
      ['vim.lsp.util.stylize_markdown'] = true,
    },
  },
}

local wk = require 'which-key'
wk.setup {
  icons = {
    rules = false,
  },
}
wk.add {
  { '<leader>b', group = '[B]uffer' },
  { '<leader>b_', hidden = true },
  { '<leader>c', group = '[C]ode' },
  { '<leader>c_', hidden = true },
  { '<leader>d', group = '[D]ocument' },
  { '<leader>d_', hidden = true },
  { '<leader>f', group = '[F]ile/find' },
  { '<leader>f_', hidden = true },
  { '<leader>g', group = '[G]it' },
  { '<leader>g_', hidden = true },
  { '<leader>q', group = '[Q]uit/session' },
  { '<leader>q_', hidden = true },
  { '<leader>r', group = '[R]est' },
  { '<leader>r_', hidden = true },
  { '<leader>s', group = '[S]earch' },
  { '<leader>s_', hidden = true },
  { '<leader>t', group = '[T]oggleTerminal' },
  { '<leader>t_', hidden = true },
  { '<leader>u', group = 'Options' },
  { '<leader>u_', hidden = true },
  { '<leader><tab>', group = 'Tabs' },
  { '<leader><tab>_', hidden = true },
  { '<leader>w', group = '[W]indow' },
  { '<leader>w_', hidden = true },
  { '<leader>x', group = 'Diagnostics' },
  { '<leader>x_', hidden = true },
}
