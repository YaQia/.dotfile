return {
  "oxfist/night-owl.nvim",
  -- event = "VimEnter",
  dependencies = { "neovim/nvim-lspconfig" },
  config = function ()
    vim.cmd.colorscheme("night-owl")
    require('lualine').setup {
      options = {
        theme = 'night-owl'
      }
    }
  end
}
