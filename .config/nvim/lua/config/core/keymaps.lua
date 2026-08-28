-- Buffer Navigation with H, L
vim.keymap.set("n", "H", "<cmd>bprevious<cr>", { desc = "Go to previous buffer" })
vim.keymap.set("n", "L", "<cmd>bnext<cr>", { desc = "Go to next buffer" })
vim.keymap.set("n", "<leader>bl", "<cmd>ls<cr>", { desc = "List open buffers" })

-- <leader>1,2,3,...
local function get_listed_buffers()
  return vim.tbl_filter(function(bufnr)
    return vim.api.nvim_buf_is_valid(bufnr) and vim.bo[bufnr].buflisted
  end, vim.api.nvim_list_bufs())
end

for i = 1, 9 do
  vim.keymap.set("n", "<leader>" .. i, function()
    local buffers = get_listed_buffers()
    if buffers[i] then
      vim.api.nvim_set_current_buf(buffers[i])
    else
      print("No buffer at position " .. i)
    end
  end, { desc = "Go to buffer position " .. i })
end
--

-- Window Navigation with Ctrl + h/j/k/l
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Focus left panel" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Focus lower panel" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Focus upper panel" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Focus right panel" })

-- Easy Resizing with Alt + h/j/k/l
vim.keymap.set("n", "<A-h>", "<cmd>vertical resize -2<cr>", { desc = "Decrease panel width" })
vim.keymap.set("n", "<A-l>", "<cmd>vertical resize +2<cr>", { desc = "Increase panel width" })
vim.keymap.set("n", "<A-j>", "<cmd>resize -2<cr>", { desc = "Decrease panel height" })
vim.keymap.set("n", "<A-k>", "<cmd>resize +2<cr>", { desc = "Increase panel height" })

-- Cleaner Split Shortcuts
vim.keymap.set("n", "<leader>sv", "<cmd>vsplit<cr>", { desc = "Split panel vertically" })
vim.keymap.set("n", "<leader>sh", "<cmd>split<cr>", { desc = "Split panel horizontally" })
vim.keymap.set("n", "<leader>se", "<C-w>=", { desc = "Equalize panel sizes" })
vim.keymap.set("n", "<leader>sx", "<cmd>close<cr>", { desc = "Close current panel" })
