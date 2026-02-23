return {
  "mrcjkb/rustaceanvim",
  version = "^8", -- Recommended
  lazy = false, -- This plugin is already lazy
  init = function()
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    local ok, blink = pcall(require, "blink.cmp")
    if ok then
      capabilities = blink.get_lsp_capabilities(capabilities)
    end

    vim.g.rustaceanvim = {
      tools = {
        enable_clippy = false,
      },
      server = {
        capabilities = capabilities,
        standalone = true,
        status_notify_level = false,
        load_vscode_settings = false,
        default_settings = {
          ["rust-analyzer"] = {
            checkOnSave = false,
          },
        },
      },
    }
  end,
}
