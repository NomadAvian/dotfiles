pcall(vim.cmd.packadd, "nvim-lint")

local ok, lint = pcall(require, "lint")
if not ok then return end

lint.linters_by_ft = {
  -- python = { "flake8" },
  -- cpp = { "cpplint" },
}

vim.api.nvim_create_autocmd({ "BufWritePost" }, {
  callback = function()
    lint.try_lint()
  end,
})
