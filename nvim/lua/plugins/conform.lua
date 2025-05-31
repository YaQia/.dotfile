return {
	"stevearc/conform.nvim",
	event = { "BufWritePre" },
	cmd = { "ConformInfo" },
	keys = {
		{
			-- Customize or remove this keymap to your liking
			"<leader>lf",
			function()
				require("conform").format({ async = true })
			end,
			mode = "",
			desc = "Format buffer",
		},
	},
	-- This will provide type hinting with LuaLS
	---@module "conform"
	---@type conform.setupOpts
	opts = {
		-- Define your formatters
		formatters_by_ft = {
			lua = { "stylua" },
			go = { "gofmt" },
			c = { "clang-format" },
			python = { "isort", "black" },
			rust = { "rustfmt", lsp_format = "fallback" },
			sh = { "shfmt", lsp_format = "fallback" },
			bash = { "shfmt", lsp_format = "fallback" },
			fish = { "fish_indent" },
			-- stop_after_first = true
			html = { "prettier" },
			css = { "prettier" },
			javascript = { "prettier" },
			javascriptreact = { "prettier" },
			typescript = { "prettier" },
			typescriptreact = { "prettier" },
			json = { "prettier" },
			yaml = { "prettier" },
			vue = { "prettier" },
			markdown = { "prettier", "cbfmt" },
		},
		-- Set default options
		default_format_opts = {
			lsp_format = "fallback",
		},
		-- notify_on_error = false,
		-- Set up format-on-save
		-- format_on_save = { timeout_ms = 500 },
		-- Customize formatters
		-- formatters = {
		-- 	prettier = {
		-- 		prepend_args = { "--use-tabs" },
		-- 	},
		-- },
	},
	init = function()
		-- If you want the formatexpr, here is the place to set it
		vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
	end,
}
