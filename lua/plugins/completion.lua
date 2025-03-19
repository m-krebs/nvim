return {
  {
    'saghen/blink.cmp',
    dependencies = 'rafamadriz/friendly-snippets',
    -- event = 'InsertEnter',
    version = 'v0.*',
    opts = {
      cmdline = {
        keymap = {},
        enabled = true,
        sources = function()
          if vim.fn.getcmdtype() == ':' then
            return { 'cmdline' }
          end
          return {}
        end,
        completion = {
          menu = {
            auto_show = function(ctx)
              return ctx.mode ~= 'cmdline'
            end,
          },
          ghost_text = { enabled = true },
        },
      },
      keymap = {
        preset = 'enter',
      },
      sources = {
        default = { 'lsp', 'path', 'snippets', 'buffer' },
      },
      appearance = {
        use_nvim_cmp_as_default = true,
        nerd_font_variant = 'mono',
      },
      completion = {
        accept = {
          auto_brackets = {
            enabled = true,
          },
        },
        menu = {
          border = 'single',
          draw = {
            columns = { { 'kind_icon', 'label', 'label_description', gap = 1 }, { 'kind' } },
            components = {
              kind_icon = {
                ellipsis = false,
                text = function(ctx)
                  local kind_icon, _, _ = require('mini.icons').get('lsp', ctx.kind)
                  return kind_icon
                end,
              },
            },
            treesitter = { 'lsp' },
          },
        },
      },
      signature = {
        enabled = true,
      },
    },
  },
}
