return {
  {
    "echasnovski/mini.nvim",
    enabled = true,
    config = function()
      local statusline = require("mini.statusline")
      statusline.setup({ use_icons = true })

      local minifiles = require("mini.files")
      minifiles.setup({
        content = {
          filter = nil,
          prefix = nil,
          sort = nil,
        },
        mappings = {
          close = "q",
          go_in = "l",
          go_in_plus = "L",
          go_out = "h",
          go_out_plus = "H",
          mark_goto = "'",
          mark_set = "m",
          reset = "<BS>",
          reveal_cwd = "@",
          show_help = "g?",
          synchronize = "=",
          trim_left = "<",
          trim_right = ">",
        },
        options = {
          permanent_delete = true,
          use_as_default_explorer = true,
        },
        windows = {
          max_number = math.huge,
          preview = false,
          width_focus = 50,
          width_nofocus = 15,
          width_preview = 25,
        },
      })
    end,
  },
}
