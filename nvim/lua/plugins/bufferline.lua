local opts = {
	options = {
		diagnostics = "nvim_lsp", -- | "nvim_lsp" | "coc",
		diagnostics_update_in_insert = false,
		-- offsets = { { filetype = "NvimTree", text = "", padding = 1 } },
		enforce_regular_tabs = true,
		always_show_bufferline = false,
		sort_by = "extension",
		-- sort_by = 'id' | 'extension' | 'relative_directory' | 'directory' | 'tabs' | function(buffer_a, buffer_b)
		--   -- add custom logic
		--   return buffer_a.modified > buffer_b.modified
		-- end

		groups = {
			items = {
				-- require("bufferline.groups").builtin.pinned:with({ icon = " 󰐃" }),
			},
		},
		hover = {
			enabled = true,
			delay = 200,
			reveal = { "close" },
		},
		-- indicator = {
		-- icon = '▎',
		-- style = "underline",
		-- },
		-- numbers = "ordinal",
	},
}

-- bufferline
return {
	"akinsho/bufferline.nvim",
	-- event = "BufAdd",
	-- version = "*",
	branch = "main",
	dependencies = "nvim-tree/nvim-web-devicons",
	config = function()
		require("bufferline").setup(opts)
		for i = 1, 9 do
			vim.keymap.set(
				"n",
				"<A-" .. tostring(i) .. ">",
				"<Cmd>BufferLineGoToBuffer " .. tostring(i) .. "<cr>",
				{ silent = true }
			)
		end
		vim.keymap.set("n", "<A-0>", "<Cmd>BufferLineGoToBuffer -1<cr>", { silent = true })
		vim.keymap.set("n", "<A-l>", "<Cmd>BufferLineCycleNext<cr>", { silent = true })
		vim.keymap.set("n", "<A-h>", "<Cmd>BufferLineCyclePrev<cr>", { silent = true })
		vim.keymap.set("n", "<A-L>", "<Cmd>BufferLineMoveNext<cr>", { silent = true })
		vim.keymap.set("n", "<A-H>", "<Cmd>BufferLineMovePrev<cr>", { silent = true })
	end,
}
