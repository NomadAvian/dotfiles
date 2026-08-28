-- Unlist terminal buffers automatically so they don't count as standard open buffers
vim.api.nvim_create_autocmd("TermOpen", {
  group = vim.api.nvim_create_augroup("UnlistTerminalBuffers", { clear = true }),
  callback = function(args)
    vim.bo[args.buf].buflisted = false
  end,
})

vim.opt.autoread = true
