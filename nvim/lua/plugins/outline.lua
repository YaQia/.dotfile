return {
	"hedyhli/outline.nvim",
	lazy = true,
	dependencies = { "onsails/lspkind.nvim" },
	cmd = { "Outline", "OutlineOpen" },
	keys = { -- Example mapping to toggle outline
		-- { "<leader>o", "<cmd>Outline<CR>", desc = "Toggle outline" },
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
		-- keymaps = {
		-- 	fold = { "h" },
		-- 	unfold = { "l" },
		-- },
		auto_close = true,
	},
}
