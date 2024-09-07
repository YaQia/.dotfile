local opts = {
	input = {
		insert_only = false,
	},
	select = {
		enable = false,
	},
}

return {
	"stevearc/dressing.nvim",
	opts = opts,
	event = "VeryLazy",
}
