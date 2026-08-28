pcall(vim.cmd.packadd, "plenary.nvim")
pcall(vim.cmd.packadd, "telescope.nvim")
pcall(vim.cmd.packadd, "oil.nvim")
pcall(vim.cmd.packadd, "which-key.nvim")

local oil_ok, oil = pcall(require, "oil")
if oil_ok then
  oil.setup({ default_file_explorer = true })
  vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open Parent Directory" })
end

local telescope_ok, builtin = pcall(require, "telescope.builtin")
if telescope_ok then
  vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Find Files" })
  vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Live Grep" })
  vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Find Buffers" })
end

local wk_ok, wk = pcall(require, "which-key")
if wk_ok then
  wk.setup({})
end