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
