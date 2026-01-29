return {
	"YaQia/glance.nvim",
	-- dir = "~/glance.nvim",
	-- lazy = false,
	cmd = "Glance",
	opts = {
		hooks = {
			before_open = function(results, open, jump, method)
				if (method == "definitions" or method == "references") and #results == 1 then
					jump(results[1])
				else
					open(results)
				end
			end,
		},
		call_hierarchy = {
			nested = true,
		},
		folds = {
			fold_closed = "",
			fold_open = "",
			folded = true, -- Automatically fold list on startup
		},
		indent_lines = {
			enable = true, -- Show indent guidelines
			icon = " ",
		},
	},
}
