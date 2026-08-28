local dap_ok, dap = pcall(require, "dap")
if not dap_ok then return end

dap.configurations.cpp = {
  {
    name = "Launch binary (CodeLLDB)",
    type = "codelldb",
    request = "launch",
    program = function()
      return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
    end,
    cwd = "${workspaceFolder}",
    stopOnEntry = false,
    args = {},
  },
  {
    name = "Attach to process (CodeLLDB)",
    type = "codelldb",
    request = "attach",
    pid = require("dap.utils").pick_process,
    cwd = "${workspaceFolder}",
  },
}

dap.configurations.c = dap.configurations.cpp
dap.configurations.rust = dap.configurations.cpp
