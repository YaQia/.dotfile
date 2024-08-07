local config = function()
	require("telescope").setup({
		pickers = {
			find_files = {
				theme = "dropdown",
			},
		},
		extensions = {
			undo = {},
			fzf = {
				fuzzy = true, -- false will only do exact matching
				override_generic_sorter = true, -- override the generic sorter
				override_file_sorter = true, -- override the file sorter
				case_mode = "smart_case", -- or "ignore_case" or "respect_case"
				-- the default case_mode is "smart_case"
			},
		},
	})
	require("telescope").load_extension("undo")
	require("telescope").load_extension("fzf")
end

-- search tools
return {
	"nvim-telescope/telescope.nvim",
	-- tag = "0.1.3",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"debugloop/telescope-undo.nvim",
	},
	event = "VeryLazy",
	-- cmd = "Telescope",
	-- keys = "<leader>s",
	config = config,
}
