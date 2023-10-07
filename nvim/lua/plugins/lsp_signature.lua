local opts = {
	hint_enable = true, -- virtual hint enable
	hint_prefix = "• ",
}

return {
	"ray-x/lsp_signature.nvim",
	event = "VeryLazy",
	opts = opts,
}
