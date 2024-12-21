return {
  {
    "echasnovski/mini.nvim",
    enabled = true,
    config = function()
      require("mini.statusline").setup({ use_icons = true })
      require("mini.splitjoin").setup()
      require("mini.files").setup()
      require("mini.diff").setup()
      require("mini.pairs").setup()
      require("mini.move").setup()
      require("mini.ai").setup()
      require("mini.surround").setup()
    end,
  },
}
