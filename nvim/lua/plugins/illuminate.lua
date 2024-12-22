local config = function()
	require("illuminate").configure({
		providers = {
			"lsp",
			-- "treesitter",
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
	"RRethy/vim-illuminate",
	event = { "CursorHold", "CursorHoldI" },
	-- event = { "LspAttach" },
	-- dependencies = { "neovim/nvim-lspconfig" },
	config = config,
}
