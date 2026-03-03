return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = {
    win = {
      wo = {
        winblend = 0,
      },
    },
    preset = "helix",
    icons = {
      rules = false,
    },
    delay = 500,
    spec = {
      { "<leader>c", group = "Code", mode = { "n", "x" } },
      { "<leader>d", group = "Document" },
      { "<leader>g", group = "Git" },
      { "<leader>m", group = "Marks" },
      { "<leader>r", group = "Rename" },
      { "<leader>s", group = "Search" },
      { "<leader>t", group = "Toggle" },
      { "<leader>w", group = "Workspace" },
      { "<leader>l", group = "LSP" },
    },
  },
}
