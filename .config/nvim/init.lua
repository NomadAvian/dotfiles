-- Set leaders first
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Core configuration
require("config.core.options")
require("config.core.plugins")
require("config.core.keymaps")
require("config.core.autocmds")
require("config.tools.terminal")

-- Language tooling
require("config.lang.lsp")
require("config.lang.cmp")
require("config.lang.treesitter")
require("config.lang.conform")
require("config.lang.lint")
require("config.lang.markdown")

-- Tools
require("config.tools.gitsigns")
require("config.tools.dap")
require("config.tools.navigation")

-- UI
require("config.ui.indent")
require("config.ui.dashboard")
require("config.ui.lualine")
require("config.ui.bufferline")

-- QoL
require("config.tools.todo")

-- Colorschemes
require("config.ui.colorscheme")
