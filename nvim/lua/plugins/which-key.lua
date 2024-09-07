local config = function()
	local wk = require("which-key")
	wk.add({
		{
			mode = { "v" },
			{ "<leader>l", group = "LSP" },
			{ "<leader>la", require("actions-preview").code_actions, desc = "Code Action" },
		},
		-- default mode is Normal, no need to define
		{ "<leader>;", "<cmd>Alpha<cr>", desc = "Dashboard" },
		{ "<leader>e", "<cmd>lua require('oil').toggle_float()<cr>", desc = "Explorer" },
		{ "<leader>w", "<cmd>w!<cr>", desc = "Save" },
		{ "<leader>q", "<cmd>confirm q<cr>", desc = "Quit" },
		{ "<leader>c", "<cmd>bdelete!<cr>", desc = "Close Buffer" },
		-- Plugins group
		{ "<leader>p", group = "Plugins" },
		{ "<leader>pi", "<cmd>Lazy install<cr>", desc = "Install" },
		{ "<leader>ps", "<cmd>Lazy sync<cr>", desc = "Sync" },
		{ "<leader>ph", "<cmd>Lazy show<cr>", desc = "Home" },
		{ "<leader>pu", "<cmd>Lazy update<cr>", desc = "Update" },
		{ "<leader>pp", "<cmd>Lazy profile<cr>", desc = "Profile" },
		{ "<leader>pc", "<cmd>Lazy clean<cr>", desc = "Clean" },
		{ "<leader>pl", "<cmd>Lazy log<cr>", desc = "Log" },
		-- Git group
		{ "<leader>g", group = "Git" },
		{ "<leader>gj", "<cmd>lua require 'gitsigns'.next_hunk()<cr>", desc = "Next Hunk" },
		{ "<leader>gk", "<cmd>lua require 'gitsigns'.prev_hunk()<cr>", desc = "Prev Hunk" },
		{ "<leader>gB", "<cmd>lua require 'gitsigns'.blame_line()<cr>", desc = "Blame" },
		{ "<leader>gp", "<cmd>lua require 'gitsigns'.preview_hunk()<cr>", desc = "Preview Hunk" },
		{ "<leader>gr", "<cmd>lua require 'gitsigns'.reset_hunk()<cr>", desc = "Reset Hunk" },
		{ "<leader>gR", "<cmd>lua require 'gitsigns'.reset_buffer()<cr>", desc = "Reset Buffer" },
		{ "<leader>gs", "<cmd>lua require 'gitsigns'.stage_hunk()<cr>", desc = "Stage Hunk" },
		{ "<leader>gu", "<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>", desc = "Undo Stage Hunk" },
		{ "<leader>go", "<cmd>Telescope git_status<cr>", desc = "Open Changed File" },
		{ "<leader>gb", "<cmd>Telescope git_branches<cr>", desc = "Checkout Branch" },
		{ "<leader>gc", "<cmd>Telescope git_commites<cr>", desc = "Checkout Commit" },
		{ "<leader>gd", "<cmd>Gitsigns diffthis HEAD<cr>", desc = "Diff" },
		-- LSP group
		{ "<leader>l", group = "LSP" },
		{ "<leader>la", require("actions-preview").code_actions, desc = "Code Action" },
		{ "<leader>ld", "<cmd>Telescope diagnostics bufnr=0<cr>", desc = "Current File Diagnostics" },
		{ "<leader>lw", "<cmd>Telescope diagnostics<cr>", desc = "Workspace Diagnostics" },
		{ "<leader>li", "<cmd>LspInfo<cr>", desc = "Info" },
		{ "<leader>lI", "<cmd>LspInstallInfo<cr>", desc = "Installer Info" },
		{ "<leader>lj", "<cmd>lua vim.diagnostic.goto_next()<CR>", desc = "Next Diagnostics" },
		{ "<leader>lk", "<cmd>lua vim.diagnostic.goto_prev()<CR>", desc = "Prev Diagnostics" },
		{ "<leader>lf", "<cmd>lua vim.lsp.buf.format()<cr>", desc = "Format" },
		{ "<leader>ll", "<cmd>lua vim.lsp.codelens.run()<cr>", desc = "CodeLens Action" },
		{ "<leader>lq", "<cmd>lua vim.diagnostic.setloclist()<cr>", desc = "Quickfix" },
		{ "<leader>lr", "<cmd>lua vim.lsp.buf.rename()<cr>", desc = "Rename" },
		{ "<leader>ls", "<cmd>Telescope lsp_document_symbols<cr>", desc = "Document Symbols" },
		{ "<leader>lS", "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>", desc = "Workspace Symbols" },
		{ "<leader>lo", "<cmd>Outline<cr>", desc = "Outline" },
		-- Search group
		{ "<leader>s", group = "Search" },
		{ "<leader>sf", "<cmd>Telescope find_files<cr>", desc = "Files" },
		{
			"<leader>sb",
			"<cmd>lua require('telescope.builtin').buffers(require('telescope.themes').get_dropdown{previewer = true})<cr>",
			desc = "Buffers",
		},
		{ "<leader>sr", "<cmd>Telescope resume<cr>", desc = "Resume" },
		{ "<leader>st", "<cmd>Telescope live_grep<cr>", desc = "Text" },
		{ "<leader>su", "<cmd>Telescope undo<cr>", desc = "Undo History" },
		{ "<leader>sc", "<cmd>Telescope colorscheme<cr>", desc = "Colorschemes" },
		{ "<leader>sC", "<cmd>Telescope commands<cr>", desc = "Commands" },
		{ "<leader>sh", "<cmd>Telescope help_tags<cr>", desc = "Help" },
		{ "<leader>sm", "<cmd>Telescope marks<cr>", desc = "Marks" },
		{ "<leader>sM", "<cmd>Telescope man_pages<cr>", desc = "Man Pages" },
		{ "<leader>so", "<cmd>Telescope oldfiles<cr>", desc = "Old Files" },
		{ "<leader>sR", "<cmd>Telescope registers<cr>", desc = "Registers" },
		{ "<leader>sk", "<cmd>Telescope keymaps<cr>", desc = "Keymaps" },
		-- LaTeX group
		{ "<leader>L", group = "LaTeX" },
		{ "<leader>Lb", "<cmd>TexlabBuild<cr>", desc = "Build" },
		{ "<leader>Lp", "<cmd>TexlabForward<cr>", desc = "Preview" },
	})
	wk.setup({
		preset = "modern",
		delay = 500,
		-- layout = {
		-- 	width = { min = 20 }, -- min and max width of the columns
		-- 	spacing = 3, -- spacing between columns
		-- 	align = "right", -- align columns left, center or right
		-- },
		icons = {
			rules = false,
		},
	})
end

return {
	"folke/which-key.nvim",
	-- lazy = false,
	event = "VeryLazy",
	-- init = function()
	-- 	vim.o.timeout = true
	-- 	vim.o.timeoutlen = 500
	-- end,
	config = config,
}
