return {
  {
    "kristijanhusak/vim-dadbod-ui",
    dependencies = {
      { "tpope/vim-dadbod", lazy = true },
      { "kristijanhusak/vim-dadbod-completion", lazy = true, ft = { "sql", "mysql", "plsql" } },
    },
    lazy = true,
    cmd = { "DBUIToggle", "DBUI", "DBUIAddConnection", "DBUIFindBuffer", "DBUIRenameBuffer", "DBUILastQueryInfo" },
    keys = {
      { "<leader>tdu", "<Cmd>DBUIToggle<CR>", desc = "Toggle UI" },
      { "<leader>tdf", "<Cmd>DBUIFindBuffer<CR>", desc = "Find Buffer" },
      { "<leader>tdr", "<Cmd>DBUIRenameBuffer<CR>", desc = "Rename Buffer" },
      { "<leader>tdq", "<Cmd>DBUILastQueryInfo<CR>", desc = "Last query info" },
    },
  },
}
