return {
	"mfussenegger/nvim-lint",
	-- lazy = false,
	event = { "BufReadPost", "BufNewFile" },
	config = function()
		require("lint").linters_by_ft = {
			-- lua = { "luacheck" },
			markdown = { "markdownlint", "cspell" },
			-- c = { "clangtidy" },
			-- cpp = { "clangtidy" },
			-- rust = { "clippy" },
			sh = { "bash" },
			bash = { "bash" },
			fish = { "fish" },
			python = { "ruff" },
			html = { "htmlhint" },
			-- css = { "stylelint" },
			-- scss = { "stylelint" },
			vue = {
				"eslint" --[[ , "stylelint" ]],
			},
			javascript = { "eslint" },
			typescript = { "eslint" },
			typst = { "cspell" },
		}
		vim.api.nvim_create_autocmd({ "BufWritePost" }, {
			callback = function()
				-- try_lint without arguments runs the linters defined in `linters_by_ft`
				-- for the current filetype
				require("lint").try_lint()
			end,
		})
	end,
}
