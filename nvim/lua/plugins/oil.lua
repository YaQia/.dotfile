return {
	"stevearc/oil.nvim",
	event = "VeryLazy",
	opts = {
		-- buf_options = {
		-- 	buflisted = false,
		-- 	bufhidden = "hide",
		-- },
		columns = {
			"icon",
			-- "permissions",
			-- "size",
			-- "mtime",
		},
		keymaps = {
			["<Backspace>"] = "actions.parent",
			["<CR>"] = "actions.select",
			["<C-\\>"] = { "actions.select", opts = { vertical = true } },
			["<C-CR>"] = { "actions.select", opts = { horizontal = true } },
			["<S-CR>"] = { "actions.select", opts = { tab = true } },
		},
		view_options = {
			-- Show files and directories that start with "."
			show_hidden = true,
		},
		-- win_options = {
		-- 	wrap = false,
		-- 	signcolumn = "no",
		-- 	cursorcolumn = false,
		-- 	foldcolumn = "0",
		-- 	spell = false,
		-- 	list = false,
		-- 	conceallevel = 3,
		-- 	concealcursor = "nvic",
		-- },
		-- Buffer-local options to use for oil buffers
		-- buf_options = {
		-- 	buflisted = false,
		-- 	bufhidden = "hide",
		-- },
		-- Configuration for the floating window in oil.open_float
		float = {
			-- Padding around the floating window
			-- padding = 2,
			max_width = 50,
			max_height = 35,
			border = "rounded",
			-- win_options = {
			-- 	winblend = 0,
			-- },
			-- This is the config that will be passed to nvim_open_win.
			-- Change values here to customize the layout
			-- override = function(conf)
			-- 	return conf
			-- end,
		},
		-- Configuration for the actions floating preview window
		preview = {
			-- Width dimensions can be integers or a float between 0 and 1 (e.g. 0.4 for 40%)
			-- min_width and max_width can be a single value or a list of mixed integer/float types.
			-- max_width = {100, 0.8} means "the lesser of 100 columns or 80% of total"
			max_width = 0.9,
			-- min_width = {40, 0.4} means "the greater of 40 columns or 40% of total"
			min_width = { 40, 0.4 },
			-- optionally define an integer/float for the exact width of the preview window
			width = nil,
			-- Height dimensions can be integers or a float between 0 and 1 (e.g. 0.4 for 40%)
			-- min_height and max_height can be a single value or a list of mixed integer/float types.
			-- max_height = {80, 0.9} means "the lesser of 80 columns or 90% of total"
			max_height = 0.9,
			-- min_height = {5, 0.1} means "the greater of 5 columns or 10% of total"
			min_height = { 5, 0.1 },
			-- optionally define an integer/float for the exact height of the preview window
			height = nil,
			border = "rounded",
			win_options = {
				winblend = 0,
			},
			-- Whether the preview window is automatically updated when the cursor is moved
			update_on_cursor_moved = true,
		},
	},
	-- Optional dependencies
	-- dependencies = { "nvim-tree/nvim-web-devicons" },
}
