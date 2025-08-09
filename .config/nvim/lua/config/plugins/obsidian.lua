return {
  "epwalsh/obsidian.nvim",
  event = "VeryLazy",
  version = "*",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "ibhagwan/fzf-lua",
  },
  opts = {
    ui = { enable = false },
    daily_notes = {
      date_format = "%Y-%m-%d",
      alias_format = "%B %-d, %Y",
      default_tags = { "daily" },
      template = nil,
      folder = "daily",
    },
    dir = "$HOME/Library/Mobile Documents/iCloud~md~obsidian/Documents/Obsidian/",
    mappings = {},
    follow_url_func = function(url)
      -- Open the URL in the default web browser.
      -- if URL contains @ it should be replaced with %40
      vim.fn.jobstart({ "open", url }) -- Mac OS
    end,
    note_id_func = function(title)
      -- Create note IDs in a Zettelkasten format with a timestamp and a suffix.
      -- In this case a note with the title 'My new note' will be given an ID that looks
      -- like '1657296016-my-new-note', and therefore the file name '1657296016-my-new-note.md'
      local suffix = ""
      if title ~= nil then
        -- If title is given, transform it into valid file name.
        suffix = title:gsub(" ", "-"):gsub("[^A-Za-z0-9-]", ""):lower()
      else
        -- If title is nil, just add 4 random uppercase letters to the suffix.
        for _ = 1, 4 do
          suffix = suffix .. string.char(math.random(65, 90))
        end
      end
      return tostring(os.time()) .. "-" .. suffix
    end,
  },
}
