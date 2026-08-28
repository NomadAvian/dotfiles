pcall(vim.cmd.packadd, "nvim-dap")
pcall(vim.cmd.packadd, "nvim-dap-ui")
pcall(vim.cmd.packadd, "nvim-dap-virtual-text")
pcall(vim.cmd.packadd, "mason.nvim")
pcall(vim.cmd.packadd, "mason-nvim-dap.nvim")

local dap_ok, dap = pcall(require, "dap")
local dapui_ok, dapui = pcall(require, "dapui")
local vtext_ok, vtext = pcall(require, "nvim-dap-virtual-text")

if not dap_ok then return end

-- Mason: auto-install debug adapters (codelldb)
require("config.tools.dap.mason")

-- DAP UI
if dapui_ok then
  if vtext_ok then vtext.setup() end
  dapui.setup()

  -- Automatically open/close DAP UI when debugging starts/ends
  dap.listeners.after.event_initialized["dapui_config"] = function()
    dapui.open()
  end
  dap.listeners.before.event_terminated["dapui_config"] = function()
    dapui.close()
  end
  dap.listeners.before.event_exited["dapui_config"] = function()
    dapui.close()
  end
end

-- C/C++/Rust launch configurations
require("config.tools.dap.cpp_debug")

-- Essential Keymaps
local map = vim.keymap.set
map("n", "<F5>", dap.continue, { desc = "DAP: Continue / Start" })
map("n", "<F10>", dap.step_over, { desc = "DAP: Step Over" })
map("n", "<F11>", dap.step_into, { desc = "DAP: Step Into" })
map("n", "<F12>", dap.step_out, { desc = "DAP: Step Out" })
map("n", "<leader>b", dap.toggle_breakpoint, { desc = "DAP: Toggle Breakpoint" })
map("n", "<leader>B", function()
  dap.set_breakpoint(vim.fn.input("Breakpoint condition: "))
end, { desc = "DAP: Conditional Breakpoint" })
map("n", "<leader>dq", dap.terminate, { desc = "DAP: Terminate Session" })
map("n", "<leader>du", function()
  if dapui_ok then dapui.toggle() end
end, { desc = "DAP: Toggle UI" })
map("n", "<leader>de", function()
  if dapui_ok then dapui.eval() end
end, { desc = "DAP: Evaluate Variable" })
