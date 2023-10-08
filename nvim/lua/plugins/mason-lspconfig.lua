local opts = {
  ensure_installed = require("plugins.lsp_settings.serverlist"),
  automatic_installation = true,
}

return {
  "williamboman/mason-lspconfig.nvim",
  dependencies = { "williamboman/mason.nvim" },
  event = "VeryLazy",
  -- cmd = { "Mason", "MasonInstall", "MasonUninstall" },
  -- keys = {
  --   { "<leader>mh", "<cmd>Mason<cr>", desc = "Home" },
  --   { "<leader>mu", "<cmd>MasonUninstallAll", desc = "Uninstall All"}
  -- },
  opts = opts,
}
