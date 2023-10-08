local config = function()
  require("telescope").setup({
    pickers = {
      find_files = {
        theme = "dropdown",
      },
    },
    extensions = {
      undo = {

      },
    },
  })
  require("telescope").load_extension("undo")
end

-- search tools
return {
  "nvim-telescope/telescope.nvim",
  -- tag = "0.1.3",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "debugloop/telescope-undo.nvim",
  },
  event = "VeryLazy",
  cmd = "Telescope",
  keys = "<leader>s",
  config = config,
}
