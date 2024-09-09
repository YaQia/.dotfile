return {
	"hedyhli/outline.nvim",
	lazy = true,
	cmd = { "Outline", "OutlineOpen" },
	keys = { -- Example mapping to toggle outline
		{ "<leader>lo", "<cmd>Outline<CR>", desc = "Toggle outline" },
	},
	opts = {
		-- Your setup opts here
		outline_items = {
			show_symbol_lineno = true,
		},
		preview_window = {
			border = "rounded",
		},
		symbols = {
			icon_source = "lspkind",
		},
	},
}
