return {
  "folke/which-key.nvim",
  event = "VimEnter",
  opts = {
    spec = {
      { "<leader>c", group = "[C]ode", mode = { "n", "x" } },
      { "<leader>d", group = "[D]ocument" },
      { "<leader>r", group = "[R]ename" },
      { "<leader>s", group = "[S]earch" },
      { "<leader>w", group = "[W]orkspace" },
      { "<leader>t", group = "[T]oggle" },
      { "<leader>g", group = "[G]it" },
      { "<leader>q", group = "[Q]uick Fix List" },
      { "<leader>h", group = "Git [H]unk", mode = { "n", "v" } },
    },
  },
}
