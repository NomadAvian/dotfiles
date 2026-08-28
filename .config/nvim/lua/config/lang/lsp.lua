pcall(vim.cmd.packadd, "nvim-lspconfig")

local capabilities = {}
local cmp_ok, cmp_lsp = pcall(require, "cmp_nvim_lsp")
if cmp_ok then
  capabilities = cmp_lsp.default_capabilities()
end

vim.diagnostic.config({
  virtual_text = { prefix = "●" },
  signs = true,
  underline = true,
  update_in_insert = false,
  severity_sort = true,
})

-- 1. C/C++
vim.lsp.config.clangd = {
  cmd = {
    "clangd",
    "--background-index",
    "--clang-tidy",
    "--header-insertion=iwyu",
    "--completion-style=detailed",
    "--fallback-style=llvm",
  },
  capabilities = capabilities,
}
vim.lsp.enable("clangd")

-- 2. Python
vim.lsp.config.pyright = {
  capabilities = capabilities,
}
vim.lsp.enable("pyright")

-- 3. Lua
vim.lsp.config.lua_ls = {
  capabilities = capabilities,
  settings = {
    Lua = {
      diagnostics = { globals = { "vim" } },
      workspace = { checkThirdParty = false },
    },
  },
}
vim.lsp.enable("lua_ls")

-- LSP Keymaps on Attach
vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("UserLspConfig", {}),
  callback = function(ev)
    local opts = { buffer = ev.buf }
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
    vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
    vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
    vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)
    vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
  end,
})