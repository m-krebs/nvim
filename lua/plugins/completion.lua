vim.pack.add {
  gh 'rafamadriz/friendly-snippets',
  gh 'saghen/blink.lib',
  -- { src = gh 'saghen/blink.cmp', version = vim.version.range 'v1*' },
  { src = gh 'saghen/blink.cmp' },
  -- 'copilotlsp-nvim/copilot-lsp',
  -- 'zbirenbaum/copilot.lua',
}

local cmp = require 'blink.cmp'
cmp.build():pwait()

cmp.setup {
  cmdline = {
    keymap = {
      ['<Tab>'] = { 'show', 'accept' },
    },
    enabled = true,
    completion = {
      menu = {
        auto_show = true,
      },
    },
  },
  keymap = {
    preset = 'enter',
  },
  sources = {
    default = { 'lsp', 'path', 'snippets', 'buffer' }, -- 'lazydev'
    providers = {
      -- lazydev = {
      --   name = 'LazyDev',
      --   module = 'lazydev.integrations.blink',
      --   -- make lazydev completions top priority (see `:h blink.cmp`)
      --   score_offset = 100,
      -- },
    },
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
}
