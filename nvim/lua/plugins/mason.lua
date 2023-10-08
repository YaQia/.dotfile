local opts = {
  ui = {
    border = "rounded",
  },
}

return {
  "williamboman/mason.nvim",
  -- event = "VeryLazy",
  -- cmd = { "Mason", "MasonInstall", "MasonUninstall" },
  -- keys = {
  --   { "<leader>mh", "<cmd>Mason<cr>", desc = "Home" },
  --   { "<leader>mu", "<cmd>MasonUninstallAll", desc = "Uninstall All"}
  -- },
  build = ":MasonUpdate",
  opts = opts,
}
