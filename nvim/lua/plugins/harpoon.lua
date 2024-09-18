return {
	"ThePrimeagen/harpoon",
	-- event = "VeryLazy",
	branch = "harpoon2",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		local harpoon = require("harpoon")
		harpoon:setup({
			settings = {
				save_on_toggle = true,
				sync_on_ui_close = false,
				key = function()
					return vim.loop.cwd()
				end,
			},
		})

		-- vim.keymap.set("n", "<C-h>", function() harpoon:list():select(1) end)
		-- vim.keymap.set("n", "<C-t>", function() harpoon:list():select(2) end)
		-- vim.keymap.set("n", "<C-n>", function() harpoon:list():select(3) end)
		-- vim.keymap.set("n", "<C-s>", function() harpoon:list():select(4) end)
		-- Toggle previous & next buffers stored within Harpoon list
		-- vim.keymap.set("n", "<S-Tab>", function()
		-- 	harpoon:list():prev()
		-- end)
		-- vim.keymap.set("n", "<Tab>", function()
		-- 	harpoon:list():next()
		-- end)
	end,
}
