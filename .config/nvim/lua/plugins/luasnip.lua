return {
  "L3MON4D3/LuaSnip",
  config = function()
    local ls = require("luasnip")
    vim.keymap.set({ "i", "s" }, "<Tab>", function()
      if ls.jumpable(1) then return ls.jump(1) end
      return "<Tab>"
    end, { silent = true, expr = true })
  end,
}
