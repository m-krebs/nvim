return {
  {
    "tpope/vim-dadbod",
    dependencies = {
      "kristijanhusak/vim-dadbod-ui",
      "kristijanhusak/vim-dadbod-completion",
    },
    lazy = false,
    cmd = { "DBUIToggle", "DBUI", "DBUIAddConnection", "DBUIFindBuffer", "DBUIRenameBuffer", "DBUILastQueryInfo" },
    keys = {
      { "<leader>Du", "<Cmd>DBUIToggle<CR>", desc = "Toggle UI" },
      { "<leader>Df", "<Cmd>DBUIFindBuffer<CR>", desc = "Find Buffer" },
      { "<leader>Dr", "<Cmd>DBUIRenameBuffer<CR>", desc = "Rename Buffer" },
      { "<leader>Dq", "<Cmd>DBUILastQueryInfo<CR>", desc = "Last query info" },
    },
  },
}
