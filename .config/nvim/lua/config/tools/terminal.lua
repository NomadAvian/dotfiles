local state = {
  floating = {
    buf = -1,
    win = -1,
  },
}

local function create_floating_window(opts)
  opts = opts or {}
  local width = opts.width or math.floor(vim.o.columns)
  local height = opts.height or math.floor(vim.o.lines)

  local col = math.floor((vim.o.columns - width) / 2)
  local row = math.floor((vim.o.lines - height) / 2)

  local buf = nil
  if vim.api.nvim_buf_is_valid(opts.buf) then
    buf = opts.buf
  else
    buf = vim.api.nvim_create_buf(false, true)
  end

  local win_config = {
    relative = "editor",
    width = width,
    height = height,
    row = row,
    col = col,
    style = "minimal",
    border = "rounded",
  }

  local win = vim.api.nvim_open_win(buf, true, win_config)
  return { buf = buf, win = win }
end

local function toggle_terminal()
  if not vim.api.nvim_win_is_valid(state.floating.win) then
    state.floating = create_floating_window({ buf = state.floating.buf })
    if vim.bo[state.floating.buf].buftype ~= "terminal" then
      vim.cmd.terminal()
    end
    vim.cmd("startinsert")
  else
    vim.api.nvim_win_hide(state.floating.win)
  end
end

-- Toggle terminal with Ctrl+/ (Mapped to both <C-/> and <C-_> for terminal compatibility)
vim.keymap.set({ "n", "t" }, "<C-/>", toggle_terminal, { desc = "Toggle Terminal" })
vim.keymap.set({ "n", "t" }, "<C-_>", toggle_terminal, { desc = "Toggle Terminal" })

-- Double-Esc to drop out of terminal insert mode into normal terminal mode
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit Terminal Mode" })
