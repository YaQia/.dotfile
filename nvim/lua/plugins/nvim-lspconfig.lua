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

	local servers = {
		"asm_lsp",
		"clangd",
		"rust_analyzer",
		"gopls",
		"bashls",
		"lua_ls",
		"yamlls",
		"pyright",
		"html",
		"cssls",
		"cssmodules_ls",
		"dockerls",
		"marksman",
		"texlab",
		"ts_ls",
		"eslint",
		"jsonls",
		-- "svelte",
		-- "solargraph",
		"volar",
		"cmake",
		"golangci_lint_ls",
		-- "jdtls",
		-- "drools_lsp",
		"zls",
	}
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

	-- local capabilities = vim.lsp.protocol.make_client_capabilities()
	-- capabilities.textDocument.foldingRange = {
	-- 	dynamicRegistration = false,
	-- 	lineFoldingOnly = true,
	-- }
	local opts
	for _, server in pairs(servers) do
		opts = {
			on_attach = function(client, bufnr)
				-- Check if the file is a Vue file and the client is ts_ls
				local filetype = vim.api.nvim_get_option_value("filetype", { buf = bufnr })
				if not (client.name == "ts_ls" and filetype == "vue") then
					if client.server_capabilities["documentSymbolProvider"] then
						require("nvim-navic").attach(client, bufnr)
					end
				end
			end,
			-- capabilities = require("cmp_nvim_lsp").default_capabilities(),
			-- capabilities = require("blink.cmp").get_lsp_capabilities()
		}
		local require_ok, conf_opts = pcall(require, "plugins.lsp_settings." .. server)
		if require_ok then
			opts = vim.tbl_deep_extend("force", conf_opts, opts)
		end

		opts.capabilities = require("blink.cmp").get_lsp_capabilities(opts.capabilities)

		lspconfig[server].setup(opts)
	end
end

return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"saghen/blink.cmp",
		{
			"SmiteshP/nvim-navbuddy",
			dependencies = {
				"SmiteshP/nvim-navic",
				"MunifTanjim/nui.nvim",
			},
			opts = {
				window = {
					border = "rounded",
				},
				lsp = { auto_attach = true },
			},
		},
	},
	-- lazy = false,
	-- dependencies = { "williamboman/mason.nvim", "williamboman/mason-lspconfig.nvim" },
	event = { "BufReadPost", "BufNewFile" },
	-- event = { "CursorHold", "CursorHoldI" },
	-- event = "VeryLazy",
	cmd = { "LspInfo", "LspInstall", "LspUninstall" },
	config = config,
}
