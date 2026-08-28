pcall(vim.cmd.packadd, "render-markdown.nvim")

local ok, render_markdown = pcall(require, "render-markdown")
if not ok then return end

render_markdown.setup({
  enabled = true,
  max_file_size = 10.0,
  file_types = { "markdown" },
  
  -- Rendered symbols & style
  heading = {
    enabled = true,
    sign = true,
    icons = { "󰲡 ", "󰲣 ", "󰲥 ", "󰲧 ", "󰲩 ", "󰲫 " },
  },
  code = {
    enabled = true,
    sign = true,
    style = "full", -- Highlights entire code block background
  },
  bullet = {
    enabled = true,
    icons = { "●", "○", "◆", "◇" },
  },
  checkbox = {
    enabled = true,
    unchecked = { icon = "󰄱 " },
    checked = { icon = "󰱒 " },
  },
  pipe_table = {
    enabled = true,
    style = "full", -- Renders clean ASCII borders around tables
  },
})

-- Toggle markdown rendering on/off with <leader>tm
vim.keymap.set("n", "<leader>tm", "<cmd>RenderMarkdown toggle<cr>", { desc = "Toggle Markdown Render" })
