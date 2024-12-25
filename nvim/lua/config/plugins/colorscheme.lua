return {
  -- "catppuccin/nvim",
  "shaunsingh/nord.nvim",
  priority = 1000,
  init = function()
    vim.cmd.colorscheme("nord")
    -- vim.cmd.colorscheme("catppuccin-mocha")
    vim.cmd.hi("Comment gui=none")
  end,
}
