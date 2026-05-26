-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- select all shortcut
vim.keymap.set("n", "<C-a>", "ggVG", { remap = true })
vim.keymap.set("v", "<C-a>", "ggVG", { remap = true })

-- buffer selection
for i = 1, 9 do
	vim.keymap.set('n', '<leader>' .. i, function()
		require("bufferline").go_to(i, true)
	end, { desc = 'Go to buffer' .. i })
end
