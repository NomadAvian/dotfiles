local opt = vim.opt

-- Line numbers
opt.number = true
opt.relativenumber = true

-- Indentation defaults (Overridden by LSP/Treesitter per filetype)
opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.smartindent = true

-- Search & Splitting
opt.ignorecase = true
opt.smartcase = true
opt.splitbelow = true
opt.splitright = true

-- UI & Performance
opt.termguicolors = true
opt.signcolumn = "yes"
opt.cursorline = true
opt.scrolloff = 8
opt.updatetime = 250
opt.undofile = true -- Persistent undo built-in

-- Share clipboard
vim.opt.clipboard = "unnamedplus"

-- Complete options
opt.completeopt = { "menu", "menuone", "noselect" }
