local opts = {
  ui = {
    border = "rounded",
  },
}

return {
  "williamboman/mason.nvim",
  -- lazy = false,
	event = { "BufReadPre", "BufNewFile" },
  -- event = { "CursorHold", "CursorHoldI" },
  -- event = "LspAttach",
  -- dependencies = { "williamboman/mason-lspconfig.nvim" },
  -- dependencies = { "neovim/nvim-lspconfig" },
  cmd = { "Mason", "MasonInstall", "MasonUninstall" },
  -- keys = {
  --   { "<leader>mh", "<cmd>Mason<cr>", desc = "Home" },
  --   { "<leader>mu", "<cmd>MasonUninstallAll", desc = "Uninstall All"}
  -- },
  build = ":MasonUpdate",
  opts = opts,
}
