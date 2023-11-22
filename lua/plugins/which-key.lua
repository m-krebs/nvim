return {
  {
    "folke/which-key.nvim",
    optional = true,
    opts = {
      plugins = { spelling = true },
      defaults = {
        mode = { "n", "v" },
        ["<leader>m"] = { name = "+tools" },
        ["<leader>mr"] = { name = "+rest-console" },
        ["<leader>md"] = { name = "+db" },
      },
    },
  },
}
