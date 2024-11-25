return {
	-- a plugin provides lsp features and a code completion source for code embedded in other documents
	-- I only use it for markdown
	"jmbuhr/otter.nvim",
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
	},
	ft = { "markdown" },
	-- lazy = false,
	config = function()
		local otter = require("otter")
		otter.setup({
			buffers = {
				set_filetype = true,
			},
		})
		vim.api.nvim_create_autocmd({ "BufEnter" }, {
			pattern = { "*.md" },
			callback = function()
				otter.activate()
			end,
		})
	end,
}
