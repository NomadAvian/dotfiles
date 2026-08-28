pcall(vim.cmd.packadd, "nvim-web-devicons")
pcall(vim.cmd.packadd, "lualine.nvim")

local ok, lualine = pcall(require, "lualine")
if not ok then return end

-- 1. Hide statusline by default
vim.opt.laststatus = 0

-- 2. Setup Lualine with Catppuccin theme
lualine.setup({
  options = {
    icons_enabled = true,
    component_separators = { left = "│", right = "│" },
    section_separators = { left = "", right = "" },
    disabled_filetypes = {
      statusline = { "dashboard", "alpha", "starter" },
    },
    globalstatus = true, -- Single unified statusline across split windows
  },
  sections = {
    lualine_a = { { "mode", separator = { left = "", right = "" }, right_padding = 2 } },
    lualine_b = { "branch", "diff", "diagnostics" },
    lualine_c = { { "filename", path = 1 } }, -- Shows relative path
    lualine_x = { "encoding", "filetype" },
    lualine_y = { "progress" },
    lualine_z = { { "location", separator = { left = "", right = "" }, left_padding = 2 } },
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = { "filename" },
    lualine_x = { "location" },
    lualine_y = {},
    lualine_z = {},
  },
})

-- 3. Toggle Shortcut (<leader>tl)
vim.keymap.set("n", "<leader>tl", function()
  if vim.opt.laststatus:get() == 0 then
    vim.opt.laststatus = 3 -- 3 = Global statusline enabled
    print("Statusline: Shown")
  else
    vim.opt.laststatus = 0 -- 0 = Hidden
    print("Statusline: Hidden")
  end
end, { desc = "Toggle Lualine Statusline" })
