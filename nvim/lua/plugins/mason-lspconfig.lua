local opts = {
  ensure_installed = require("plugins.lsp_settings.serverlist"),
  automatic_installation = true,
}

return {
  "williamboman/mason-lspconfig.nvim",
  -- event = "VeryLazy",
  -- dependencies = { "neovim/nvim-lspconfig" },
  cmd = { "Mason", "MasonInstall", "MasonUninstall", "LspInstall" },
  -- keys = {
  --   { "<leader>mh", "<cmd>Mason<cr>", desc = "Home" },
  --   { "<leader>mu", "<cmd>MasonUninstallAll", desc = "Uninstall All"}
  -- },
  opts = opts,
}
