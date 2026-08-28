pcall(vim.cmd.packadd, "dashboard-nvim")

local ok, dashboard = pcall(require, "dashboard")
if not ok then return end

dashboard.setup({
  theme = "hyper",
  config = {
    header = {
      " ██████   █████ ██████████    ███████    █████   █████ █████ ██████   ██████",
      "░░██████ ░░███ ░░███░░░░░█  ███░░░░░███ ░░███   ░░███ ░░███ ░░██████ ██████ ",
      " ░███░███ ░███  ░███  █ ░  ███     ░░███ ░███    ░███  ░███  ░███░█████░███ ",
      " ░███░░███░███  ░██████   ░███      ░███ ░███    ░███  ░███  ░███░░███ ░███ ",
      " ░███ ░░██████  ░███░░█   ░███      ░███ ░░███   ███   ░███  ░███ ░░░  ░███ ",
      " ░███  ░░█████  ░███ ░   █░░███     ███   ░░░█████░    ░███  ░███      ░███ ",
      " █████  ░░█████ ██████████ ░░░███████░      ░░███      █████ █████     █████",
      "░░░░░    ░░░░░ ░░░░░░░░░░    ░░░░░░░         ░░░      ░░░░░ ░░░░░     ░░░░░ ",
      "",
      "",
      "",
    },
    shortcut = {
      -- update all
      { desc = "󰊤 Update",
        group = "@property",
        action = "lua vim.pack.update()",
        key = "u"
      },
      -- find file
      {
        icon = " ",
        icon_hl = "@variable",
        desc = "Files",
        group = "Label",
        action = "Telescope find_files",
        key = "f",
      },
    },
    project = { enable = true, limit = 8, action = "Telescope find_files cwd=" },
    mru = { limit = 5, label = " Recent Files" },
    -- footer = { "", " Neovim 0.12 Loaded" },
    footer = { "", "Sphinx of Black Quartz, Judge My Vow" },
  },
})
