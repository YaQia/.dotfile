local opts = {
  indent = {
    char = "▏",
    -- for nvim-ufo to work properly
    -- https://github.com/kevinhwang91/nvim-ufo/issues/19
    priority = 11,
  },
  scope = {
    enabled = true,
    show_start = false,
    show_end = false,
  },
}
return {
  "lukas-reineke/indent-blankline.nvim",
  -- dependencies = { "YaQia/darkplus.nvim" },
  event = "VeryLazy",
  main = "ibl",
  opts = opts,
  -- config = function ()
  --   require("ibl").setup()
  -- end
}
