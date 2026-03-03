return {
  "kawre/leetcode.nvim",
  build = function()
    if vim.fn.exists(":TSUpdate") == 2 then
      vim.cmd("TSUpdate html")
    end
  end,
  dependencies = {
    -- include a picker of your choice, see picker section for more details
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
  },
  opts = {
    -- configuration goes here
    lang = "rust",
    storage = {
      home = vim.fn.expand("~/leetcode"),
      cache = vim.fn.stdpath("cache") .. "/leetcode",
    },
    image_support = false,
  },
}
