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
      { "<leader>mdu", "<Cmd>DBUIToggle<CR>", desc = "Toggle UI" },
      { "<leader>mdf", "<Cmd>DBUIFindBuffer<CR>", desc = "Find Buffer" },
      { "<leader>mdr", "<Cmd>DBUIRenameBuffer<CR>", desc = "Rename Buffer" },
      { "<leader>mdq", "<Cmd>DBUILastQueryInfo<CR>", desc = "Last query info" },
    },
  },
}
