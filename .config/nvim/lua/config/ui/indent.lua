pcall(vim.cmd.packadd, "indent-blankline.nvim")

local ok, ibl = pcall(require, "ibl")
if not ok then return end

ibl.setup({
  indent = {
    char = "┊", -- Options: "│", "┆", "┊", "┊"
  },
  scope = {
    enabled = true,
    show_start = false,
    show_end = false,
    highlight = { "Function", "Label" }, -- Highlights active indentation block
  },
  exclude = {
    filetypes = {
      "help",
      "dashboard",
      "nvim-tree",
      "Trouble",
      "lazy",
      "terminal",
    },
  },
})