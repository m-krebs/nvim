return {
  {
    "diepm/vim-rest-console",
    ft = "rest",
    keys = {
      {
        "<leader>mrq",
        "<cmd>call VrcQuery()<CR>",
        desc = "Run REST Query",
      },
    },
  },
  {
    "m-krebs/rest-console-buffer.nvim",
    lazy = false,
    config = true,
    keys = {
      {
        "<leader>mrn",
        "<cmd>RESTBuffer<CR>",
        desc = "new REST-C buffer",
      },
    },
  },
}
