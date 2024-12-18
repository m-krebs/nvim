return {
  {
    'saghen/blink.cmp',
    dependencies = 'rafamadriz/friendly-snippets',
    lazy = false,
    version = 'v0.*',
    opts = {
      keymap = { preset = 'enter' },
      sources = {
        default = { 'lsp', 'path', 'snippets', 'buffer' },
      },
      appearance = {
        use_nvim_cmp_as_default = true,
        nerd_font_variant = 'mono',
      },
      completion = {
        menu = {
          draw = {
            columns = { { 'label', 'label_description', gap = 1 }, { 'kind_icon', 'kind' } },
          },
        },
      },
      signature = {
        enabled = true,
      },
    },
  },
}
