local config = function()
  require("illuminate").configure({
    providers = {
      "lsp",
      "treesitter",
    },
    filetypes_denylist = {
      "dirvish",
      "fugitive",
      "alpha",
    },
    modes_denylist = { "i", "v", "V" },
  })
end

return {
  "RRethy/vim-illuminate",
  event = "VeryLazy",
  config = config,
}
