local opts = {
  ensure_installed = require("plugins.lsp_settings.serverlist"),
  automatic_installation = true,
}

return {
  "williamboman/mason-lspconfig.nvim",
  event = "VeryLazy",
  opts = opts,
}
