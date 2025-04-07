local opts = {
	input = {
		insert_only = false,
	},
	select = {
		backend = "builtin",
		builtin = {
			relative = "cursor",
			min_height = 1,
		}
		-- telescope = require("telescope.themes").get_cursor({
		-- 	initial_mode = "normal",
		-- 	path_display = {
		-- 		shorten = { len = 1, exclude = { -1, -2 } },
		-- 	},
		-- 	layout_config = {
		-- 		cursor = {
		-- 			height = 0.4,
		-- 			preview_cutoff = 100,
		-- 			width = 0.8,
		-- 		},
		-- 	},
		-- }),
	},
}

return {
	"stevearc/dressing.nvim",
	enabled = false,
	opts = opts,
	event = "VeryLazy",
}
