local config = function()
	-- local function lsp_highlight_document(client, bufnr)
	--   -- Set autocommands conditional on server_capabilities
	--   -- https://github.com/neovim/nvim-lspconfig/wiki/UI-Customization#highlight-symbol-under-cursor
	--   if client.server_capabilities.documentHighlightProvider then
	--     vim.api.nvim_create_augroup("lsp_document_highlight", {
	--       clear = false,
	--     })
	--     vim.api.nvim_clear_autocmds({
	--       buffer = bufnr,
	--       group = "lsp_document_highlight",
	--     })
	--     vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
	--       group = "lsp_document_highlight",
	--       buffer = bufnr,
	--       callback = vim.lsp.buf.document_highlight,
	--     })
	--     vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
	--       group = "lsp_document_highlight",
	--       buffer = bufnr,
	--       callback = vim.lsp.buf.clear_references,
	--     })
	--   end
	-- end


	local servers = require("plugins.lsp_settings.serverlist")
	require("lspconfig.ui.windows").default_options.border = "rounded"
	local lspconfig = require("lspconfig")
	-- require("mason").setup({
	-- 	ui = {
	-- 		border = "rounded",
	-- 	},
	-- })
	-- require("mason-lspconfig").setup({
	-- 	ensure_installed = servers,
	-- 	automatic_installation = true,
	-- })

	local opts
	for _, server in pairs(servers) do
		opts = {}
		local require_ok, conf_opts = pcall(require, "plugins.lsp_settings." .. server)
		if require_ok then
			opts = vim.tbl_deep_extend("force", conf_opts, opts)
		end

		lspconfig[server].setup(opts)
	end
end

return {
	"neovim/nvim-lspconfig",
	-- lazy = false,
	-- dependencies = { "williamboman/mason.nvim", "williamboman/mason-lspconfig.nvim" },
	event = { "VimEnter", "BufReadPost", "BufNewFile" },
	-- event = { "CursorHold", "CursorHoldI" },
	-- event = "LspAttach",
	config = config,
}
