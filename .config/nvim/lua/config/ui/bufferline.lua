pcall(vim.cmd.packadd, "nvim-web-devicons")
pcall(vim.cmd.packadd, "bufferline.nvim")

local ok, bufferline = pcall(require, "bufferline")
if not ok then return end

bufferline.setup({
  options = {
    mode = "buffers",
    numbers = "ordinal",
    diagnostics = "nvim_lsp",
    show_buffer_close_icons = false,
    show_close_icon = false,
  },
})
