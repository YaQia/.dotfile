local config = function()
	local servers = {
		"asm_lsp",
		"clangd",
		"rust_analyzer",
		"ruff",
		"gopls",
		"bashls",
		"lua_ls",
		"yamlls",
		-- "pyright",
		"html",
		"cssls",
		-- "tailwindcss",
		"cssmodules_ls",
		-- "dockerls",
		"marksman",
		"mdx_analyzer",
		"texlab",
		"ts_ls",
		"eslint",
		"jsonls",
		-- "svelte",
		-- "solargraph",
		-- "vtsls",		-- This is required to be load before vue_ls
		-- "vue_ls",
		"cmake",
		-- "golangci_lint_ls",
		-- "jdtls",
		-- "drools_lsp",
		-- "zls",
		"tinymist",
		-- "ty",
	}

	local opts
	for _, server in pairs(servers) do
		local require_ok, conf_opts = pcall(require, "plugins.lsp_settings." .. server)
		if require_ok then
			opts = conf_opts
		else
			opts = {}
		end

		opts.capabilities = require("blink.cmp").get_lsp_capabilities(opts.capabilities)

		vim.lsp.config(server, opts)
	end
	vim.lsp.enable(servers)
end

return {
	"neovim/nvim-lspconfig",
	dependencies = { "saghen/blink.cmp" },
	lazy = false,
	-- dependencies = { "williamboman/mason.nvim", "williamboman/mason-lspconfig.nvim" },
	-- event = { "BufReadPost", "BufNewFile" },
	-- event = "VeryLazy",
	cmd = { "LspInfo" },
	config = config,
}
