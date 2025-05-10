return {
	"stevearc/aerial.nvim",
	opts = {
		-- "treesitter" seems to be a bad backend
		-- it will cause the outline to be filtered out.
		backends = { "lsp", "markdown", "asciidoc", "man" },
		filter_kind = false,
		layout = {
			min_width = 15,
			width = 0.2,
			default_direction = "prefer_left",
		},
		attach_mode = "window",
		close_automatic_events = { "unfocus", "unsupported", "switch_buffer" },
		manage_folds = true,
		link_tree_to_folds = false,
		show_guides = true,
	},
	lazy = false,
	-- Optional dependencies
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
		"nvim-tree/nvim-web-devicons",
	},
}
