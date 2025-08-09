return {
  "stevearc/oil.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    require("oil").setup({
      default_file_explorer = true,
      keymaps = {
        ["l"] = "actions.select",
        ["h"] = "actions.parent",
        ["<CR>"] = "actions.select",
        ["<C-s>"] = nil,
        ["<C-h>"] = nil,
        ["<C-l>"] = nil,
      },
      delete_to_trash = true,
      view_options = {
        show_hidden = true,
      },
      skip_confirm_for_simple_edits = true,
      float = {
        max_width = 80,
        max_height = 30,
        override = function(conf)
          return conf
        end,
      },
    })
    vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })

    vim.api.nvim_create_autocmd("FileType", {
      pattern = "oil",
      callback = function()
        vim.opt_local.cursorline = true
      end,
    })
  end,
}
