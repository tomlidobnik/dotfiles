return {
  "shaunsingh/nord.nvim",
  priority = 1000,
  init = function()
    vim.cmd.colorscheme("nord")
    vim.cmd.hi("Comment gui=none")
  end,
}
