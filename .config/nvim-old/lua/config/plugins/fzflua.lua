return {
  "ibhagwan/fzf-lua",
  event = "VeryLazy",
  dependencies = { "echasnovski/mini.icons" },
  opts = {
    keymap = {
      builtin = {
        ["<S-j>"] = "preview-page-down",
        ["<S-k>"] = "preview-page-up",
      },
    },
    winopts = {
      row = 1,
      col = 0,
      width = 1,
      height = 0.4,
      title_pos = "left",
      preview = {
        layout = "horizontal",
        title_pos = "right",
      },
    },
    files = {
      -- Show hidden files but respect .gitignore
      -- rg_opts = [[--color=never --hidden --files -g "!.git" --ignore-file ~/.config/git/ignore]],
      -- fd_opts = [[--color=never --hidden --type f --type l --exclude .git --ignore-file ~/.config/git/ignore]],
    },
  },
}
