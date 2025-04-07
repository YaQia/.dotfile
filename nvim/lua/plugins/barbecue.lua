return {
	"utilyre/barbecue.nvim",
	name = "barbecue",
	enabled = false,
	-- event = "VimEnter", -- this is better than LspAttach, because the line will occur immediately.
	version = "*",
	dependencies = {
		"SmiteshP/nvim-navic",
		"nvim-tree/nvim-web-devicons", -- optional dependency
	},
	opts = {
		-- configurations go here
		attach_navic = false,
	},
}
