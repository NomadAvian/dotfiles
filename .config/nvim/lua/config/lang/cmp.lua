pcall(vim.cmd.packadd, "nvim-cmp")
pcall(vim.cmd.packadd, "cmp-nvim-lsp")
pcall(vim.cmd.packadd, "cmp-buffer")
pcall(vim.cmd.packadd, "cmp-path")

local ok, cmp = pcall(require, "cmp")
if not ok then return end

cmp.setup({
  snippet = {
    expand = function(args)
      vim.snippet.expand(args.body) -- Native 0.12 snippet engine
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ["<C-b>"] = cmp.mapping.scroll_docs(-4),
    ["<C-f>"] = cmp.mapping.scroll_docs(4),
    ["<C-Space>"] = cmp.mapping.complete(),
    ["<C-e>"] = cmp.mapping.abort(),
    ["<CR>"] = cmp.mapping.confirm({ select = true }),
    ["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif vim.snippet.active({ direction = 1 }) then
        vim.snippet.jump(1)
      else
        fallback()
      end
    end, { "i", "s" }),
  }),
  sources = cmp.config.sources({
    { name = "nvim_lsp" },
    { name = "path" },
  }, {
    { name = "buffer" },
  }),
})