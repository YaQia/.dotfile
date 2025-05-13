return {
	"YaQia/snacks.nvim",
	priority = 1000,
	lazy = false,
	---@type snacks.Config
	opts = {
		-- your configuration comes here
		-- or leave it empty to use the default settings
		-- refer to the configuration section below
		animate = {
			enabled = true,
			fps = 120,
		},
		bigfile = { enabled = true },
		dashboard = { enabled = false },
		explorer = { enabled = false },
		git = { enabled = true },
		image = {
			enabled = true,
			doc = {
				inline = true,
			},
		},
		indent = {
			enabled = true,
			animate = {
				enabled = false,
				easing = "outQuad",
			},
			scope = {
				char = "▏",
			},
			indent = {
				char = "▏",
			},
		},
		input = { enabled = true },
		picker = { enabled = true },
		layout = { enabled = true },
		notifier = { enabled = false },
		notify = { enabled = false },
		quickfile = { enabled = true },
		scope = { enabled = true },
		scroll = {
			enabled = false,
			animate = {
				duration = { step = 30, total = 210 },
				easing = "outQuad",
			},
		},
		statuscolumn = {
			enabled = true,
			left = { "mark", "sign" }, -- priority of signs on the left (high to low)
			right = { "git", "fold" }, -- priority of signs on the right (high to low)
			folds = {
				open = false, -- show open fold icons
				git_hl = true, -- use Git Signs hl for fold icons
			},
			git = {
				-- patterns to match Git signs
				patterns = { "GitSign", "MiniDiffSign" },
			},
			refresh = 50, -- refresh at most every 50ms
		},
		styles = {
			["input"] = {
				relative = "cursor",
				width = 25,
				row = -3,
			},
		},
		toggle = {
			enabled = true,
			which_key = true,
			notify = true,
		},
		win = {
			enabled = true,
		},
		words = {
			enabled = false,
		},
		zen = {
			enabled = true,
		},
	},
}
