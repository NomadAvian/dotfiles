pcall(vim.cmd.packadd, "conform.nvim")

local ok, conform = pcall(require, "conform")
if not ok then
	return
end

conform.setup({
	formatters_by_ft = {
		lua = { "stylua" },
		python = { "isort", "black" },
		cpp = { "clang-format" },
		c = { "clang-format" },
	},
	--[[
  format_on_save = {
    timeout_ms = 500,
    lsp_fallback = true,
  },
  --]]
})
