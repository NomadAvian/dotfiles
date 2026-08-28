local mason_ok = pcall(require, "mason")
local mason_dap_ok, mason_dap = pcall(require, "mason-nvim-dap")
if not (mason_ok and mason_dap_ok) then return end

require("mason").setup()

-- Auto-install codelldb and register it as a DAP adapter
mason_dap.setup({
  ensure_installed = { "codelldb" },
  automatic_installation = true,
  handlers = {
    function(config)
      -- Standard handler for all adapters
      mason_dap.default_setup(config)
    end,
    codelldb = function(config)
      -- Custom adapter setup for CodeLLDB
      config.adapters = {
        type = "server",
        port = "${port}",
        executable = {
          command = "codelldb", -- Mason puts codelldb on PATH
          args = { "--port", "${port}" },
        },
      }
      -- Configs are defined in cpp_debug.lua; skip mason's built-ins
      config.configurations = {}
      mason_dap.default_setup(config)
    end,
  },
})
