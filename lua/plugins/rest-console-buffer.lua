return {
  {
    "m-krebs/rest-console-buffer.nvim",
    lazy = false,
    config = true,
    keys = {
      {
        "<leader>mr",
        "<cmd>RESTBuffer<CR>",
        { desc = "Create REST console buffer" },
      },
    },
  },
}
