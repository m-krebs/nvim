return {
  {
    "FabianWirth/search.nvim",
    dependencies = { "nvim-telescope/telescope.nvim" },
    keys = {
      {
        "<Space><Space>",
        function()
          require("search").open()
        end,
      },
    },
  },
}
