local wk = require("which-key")

vim.keymap.set("n", "x", '"_x', { noremap = true, silent = true })
vim.keymap.set("x", "x", '"_x', { noremap = true, silent = true })
vim.keymap.set("v", "x", '"_x', { noremap = true, silent = true })
vim.keymap.set("n", "c", '"_c')
vim.keymap.set("n", "C", '"_C')
vim.keymap.set("n", "cc", '"_cc')
vim.keymap.set("x", "c", '"_c')

local fzf = require("fzf-lua")

wk.add({
  {
    mode = { "n" },
    { "<leader>qr", "<cmd>Leet run<CR>", desc = "Run code" },
    { "<leader>qs", "<cmd>Leet submit<CR>", desc = "Submit code" },
    { "<leader>qi", "<cmd>Leet info<CR>", desc = "Get info" },
    { "<leader>qo", "<cmd>Leet open<CR>", desc = "Open in browser" },
    { "<leader>qd", "<cmd>Leet desc<CR>", desc = "Toggle decription" },
    { "<leader>qm", "<cmd>Leet menu<CR>", desc = "Open menu" },
    { "<C-d>", "<C-d>zz", desc = "Move down in buffer with cursor centered" },
    { "<C-u>", "<C-u>zz", desc = "Move up in buffer with cursor centered" },
    { "n", "nzzzv", desc = "Search next with cursor centered" },
    { "N", "Nzzzv", desc = "Search previous with cursor centered" },
    { "<leader>u", "<cmd>UndotreeToggle<CR>", desc = "Toggle undo tree" },
    { "<leader>o", "<cmd>Outline<CR>", desc = "Toggle Outline" },
    { "<Esc>", "<cmd>nohlsearch<CR>", hidden = true }, -- Unhighlight
    { "<C-h>", "<C-w><C-h>", hidden = true }, -- Move to left window
    { "<C-l>", "<C-w><C-l>", hidden = true }, -- Move to right window
    { "<C-j>", "<C-w><C-j>", hidden = true }, -- Move to lower window
    { "<C-k>", "<C-w><C-k>", hidden = true }, -- Move to upper window
    { "<C-q>", "<C-w><C-q>", hidden = true }, -- Close window
    { "<leader>l", "<cmd>Neotree toggle<CR>", desc = "Neotree toggle" },
    {
      "<leader><leader>",
      function()
        require("fzf-lua").buffers()
      end,
      desc = "Search Buffers",
    },
    {
      "<leader>s",
      function()
        require("fzf-lua").files()
      end,
      desc = "Search Files",
    },
    {
      "<leader>/",
      function()
        require("fzf-lua").live_grep()
      end,
      desc = "Search by Grep",
    },
    {
      "<leader>h",
      function()
        require("fzf-lua").lsp_document_diagnostics()
      end,
      desc = "Search Diagnostics",
    },
    {
      "<leader>n",
      function()
        Snacks.notifier.show_history()
      end,
      desc = "Notification History",
    },
  },
})
