local wk = require("which-key")

vim.keymap.set("n", "x", '"_x', { noremap = true, silent = true })
vim.keymap.set("x", "x", '"_x', { noremap = true, silent = true })
vim.keymap.set("v", "x", '"_x', { noremap = true, silent = true })
vim.keymap.set("n", "c", '"_c')
vim.keymap.set("n", "C", '"_C')
vim.keymap.set("n", "cc", '"_cc')
vim.keymap.set("x", "c", '"_c')
vim.keymap.set("n", "<leader>q", vim.cmd.wq, { desc = "Save and quit" })

-- for searching all files, hidden aswell
local fzf = require("fzf-lua")
vim.keymap.set("n", "<leader>sa", function()
  fzf.files({ fd_opts = "--no-ignore --hidden --type f --type l" })
end, { desc = "Search including ignored files" })

wk.add({
  {
    mode = { "v" },
    { "<", "<gv", hidden = true },
    { ">", ">gv", hidden = true },
    { "P", '"_dP', hidden = true },
  },
  {
    mode = { "n" },
    { "<leader>-", "<CMD>Oil --float<CR>", desc = "Open directory in float" },
    { "<C-d>", "<C-d>zz", desc = "Move down in buffer with cursor centered" },
    { "<C-u>", "<C-u>zz", desc = "Move up in buffer with cursor centered" },
    { "n", "nzzzv", desc = "Search next with cursor centered" },
    { "N", "Nzzzv", desc = "Search previous with cursor centered" },
    { "<leader>u", "<cmd>UndotreeToggle<CR>", desc = "Toggle undo tree" },
    { "<leader>oo", "<cmd>Outline<CR>", desc = "Toggle Outline" },
    { "<leader>on", "<cmd>ObsidianNew<CR>", desc = "New Obsidian File" },
    { "<leader>ol", "<cmd>ObsidianFollowLink<CR>", desc = "Follow Link" },
    { "<leader>ob", "<cmd>ObsidianBacklinks<CR>", desc = "Search backlinks" },
    { "<leader>ov", "<cmd>ObsidianLinks<CR>", desc = "Search backlinks" },
    { "<leader>ot", "<cmd>ObsidianTag<CR>", desc = "Search Obsidian Tags" },
    { "<leader>os", "<cmd>ObsidianSearch<CR>", desc = "Search Obsidian Files" },
    { "<leader>od", "<cmd>ObsidianToday<CR>", desc = "Open Daily Note" },
    { "<leader>oi", "<cmd>ObsidianPasteImg<CR>", desc = "Paste Image" },
    {
      "<leader>of",
      function()
        local line = vim.api.nvim_get_current_line()
        local pattern = "%(([^)]+)%)"
        local _, _, path = string.find(line, pattern)
        if path then
          local absolute_path = "/Users/tomiko/Library/Mobile Documents/iCloud~md~obsidian/Documents/Obsidian/" .. path
          local command = "!open '" .. absolute_path .. "'"
          -- local command = "!open '" .. path .. "'" -- could also open relative
          vim.cmd("silent " .. command)
        end
      end,
      desc = "Open File",
    },

    { "<Esc>", "<cmd>nohlsearch<CR>", hidden = true }, -- Unhighlight
    { "<C-h>", "<C-w><C-h>", hidden = true }, -- Move to left window
    { "<C-l>", "<C-w><C-l>", hidden = true }, -- Move to right window
    { "<C-j>", "<C-w><C-j>", hidden = true }, -- Move to lower window
    { "<C-k>", "<C-w><C-k>", hidden = true }, -- Move to upper window
    { "<C-q>", "<C-w><C-q>", hidden = true }, -- Close window
    {
      "<leader>sb",
      function()
        require("fzf-lua").buffers()
      end,
      desc = "Search Buffers",
    },
    {
      "<leader>sk",
      function()
        require("fzf-lua").keymaps()
      end,
      desc = "Search Keymaps",
    },
    {
      "<leader>ss",
      function()
        require("fzf-lua").files()
      end,
      desc = "Search Files",
    },
    {
      "<leader>sw",
      function()
        require("fzf-lua").grep_curbuf()
      end,
      desc = "Search current Word",
    },
    {
      "<leader>sg",
      function()
        require("fzf-lua").live_grep_native()
      end,
      desc = "Search by Grep",
    },
    {
      "<leader>sx",
      function()
        require("fzf-lua").lsp_document_diagnostics()
      end,
      desc = "Search Diagnostics",
    },
    {
      "<leader>sd",
      function()
        require("fzf-lua").lsp_workspace_diagnostics()
      end,
      desc = "Search Diagnostics",
    },
    {
      "<leader>sr",
      function()
        require("fzf-lua").oldfiles()
      end,
      desc = "Search Recent Files",
    },
    {
      "<leader>n",
      function()
        Snacks.notifier.show_history()
      end,
      desc = "Notification History",
    },
    {
      "<leader>gg",
      function()
        Snacks.lazygit()
      end,
      desc = "Lazygit",
    },

    {
      "<leader>gl",
      function()
        Snacks.lazygit.log()
      end,
      desc = "Lazygit Log",
    },
  },
})
