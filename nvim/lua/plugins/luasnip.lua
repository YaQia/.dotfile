-- snippets
return {
	"L3MON4D3/LuaSnip",
	-- enabled = false,
	dependencies = {
		{
			"rafamadriz/friendly-snippets",
		},
	},

	config = function()
		require("luasnip.loaders.from_vscode").lazy_load()
		local luasnip = require("luasnip")

		luasnip.config.setup({
			-- deprecated, if not nil, keep_roots, link_roots, link_children will be set to the value of history
			-- history = true,
			keep_roots = false,
			link_roots = false,
			link_children = false,
			exit_roots = false,
			-- default
			-- update_events = "InsertLeave",
			-- update_events = {"TextChanged", "TextChangedI"},
			-- region_check_events = "InsertEnter", -- disabled by default
			-- delete_check_events = "InsertLeave", -- disabled by default
			enable_autosnippets = true,
		})
	end,
	event = "InsertEnter",
}
