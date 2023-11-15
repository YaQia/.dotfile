-- themes
return {
  "YaQia/darkplus.nvim",
  -- lazy = false,
  event = "VimEnter",
  -- for some reason, lspconfig will change the border highlight
  -- dependencies = { "neovim/nvim-lspconfig" },
  -- priority = 1000,
  config = function()
    vim.cmd.colorscheme("darkplus")
  end,
}
