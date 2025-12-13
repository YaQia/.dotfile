local config = function()
	require("illuminate").configure({
		providers = {
			"lsp",
			"treesitter",
			-- "regex",
		},
		filetypes_denylist = {
			"dirvish",
			"fugitive",
			"alpha",
		},
		modes_denylist = { "i", "v", "V" },
	})
end

return {
	"YaQia/vim-illuminate",
	event = { "CursorHold", "CursorHoldI" },
	enabled = true,
	-- event = { "LspAttach" },
	-- dependencies = { "neovim/nvim-lspconfig" },
	config = config,
}
