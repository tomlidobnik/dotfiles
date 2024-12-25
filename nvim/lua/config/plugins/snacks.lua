return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  opts = {
    bigfile = { enabled = true },
    notifier = { timeout = 2000 },
    quickfile = { enabled = true },
    statuscolumn = { enabled = true },
    dashboard = {
      enabled = true,
      preset = {
        header = [[
    ███╗   ███╗ █████╗ ██╗  ██╗███████╗   
    ████╗ ████║██╔══██╗██║ ██╔╝██╔════╝   
    ██╔████╔██║███████║█████╔╝ █████╗     
    ██║╚██╔╝██║██╔══██║██╔═██╗ ██╔══╝     
    ██║ ╚═╝ ██║██║  ██║██║  ██╗███████╗   
    ╚═╝     ╚═╝╚═╝  ╚═╝╚═╝  ╚═╝╚══════╝   
      ██████╗ ██████╗  ██████╗ ██╗        
     ██╔════╝██╔═══██╗██╔═══██╗██║        
     ██║     ██║   ██║██║   ██║██║        
     ██║     ██║   ██║██║   ██║██║        
     ╚██████╗╚██████╔╝╚██████╔╝███████╗   
      ╚═════╝ ╚═════╝  ╚═════╝ ╚══════╝   
███████╗████████╗██╗   ██╗███████╗███████╗
██╔════╝╚══██╔══╝██║   ██║██╔════╝██╔════╝
███████╗   ██║   ██║   ██║█████╗  █████╗  
╚════██║   ██║   ██║   ██║██╔══╝  ██╔══╝  
███████║   ██║   ╚██████╔╝██║     ██║     
╚══════╝   ╚═╝    ╚═════╝ ╚═╝     ╚═╝     ]],
      },
      formats = {
        key = function(item)
          return { { "[", hl = "special" }, { item.key, hl = "key" }, { "]", hl = "special" } }
        end,
      },
      sections = {
        -- { section = "header", align = "center" },
        { section = "recent_files", limit = 8, padding = 1 },
        { section = "keys", padding = 1 },
        { section = "startup" },
      },
    },
    styles = {
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
        vim.print = _G.dd -- Override print to use snacks for `:=` command

        -- Create some toggle mappings
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
