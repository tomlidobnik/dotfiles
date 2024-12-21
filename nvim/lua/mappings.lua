local key = vim.keymap
key.set("n", "<M-j>", "<cmd>cnext<CR>")
key.set("n", "<M-k>", "<cmd>cprev<CR>")

key.set("n", "<Esc>", "<cmd>nohlsearch<CR>")
key.set("n", "<leader>qd", "<cmd>lua vim.diagnostic.setqflist()<CR>", { desc = "Open [Q]uickfix list [D]iagnostic" })
key.set("n", "<leader>qt", "<cmd>TodoQuickFix<CR>", { desc = "Open [Q]uickfix list [T]o Do" })

key.set("n", ";", ":", { noremap = true })
key.set("n", "q:", "", { noremap = true, silent = true })

key.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
key.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
key.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
key.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })
key.set("i", "<M-h>", "<Left>", { noremap = true, silent = true })
key.set("i", "<M-j>", "<Down>", { noremap = true, silent = true })
key.set("i", "<M-k>", "<Up>", { noremap = true, silent = true })
key.set("i", "<M-l>", "<Right>", { noremap = true, silent = true })

-- Mini keymaps
local minifiles_toggle = function(...)
  if not MiniFiles.close() then
    MiniFiles.open(...)
  end
end
key.set("n", "\\", minifiles_toggle)

key.set("n", "<C-.>", function()
  MiniSplitjoin.toggle()
end, { desc = "Split-Join" })

key.set("n", "<leader>gd", function()
  MiniDiff.toggle_overlay()
end, { desc = "Show Diff" })

-- Snacks keymaps
key.set("n", "<leader>n", function()
  Snacks.notifier.show_history()
end, { desc = "Notification History" })

key.set("n", "<leader>gB", function()
  Snacks.gitbrowse()
end, { desc = "Git Browse" })

key.set("n", "<leader>gb", function()
  Snacks.git.blame_line()
end, { desc = "Git Blame Line" })

key.set("n", "<leader>gg", function()
  Snacks.lazygit()
end, { desc = "Lazygit" })

key.set("n", "<leader>gl", function()
  Snacks.lazygit.log()
end, { desc = "Lazygit Log" })
key.set("n", "<leader>N", function()
  Snacks.win({
    file = vim.api.nvim_get_runtime_file("doc/news.txt", false)[1],
    width = 0.6,
    height = 0.6,
    wo = {
      spell = false,
      wrap = false,
      signcolumn = "yes",
      statuscolumn = " ",
      conceallevel = 3,
    },
  })
end, { desc = "Neovim News" })
