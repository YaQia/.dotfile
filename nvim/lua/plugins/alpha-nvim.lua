local config = function()
	local alpha = require("alpha")

	local dashboard = require("alpha.themes.dashboard")
	dashboard.section.header.val = {
		[[⠀⠀⠀⠀⠀⠀⢀⣤⣀⣀⣀⠀⠻⣷⣄     ]],
		[[⠀⠀⠀⠀⢀⣴⣿⣿⣿⡿⠋⠀⠀⠀⠹⣿⣦⡀  ]],
		[[⠀⠀⢀⣴⣿⣿⣿⣿⣏⠀⠀⠀⠀⠀⠀⢹⣿⣧  ]],
		[[⠀⠀⠙⢿⣿⡿⠋⠻⣿⣿⣦⡀⠀⠀⠀⢸⣿⣿⡆ ]],
		[[⠀⠀⠀⠀⠉⠀⠀⠀⠈⠻⣿⣿⣦⡀⠀⢸⣿⣿⡇ ]],
		[[⠀⠀⠀⠀⢀⣀⣄⡀⠀⠀⠈⠻⣿⣿⣶⣿⣿⣿⠁ ]],
		[[⠀⠀⠀⣠⣿⣿⢿⣿⣶⣶⣶⣶⣾⣿⣿⣿⣿⡁  ]],
		[[⢠⣶⣿⣿⠋⠀⠀⠉⠛⠿⠿⠿⠿⠿⠛⠻⣿⣿⣦⡀]],
		[[⣿⣿⠟⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠻⣿⡿]],
	}
	-- strange color (gold like), don't mind it
	dashboard.section.header.opts.hl = "WarningMsg"
	dashboard.section.buttons.val = {
		dashboard.button("f", "󰈞  Find file", "<Cmd>Telescope find_files <CR>"),
		dashboard.button("n", "  New file", "<Cmd>ene <BAR> startinsert <CR>"),
		dashboard.button("r", "  Recently used files", "<Cmd>Telescope oldfiles <CR>"),
		dashboard.button("t", "  Find text", "<Cmd>Telescope live_grep <CR>"),
		dashboard.button("c", "  Configuration", "<Cmd>e ~/.config/nvim/init.lua <CR>"),
		dashboard.button("q", "  Quit Neovim", "<Cmd>qa<CR>"),
	}

	-- local function footer()
	-- -- NOTE: requires the fortune-mod package to work
	--   -- local handle = io.popen("fortune")
	--   -- local fortune = handle:read("*a")
	--   -- handle:close()
	--   -- return fortune
	--   return "yaqia"
	-- end
	--
	-- dashboard.section.footer.val = footer()
	--
	-- dashboard.section.footer.opts.hl = "Type"
	-- dashboard.section.header.opts.hl = "Include"
	-- dashboard.section.buttons.opts.hl = "Keyword"

	dashboard.opts.opts.noautocmd = true
	-- vim.cmd([[autocmd User AlphaReady echo 'ready']])
	alpha.setup(dashboard.opts)
end

-- startup page
return {
	"goolord/alpha-nvim",
	event = "VimEnter",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = config,
}
