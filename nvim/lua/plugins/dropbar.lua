return {
	"Bekaboo/dropbar.nvim",
	-- event = "VeryLazy",
	lazy = false,
	dependencies = {
		-- optional, but required for fuzzy finder support
		"nvim-telescope/telescope-fzf-native.nvim",
		build = "make",
	},
	opts = {},
	config = function()
		require("dropbar").setup({
			bar = {
				attach_events = {
					"OptionSet",
					"BufWinEnter",
					"BufWritePost",
					"LspAttach",
				},
			},
		})
		local dropbar_api = require("dropbar.api")
		vim.keymap.set("n", "<Leader>'", dropbar_api.pick, { desc = "Select Symbol" })
		vim.keymap.set("n", "['", dropbar_api.goto_context_start, { desc = "Go to start of current context" })
		vim.keymap.set("n", "]'", dropbar_api.select_next_context, { desc = "Select next context" })
	end,
}
