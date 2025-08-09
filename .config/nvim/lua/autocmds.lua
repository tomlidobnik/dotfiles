vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight when yanking (copying) text",
  group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = { "gitcommit", "markdown" },
  callback = function(event)
    vim.keymap.set("i", "`", "`", { buffer = event.buf })
  end,
})

vim.api.nvim_create_autocmd("InsertEnter", {
  pattern = "*.md",
  callback = function()
    vim.opt.conceallevel = 0
  end,
})

vim.api.nvim_create_autocmd("InsertLeave", {
  pattern = "*.md",
  callback = function()
    vim.opt.conceallevel = 3
  end,
})
