return {
  {
    "arakkkkk/kanban.nvim",
    lazy = false,
    dependencies = { "nvim-telescope/telescope.nvim" },
    opts = {
      config = function()
        require("kanban").setup({
          markdown = {
            description_folder = "./tasks/",
            list_head = "## ",
          },
        })
      end,
    },
    keys = {
      {
        "<leader>k",
        function()
          local file_path = vim.api.nvim_buf_get_name(0)
          local command = "KanbanOpen " .. file_path
          local success, err_msg = pcall(vim.cmd, command)
          if not success then
            print("Error: Not a valid kanban file")
          end
        end,
        desc = "Open file as Kanban",
      },
    },
  },
}
