local config = function()
	require("lspsaga").setup({
		ui = {
			border = "rounded",
			lines = { "└", "├", "│", "─", "┌" },
		},
		beacon = {
			enable = false,
		},
		lightbulb = {
			enable = false,
		},
		symbol_in_winbar = {
			separator = " 🢖 ",
			folder_level = 0,
		},
		-- rename = {
		-- 	in_select = false,
		-- 	keys = { quit = "<esc>" },
		-- },
		outline = {
			close_after_jump = true,
			keys = { jump = "<CR>" },
		},
		finder = {
			keys = { toggle_or_open = "<CR>" },
		},
	})

	local keymap = vim.keymap.set

	-- lsp keymaps
	vim.api.nvim_create_autocmd("LspAttach", {
		group = vim.api.nvim_create_augroup("UserLspConfig", {}),
		callback = function(ev)
			-- Enable completion triggered by <c-x><c-o>
			vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

			local opts = { buffer = ev.buf }
			keymap("n", "gD", "<cmd>Lspsaga finder def<cr>", opts)
			keymap("n", "gd", "<cmd>Lspsaga goto_definition<cr>", opts)
			keymap("n", "gr", "<cmd>Lspsaga finder def+ref<cr>", opts)
			-- keymap("n", "K", "<cmd>Lspsaga hover_doc<cr>", opts)
			keymap("n", "gi", "<cmd>Lspsaga finder imp<cr>", opts)
			-- Buffer local mappings.
			-- See `:help vim.lsp.*` for documentation on any of the below functions
			-- keymap("n", "<C-k>", vim.lsp.buf.signature_help, opts)
			-- keymapis useless ↓
			-- keymapset("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, opts)
			-- keymapset("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, opts)
			-- keymapset("n", "<leader>wl", function()
			--  print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
			-- end, opts)
			-- keymap("n", "<leader>D", vim.lsp.buf.type_definition, opts)
		end,
	})
end

return {
	"nvimdev/lspsaga.nvim",
	event = "LspAttach",
	-- event = "VeryLazy",
	config = config,
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
		"nvim-tree/nvim-web-devicons",
	},
}
