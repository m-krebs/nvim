return {
  {
    "folke/which-key.nvim",
    optional = true,
    opts = {
      plugins = { spelling = true },
      defaults = {
        mode = { "n", "v" },
        ["<leader>t"] = { name = "+tools" },
        ["<leader>td"] = { name = "+db" },
      },
    },
  },
}
