return {
	"mikesmithgh/kitty-scrollback.nvim",
	enabled = true,
	lazy = true,
	cmd = { "KittyScrollbackGenerateKittens", "KittyScrollbackCheckHealth" },
	event = { "User KittyScrollbackLaunch" },
	-- version = '*', -- latest stable version, may have breaking changes if major version changed
	-- version = '^5.0.0', -- pin major version, include fixes and features that do not have breaking changes
	config = function()
		require("kitty-scrollback").setup()
		vim.keymap.set({ "v" }, "\\Y", "<Plug>(KsbVisualYankLine)", {})
		vim.keymap.set({ "v" }, "\\y", "<Plug>(KsbVisualYank)", {})
		vim.keymap.set({ "n" }, "\\Y", "<Plug>(KsbNormalYankEnd)", {})
		vim.keymap.set({ "n" }, "\\y", "<Plug>(KsbNormalYank)", {})
		vim.keymap.set({ "n" }, "\\yy", "<Plug>(KsbYankLine)", {})
		vim.keymap.set({ "n" }, "q", "<Plug>(KsbCloseOrQuitAll)", {})
		vim.keymap.set({ "n", "t", "i" }, "ZZ", "<Plug>(KsbQuitAll)", {})
		vim.keymap.set({ "n" }, "<tab>", "<Plug>(KsbToggleFooter)", {})
		vim.keymap.set({ "n", "i" }, "<cr>", "<Plug>(KsbExecuteCmd)", {})
		vim.keymap.set({ "n", "i" }, "\\v", "<Plug>(KsbPasteCmd)", {})
		vim.keymap.set({ "v" }, "<leader><cr>", "<Plug>(KsbExecuteVisualCmd)", {})
		vim.keymap.set({ "v" }, "<leader>\\v", "<Plug>(KsbPasteVisualCmd)", {})
	end,
}
