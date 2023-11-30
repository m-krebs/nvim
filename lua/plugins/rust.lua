return {
  {
    "mrcjkb/rustaceanvim",
    version = "^3",
    ft = { "rust" },
  },
  {
    "saecki/crates.nvim",
    tag = "stable",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("crates").setup()
    end,
  },
}
