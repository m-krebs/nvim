return {
  "mfussenegger/nvim-dap",
  opts = function()
    local dap = require("dap")
    dap.adapters.node2 = {
      type = "server",
    }
    for _, language in ipairs({ "typescript", "javascript" }) do
      if not dap.configurations[language] then
        dap.configurations[language] = {
          {
            type = "node2",
            name = "My Custom Config",
          },
        }
      end
    end
    dap.configurations.java = {
      {
        type = "java",
        request = "attach",
        name = "Debug (Attach) - Remote",
        hostName = "127.0.0.1",
        port = 5006,
      },
    }
  end,
}
