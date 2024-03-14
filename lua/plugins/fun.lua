return {
  {
    "tamton-aquib/duck.nvim",
    config = function()
      vim.api.nvim_create_user_command("Duck", function()
        require("duck").hatch()
      end, {})
      vim.api.nvim_create_user_command("DuckCook", function()
        require("duck").cook()
      end, {})
      vim.api.nvim_create_user_command("DuckCookAll", function()
        require("duck").cook_all()
      end, {})
    end,
  },
  {
    "NStefan002/2048.nvim",
    cmd = "Play2048",
    config = true,
  },
  {
    "eandrju/cellular-automaton.nvim",
  },
}
