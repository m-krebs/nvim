return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        arduino_language_server = { --  https://github.com/williamboman/nvim-lsp-installer/tree/main/lua/nvim-lsp-installer/servers/arduino_language_server | https://discord.com/channels/939594913560031363/1078005571451621546/threads/1122910773270818887
          on_new_config = function(config, root_dir)
            config.capabilities.textDocument.semanticTokens = vim.NIL
            config.capabilities.workspace.semanticTokens = vim.NIL
            -- config.cmd = {         --  https://forum.arduino.cc/t/solved-errors-with-clangd-startup-for-arduino-language-server-in-nvim/1019977
            --   "arduino-language-server",
            --   "-cli-config" , "~/arduino15/arduino-cli.yaml", -- just in case it was /home/xou/.arduino15/arduino-cli.yaml
            --   "-cli"        , "/usr/bin/arduino-cli", -- 2023-06-26 ERROR | "Runs" if I set a wrong path
            --   "-clangd", fqbn
            -- end
          end,
        },
      },
    },
  },
}
