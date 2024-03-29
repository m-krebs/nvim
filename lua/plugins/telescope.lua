return {
  {
    "nvim-telescope/telescope.nvim",
    keys = {
      {
        "<leader>fF",
        function()
          require("search").open({ tab_id = 1 })
        end,
        desc = "Find Files (cwd)",
      },
      {
        "<leader>fg",
        function()
          require("search").open({ tab_id = 2 })
        end,
        desc = "Find git Files",
      },
      {
        "<leader>sg",
        function()
          require("search").open({ tab_id = 3 })
        end,
        desc = "Grep (root dir)",
      },
      {
        "<leader>/",
        function()
          require("search").open({ tab_id = 3 })
        end,
        desc = "Grep (root dir)",
      },
    },
  },
}
