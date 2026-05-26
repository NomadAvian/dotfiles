return {
  'akinsho/bufferline.nvim',
  version = "*",
  dependencies = 'nvim-tree/nvim-web-devicons',
  config = function()
    require("bufferline").setup({
      options = {
        numbers = "ordinal", -- This shows the 1, 2, 3... on the tabs
        diagnostics = "nvim_lsp",
      }
    })
  end
}
