return {
  "https://github.com/theprimeagen/harpoon",
  branch = "harpoon2",
  event = "VeryLazy",
  config = function()
    local harpoon = require("harpoon")
    harpoon.setup({
      settings = {
        save_on_toggle = true,
        sync_on_ui_close = true,
        key = function()
          return vim.fn.getcwd()
        end,
      },
    })
    harpoon:setup()

    local list = harpoon:list("default")
    local wk = require("which-key")

    wk.add({
      mode = { "n" },
      {
        "<leader>a",
        function()
          list:add()
        end,
        hidden = true,
      },
      {
        "<leader><leader>",
        function()
          harpoon.ui:toggle_quick_menu(list)
        end,
        hidden = true,
      },
    })
    for i = 1, 6 do
      wk.add({
        "<leader>" .. i,
        function()
          list:select(i)
        end,
        hidden = true,
        mode = "n",
      })
    end
  end,
}
