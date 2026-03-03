return {
  {
    "ojroques/nvim-osc52",
    event = "VeryLazy",
    config = function()
      vim.keymap.set("v", "Y", require("osc52").copy_visual)
    end,
  },
  { -- For CSS colors
    "NvChad/nvim-colorizer.lua",
    event = "BufReadPre",
    opts = {
      user_default_options = {
        names = false,
        tailwind = "both",
        css = true,
        css_fn = true,
        mode = "background",
      },
    },
  },
  { -- for file outline
    "hedyhli/outline.nvim",
    event = "VeryLazy",
    opts = {},
  },
  { -- Undotree
    "mbbill/undotree",
    event = "VeryLazy",
    config = function()
      vim.g.undotree_SplitWidth = 50
      vim.g.undotree_WindowLayout = 3
    end,
  },
  { -- for colored brackets and divs
    "HiPhish/rainbow-delimiters.nvim",
    event = "VeryLazy",
  },
  { -- for tmux navigation
    event = "VeryLazy",
    "christoomey/vim-tmux-navigator",
    cmd = {
      "TmuxNavigateLeft",
      "TmuxNavigateDown",
      "TmuxNavigateUp",
      "TmuxNavigateRight",
      "TmuxNavigatePrevious",
      "TmuxNavigatorProcessList",
    },
    keys = {
      { "<c-h>", "<cmd><C-U>TmuxNavigateLeft<cr>" },
      { "<c-j>", "<cmd><C-U>TmuxNavigateDown<cr>" },
      { "<c-k>", "<cmd><C-U>TmuxNavigateUp<cr>" },
      { "<c-l>", "<cmd><C-U>TmuxNavigateRight<cr>" },
      { "<c-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>" },
    },
  },
}
