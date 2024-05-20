-- local opts = {
--   hint_enable = true, -- virtual hint enable
--   hint_prefix = "• ",
-- }

return {
  "ray-x/lsp_signature.nvim",
  -- lazy = false,
	-- event = { "InsertEnter", "CmdlineEnter" },
  -- event = { "VimEnter", "BufReadPost", "BufNewFile" },
  event = "VeryLazy",
  -- dependencies = { "neovim/nvim-lspconfig" },
  opts = {
    hint_enable = true, -- virtual hint enable
    hint_prefix = "• ",
  },
  config = function (_, opts)
    require('lsp_signature').setup(opts)
  end
}
