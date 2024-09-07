return {
	"aznhe21/actions-preview.nvim",
	-- event = "VeryLazy",
	config = function()
		require("actions-preview").setup({
			diff = {
				algorithm = "patience",
				ignore_whitespace = true,
			},
			telescope = require("telescope.themes").get_cursor({
				initial_mode = "normal",
				path_display = {
					shorten = { len = 1, exclude = { -1, -2 } },
				},
				layout_config = {
					cursor = {
						height = 0.4,
						preview_cutoff = 120,
						width = 0.8,
					},
				},
			}),
		})
	end,
}
