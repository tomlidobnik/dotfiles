return {
  "shaunsingh/nord.nvim",
  priority = 1000,
  init = function()
    vim.cmd.colorscheme("nord")
    vim.cmd.hi("Comment gui=none")
    -- Set transparency
    vim.cmd("hi Normal guibg=NONE ctermbg=NONE")
    vim.cmd("hi NormalFloat guibg=NONE ctermbg=NONE")
    vim.cmd("hi SignColumn guibg=NONE")
    vim.cmd("hi FloatBorder guibg=NONE")
    vim.cmd("hi CursorLine guibg=NONE")
  end,
}
