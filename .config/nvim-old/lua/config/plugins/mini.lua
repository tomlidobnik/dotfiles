return {
  {
    "echasnovski/mini.nvim",
    event = "VeryLazy",
    enabled = true,
    config = function()
      require("mini.icons").setup()
      require("mini.move").setup()
      require("mini.ai").setup()
      require("mini.surround").setup()
      require("mini.pairs").setup()
      --
      -- HACK: The Key Commands -> for help run ;h nvim-surround.usage
      --
      --     Old text                    Command         New text
      -- --------------------------------------------------------------------------------
      --     surr*ound_words             ysiw)           (surround_words)
      --     *make strings               ys$"            "make strings"
      --     [delete ar*ound me!]        ds]             delete around me!
      --     remove <b>HTML t*ags</b>    dst             remove HTML tags
      --     'change quot*es'            cs'"            "change quotes"
      --     <b>or tag* types</b>        csth1<CR>       <h1>or tag types</h1>
      --     delete(functi*on calls)     dsf             function calls
      --
    end,
  },
}
