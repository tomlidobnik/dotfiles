local set = vim.opt
local g = vim.g

g.mapleader = " "
g.maplocalleader = " "
g.have_nerd_font = true
set.number = true
set.relativenumber = true
set.termguicolors = true
set.tabstop = 4
set.shiftwidth = 4
set.swapfile = false
set.expandtab = true
set.mouse = "a"
set.showmode = false
set.breakindent = true
set.undofile = true
set.ignorecase = true
set.smartcase = true
set.signcolumn = "yes"
set.updatetime = 250
set.timeoutlen = 300
set.splitright = true
set.splitbelow = true
set.list = true
set.listchars = { tab = "» ", trail = "·", nbsp = "␣" }
set.inccommand = "split"
set.cursorline = true
set.scrolloff = 4
set.sidescrolloff = 4
set.conceallevel = 2
set.wrap = false

vim.schedule(function()
  set.clipboard = "unnamedplus"
end)
