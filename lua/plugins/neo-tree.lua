return {
  "nvim-neo-tree/neo-tree.nvim",
  opts = {
    window = {
      mappings = {
        ["G"] = function(state)
          local node = state.tree:get_node()
          if node.type == "directory" then
            vim.api.nvim_command('Telescope live_grep search_dirs={"' .. node:get_id() .. '"}')
          end
        end,
      },
    },
  },
}
