local set = vim.opt_local

-- set.shiftwidth = 2

vim.api.nvim_create_augroup("DjangoTemplates", { clear = true })

vim.api.nvim_create_autocmd("FileType", {
  group = "DjangoTemplates",
  pattern = "htmldjango",
  callback = function()
    vim.cmd("setlocal syntax=on")
    vim.cmd("syntax include @Javascript syntax/javascript.vim")
    vim.cmd("syntax region javascript start=/<script>/ end=/<\\/script>/ contains=@Javascript")
  end,
})
