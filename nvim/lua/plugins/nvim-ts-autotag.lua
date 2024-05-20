return {
	"windwp/nvim-ts-autotag",
	dependencies = "nvim-treesitter/nvim-treesitter",
	config = function()
		require("nvim-ts-autotag").setup({
			-- your config
		})
	end,
	-- lazy = false,
	ft = {
		"html",
		"javascript",
		"typescript",
		"javascriptreact",
		"typescriptreact",
		"svelte",
		"vue",
		"tsx",
		"jsx",
		"rescript",
		"xml",
		"php",
		"markdown",
		"glimmer",
		"handlebars",
		"hbs",
	},
}
