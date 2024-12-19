return {
  'Bekaboo/dropbar.nvim',
  dependencies = {
    'nvim-telescope/telescope-fzf-native.nvim',
    build = 'make',
  },
  config = function()
    local dropbar_api = require 'dropbar.api'
    vim.keymap.set('n', 'gs', dropbar_api.goto_context_start, { desc = '[G]o to [S]tart of context' })
  end,
}
