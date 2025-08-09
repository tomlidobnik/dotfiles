return {
  {
    "bullets-vim/bullets.vim",
    ft = "markdown",
    config = function()
      vim.g.bullets_delete_last_bullet_if_empty = 1
    end,
  },
  {
    "stevearc/conform.nvim",
    event = "VeryLazy",
    optional = true,
    opts = {
      formatters = {
        ["markdownlint-cli2"] = {
          condition = function(_, ctx)
            local diag = vim.tbl_filter(function(d)
              return d.source == "markdownlint"
            end, vim.diagnostic.get(ctx.buf))
            return #diag > 0
          end,
        },
      },
      formatters_by_ft = {
        ["markdown"] = { "prettier", "markdownlint-cli2" },
        ["markdown.mdx"] = { "prettier", "markdownlint-cli2" },
      },
    },
  },
  {
    "williamboman/mason.nvim",
    event = "VeryLazy",
    opts = { ensure_installed = { "markdownlint-cli2" } },
  },
  {
    "nvimtools/none-ls.nvim",
    event = "VeryLazy",
    optional = true,
    opts = function(_, opts)
      local nls = require("null-ls")
      opts.sources = vim.list_extend(opts.sources or {}, {
        nls.builtins.diagnostics.markdownlint_cli2,
      })
    end,
  },
  {
    "mfussenegger/nvim-lint",
    event = "VeryLazy",

    optional = true,
    opts = {
      linters_by_ft = {
        markdown = { "markdownlint-cli2" },
      },
    },
  },
  {
    "neovim/nvim-lspconfig",
    event = "VeryLazy",

    opts = {
      servers = {
        marksman = {},
      },
    },
  },

  {
    "iamcco/markdown-preview.nvim",
    event = "VeryLazy",

    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    build = function()
      require("lazy").load({ plugins = { "markdown-preview.nvim" } })
      vim.fn["mkdp#util#install"]()
    end,
    keys = {
      {
        "<leader>ow",
        ft = "markdown",
        "<cmd>MarkdownPreviewToggle<cr>",
        desc = "Markdown Preview",
      },
    },
    config = function()
      vim.cmd([[do FileType]])
    end,
  },

  {
    "MeanderingProgrammer/render-markdown.nvim",
    ft = "markdown",
    config = function()
      require("render-markdown").setup({
        win_options = {
          conceallevel = {
            default = 0, -- Set default conceallevel to 0
            rendered = 3, -- Keep rendered mode at 3
          },
        },
        bullet = {
          -- Turn on / off list bullet rendering
          enabled = true,
        },
        latex = { enabled = false },
        checkbox = {
          -- Turn on / off checkbox state rendering
          enabled = true,
          -- Determines how icons fill the available space:
          --  inline:  underlying text is concealed resulting in a left aligned icon
          --  overlay: result is left padded with spaces to hide any additional text
          position = "inline",
          unchecked = {
            -- Replaces '[ ]' of 'task_list_marker_unchecked'
            icon = "   󰄱 ",
            -- Highlight for the unchecked icon
            highlight = "RenderMarkdownUnchecked",
            -- Highlight for item associated with unchecked checkbox
            scope_highlight = nil,
          },
          checked = {
            -- Replaces '[x]' of 'task_list_marker_checked'
            icon = "   󰱒 ",
            -- Highlight for the checked icon
            highlight = "RenderMarkdownChecked",
            -- Highlight for item associated with checked checkbox
            scope_highlight = nil,
          },
        },
        html = {
          -- Turn on / off all HTML rendering
          enabled = true,
          comment = {
            -- Turn on / off HTML comment concealing
            conceal = false,
          },
        },
        heading = {
          -- left_pad = 1,
          sign = false,
          icons = { " 󰎤 ", " 󰎧 ", " 󰎪 ", " 󰎭 ", " 󰎱 ", " 󰎳 " },
          backgrounds = {
            "Headline1Bg",
            "Headline2Bg",
            "Headline3Bg",
            "Headline4Bg",
            "Headline5Bg",
            "Headline6Bg",
          },
          foregrounds = {
            "Headline1Fg",
            "Headline2Fg",
            "Headline3Fg",
            "Headline4Fg",
            "Headline5Fg",
            "Headline6Fg",
          },
        },
        ft = { "markdown" },
      })

      local color1_bg = "#bf616a"
      local color2_bg = "#d08770"
      local color5_bg = "#5e81ac"
      local color4_bg = "#a3be8c"
      local color6_bg = "#b48ead"
      local color3_bg = "#ebcb8b"
      local color_fg = "#2e3440"

      vim.cmd(string.format([[highlight @markup.strong guifg=%s]], color2_bg))
      vim.cmd(string.format([[highlight @markup.italic guifg=%s]], color2_bg))
      vim.cmd(string.format([[highlight RenderMarkdownCodeInline guifg=%s]], color4_bg))

      -- Heading background color highlights
      vim.cmd(string.format([[highlight Headline1Bg guifg=%s guibg=%s]], color_fg, color1_bg))
      vim.cmd(string.format([[highlight Headline2Bg guifg=%s guibg=%s]], color_fg, color2_bg))
      vim.cmd(string.format([[highlight Headline3Bg guifg=%s guibg=%s]], color_fg, color3_bg))
      vim.cmd(string.format([[highlight Headline4Bg guifg=%s guibg=%s]], color_fg, color4_bg))
      vim.cmd(string.format([[highlight Headline5Bg guifg=%s guibg=%s]], color_fg, color5_bg))
      vim.cmd(string.format([[highlight Headline6Bg guifg=%s guibg=%s]], color_fg, color6_bg))

      -- Heading foreground color highlights (bold and with specific colors)
      vim.cmd(string.format([[highlight Headline1Fg cterm=bold gui=bold guifg=%s]], color1_bg))
      vim.cmd(string.format([[highlight Headline2Fg cterm=bold gui=bold guifg=%s]], color2_bg))
      vim.cmd(string.format([[highlight Headline3Fg cterm=bold gui=bold guifg=%s]], color3_bg))
      vim.cmd(string.format([[highlight Headline4Fg cterm=bold gui=bold guifg=%s]], color4_bg))
      vim.cmd(string.format([[highlight Headline5Fg cterm=bold gui=bold guifg=%s]], color5_bg))
      vim.cmd(string.format([[highlight Headline6Fg cterm=bold gui=bold guifg=%s]], color6_bg))

      vim.cmd(string.format([[highlight RenderMarkdownH1Bg guifg=%s guibg=%s]], color_fg, color1_bg))
      vim.cmd(string.format([[highlight RenderMarkdownH2Bg guifg=%s guibg=%s]], color_fg, color2_bg))
      vim.cmd(string.format([[highlight RenderMarkdownH3Bg guifg=%s guibg=%s]], color_fg, color3_bg))
      vim.cmd(string.format([[highlight RenderMarkdownH4Bg guifg=%s guibg=%s]], color_fg, color4_bg))
      vim.cmd(string.format([[highlight RenderMarkdownH5Bg guifg=%s guibg=%s]], color_fg, color5_bg))
      vim.cmd(string.format([[highlight RenderMarkdownH6Bg guifg=%s guibg=%s]], color_fg, color6_bg))

      -- Apply custom foreground colors for headings (bold)
      vim.cmd(string.format([[highlight RenderMarkdownH1 guifg=%s guibg=%s cterm=bold gui=bold]], color1_bg, color_fg))
      vim.cmd(string.format([[highlight RenderMarkdownH2 guifg=%s guibg=%s cterm=bold gui=bold]], color2_bg, color_fg))
      vim.cmd(string.format([[highlight RenderMarkdownH3 guifg=%s guibg=%s cterm=bold gui=bold]], color3_bg, color_fg))
      vim.cmd(string.format([[highlight RenderMarkdownH4 guifg=%s guibg=%s cterm=bold gui=bold]], color4_bg, color_fg))
      vim.cmd(string.format([[highlight RenderMarkdownH5 guifg=%s guibg=%s cterm=bold gui=bold]], color5_bg, color_fg))
      vim.cmd(string.format([[highlight RenderMarkdownH6 guifg=%s guibg=%s cterm=bold gui=bold]], color6_bg, color_fg))
      Snacks.toggle({
        name = "Render Markdown",
        get = function()
          return require("render-markdown.state").enabled
        end,
        set = function(enabled)
          local m = require("render-markdown")
          if enabled then
            m.enable()
          else
            m.disable()
          end
        end,
      }):map("<leader>or", { desc = "Toggle Render Markdown" })
    end,
  },
}
