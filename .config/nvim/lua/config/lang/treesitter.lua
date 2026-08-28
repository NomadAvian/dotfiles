pcall(vim.cmd.packadd, "nvim-treesitter")

-- 1. nvim-treesitter config
local ok, ts_config = pcall(require, "nvim-treesitter.configs")
if ok then
  ts_config.setup({
    ensure_installed = { "c", "cpp", "lua", "python", "bash" },
    highlight = {
      enable = true,
      additional_vim_regex_highlighting = false,
    },
  })
end

-- 2. Fallback autocmd to guarantee Treesitter attaches to filetypes
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "c", "cpp", "python", "lua", "bash" },
  callback = function(args)
    pcall(vim.treesitter.start, args.buf)
  end,
})