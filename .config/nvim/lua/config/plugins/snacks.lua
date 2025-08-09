return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  opts = {
    bigfile = { enabled = true },
    notifier = { timeout = 2000 },
    quickfile = { enabled = true },
    statuscolumn = { enabled = true },
    image = {
      enabled = true,
      doc = {
        enabled = true,
        float = true,
        inline = false,
        max_width = 60,
        max_height = 30,
      },
    },
    dashboard = {
      enabled = true,
      autokeys = "wert",
      preset = {
        keys = {
          { icon = " ", key = "f", desc = "Find File", action = ":lua Snacks.dashboard.pick('files')" },
          { icon = " ", key = "g", desc = "Grep", action = ":lua Snacks.dashboard.pick('live_grep')", padding = 1 },
          { icon = " ", key = "n", desc = "New File", action = ":ene | startinsert" },
          { icon = "󰒲 ", key = "l", desc = "Lazy", action = ":Lazy", enabled = package.loaded.lazy ~= nil },
          { icon = " ", key = "q", desc = "Quit", action = ":qa" },
        },
      },
      formats = {
        key = function(item)
          return { { "[", hl = "special" }, { item.key, hl = "key" }, { "]", hl = "special" } }
        end,
      },
      sections = {
        { section = "recent_files", limit = 4, padding = 1 },
        { section = "keys", padding = 1 },
        { section = "startup" },
      },
    },
    styles = {
      snacks_image = {
        relative = "editor",
        col = -1,
      },
      lazygit = {
        wo = {
          winhighlight = "NormalFloat:None,FloatBorder:SnacksInputBorder,FloatTitle:SnacksInputTitle",
          cursorline = false,
        },
      },
      float = {
        backdrop = false,
      },
      blame_line = {
        backdrop = false,
      },
    },
  },
  init = function()
    vim.api.nvim_create_autocmd("User", {
      pattern = "VeryLazy",
      callback = function()
        _G.dd = function(...)
          Snacks.debug.inspect(...)
        end
        _G.bt = function()
          Snacks.debug.backtrace()
        end
        vim.print = _G.dd
        Snacks.toggle.option("spell", { name = "Spelling" }):map("<leader>ts")
        Snacks.toggle.option("wrap", { name = "Wrap" }):map("<leader>tw")
        Snacks.toggle.diagnostics():map("<leader>td")
        Snacks.toggle
          .option("conceallevel", { off = 0, on = vim.o.conceallevel > 0 and vim.o.conceallevel or 2 })
          :map("<leader>tc")
        Snacks.toggle.indent():map("<leader>ti")
      end,
    })
  end,
}
