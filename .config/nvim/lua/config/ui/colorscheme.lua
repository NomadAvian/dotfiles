pcall(vim.cmd.packadd, "nvim") -- catppuccin package

local ok, catppuccin = pcall(require, "catppuccin")
if not ok then
  vim.cmd.colorscheme("habamax")
  return
end

catppuccin.setup({
  flavour = "mocha", -- Default: mocha (latte, frappe, macchiato, mocha)
  transparent_background = true, -- Transparent background enabled
  term_colors = true,
  styles = {
    comments = { "italic" },
    conditionals = { "italic" },
  },
  integrations = {
    cmp = true,
    gitsigns = true,
    nvimtree = true,
    treesitter = true,
    telescope = { enabled = true },
    which_key = true,
    indent_blankline = { enabled = true },
    dashboard = true,
  },
})

vim.cmd.colorscheme("catppuccin")

-- Flavor Switcher Helper
local flavors = { "mocha", "macchiato", "frappe", "latte" }
local current_idx = 1

local function switch_flavor()
  current_idx = (current_idx % #flavors) + 1
  local next_flavor = flavors[current_idx]
  vim.cmd("Catppuccin " .. next_flavor)
  print("Catppuccin flavor set to: " .. next_flavor)
end

-- Keymap to cycle flavors: Space + t + c
vim.keymap.set("n", "<leader>tc", switch_flavor, { desc = "Cycle Catppuccin Flavors" })