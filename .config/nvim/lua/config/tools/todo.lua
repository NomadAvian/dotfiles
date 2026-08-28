pcall(vim.cmd.packadd, "todo-comments.nvim")
local ok, todo = pcall(require, "todo-comments")
if ok then
  todo.setup()
  -- Search all TODOs across your project with Telescope:
  vim.keymap.set("n", "<leader>ft", "<cmd>TodoTelescope<cr>", { desc = "Find TODOs" })
end