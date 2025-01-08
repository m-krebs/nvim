return {
  {
    'saghen/blink.cmp',
    dependencies = 'rafamadriz/friendly-snippets',
    lazy = false,
    version = 'v0.*',
    opts = {
      keymap = {
        preset = 'enter',
        cmdline = {},
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
          auto_show = function(ctx)
            return ctx.mode ~= 'cmdline'
          end,
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
        list = {
          selection = {
            preselect = true,
          },
        },
      },
      signature = {
        enabled = true,
      },
    },
  },
}
