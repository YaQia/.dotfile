local opts = {
	indent = {
    char = "▏",
    -- for nvim-ufo to work properly
    -- https://github.com/kevinhwang91/nvim-ufo/issues/19
    priority = 11,
  },
	scope = {
		show_start = false,
		show_end = false,
	},
}
return {
	"lukas-reineke/indent-blankline.nvim",
	event = "VeryLazy",
	main = "ibl",
	opts = opts,
}
