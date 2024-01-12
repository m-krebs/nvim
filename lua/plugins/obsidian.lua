return {
  "epwalsh/obsidian.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  -- lazy = true,
  -- ft = "markdown",
  opts = {
    workspaces = {
      {
        name = "personal",
        path = "~/Documents/obsidian/diary/",
      },
    },
  },
}
