local config = function()
	local wk = require("which-key")

	local remote_sshfs_api = require("remote-sshfs.api")
	Snacks.toggle.animate():map("<leader>ua")
	Snacks.toggle.diagnostics():map("<leader>ud")
	Snacks.toggle.dim():map("<leader>uD")
	Snacks.toggle.indent():map("<leader>ui")
	Snacks.toggle.inlay_hints():map("<leader>uI")
	Snacks.toggle.line_number():map("<leader>ul")
	Snacks.toggle.profiler():map("<leader>up")
	Snacks.toggle.scroll():map("<leader>us")
	Snacks.toggle.treesitter():map("<leader>ut")
	Snacks.toggle.words():map("<leader>uw")
	Snacks.toggle.zen():map("<leader>uz")
	Snacks.toggle.zoom():map("<leader>uZ")
	wk.add({
		{
			mode = { "x" },
			{ "leader>l", group = "LSP" },
			{ "<leader>la", "<cmd>lua vim.lsp.buf.code_action()<cr>", desc = "Code Action" },
			{ "<leader>a", group = "AI" },
			{ "<leader>ae", "<cmd>CodeCompanion /explain<cr>", desc = "Explain Selected Codes" },
			{ "<leader>af", "<cmd>CodeCompanion /fix<cr>", desc = "Fix Selected Codes" },
		},
		-- default mode is Normal, no need to define
		-- Single character
		{
			"<leader>;",
			"<cmd>Alpha<cr>",
			desc = "Dashboard",
		},
		{
			"<leader>/",
			"<cmd>Telescope current_buffer_fuzzy_find<cr>",
			desc = "Current Buffer Search",
		},
		{
			"<leader>e",
			"<cmd>lua require('oil').toggle_float()<cr>",
			desc = "File Explorer",
		},
		{
			"<leader>w",
			"<cmd>w!<cr>",
			desc = "Save",
		},
		{
			"<leader>c",
			-- "<cmd>confirm bdelete<cr>",
			"<cmd>lua vim.api.nvim_buf_delete(0, {})<cr>",
			desc = "Close Buffer",
		},
		{
			"<leader>q",
			"<cmd>confirm q<cr>",
			desc = "Quit",
		},
		{
			"<leader>Q",
			"<cmd>confirm qa<cr>",
			desc = "Quit All",
		},
		-- Tab group
		{ "<leader>t", group = "Tabs" },
		{
			"<leader>tn",
			"<cmd>tabnew<cr>",
			desc = "New Tab",
		},
		{
			"<leader>tc",
			"<cmd>tabclose<cr>",
			desc = "Close Tab",
		},
		{
			"<leader>to",
			"<cmd>tabonly<cr>",
			desc = "Close Other Tabs",
		},
		{ "<leader>tf", "<cmd>tabfirst<cr>", desc = "First Tab" },
		{ "<leader>tl", "<cmd>tablast<cr>", desc = "Last Tab" },
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
		{
			"<leader>go",
			"<cmd>Telescope git_status<cr>",
			desc = "Open Changed File",
		},
		{ "<leader>gb", "<cmd>Telescope git_branches<cr>", desc = "Checkout Branch" },
		{ "<leader>gc", "<cmd>Telescope git_commits<cr>", desc = "Checkout Commit" },
		{ "<leader>gd", "<cmd>Gitsigns diffthis HEAD<cr>", desc = "Diff" },
		-- LSP group
		{ "<leader>l", group = "LSP" },
		{ "<leader>la", "<cmd>lua vim.lsp.buf.code_action()<cr>", desc = "Code Action" },
		{
			"<leader>ld",
			"<cmd>Telescope diagnostics bufnr=0<cr>",
			desc = "Current File Diagnostics",
		},
		{
			"<leader>lw",
			"<cmd>Telescope diagnostics<cr>",
			desc = "Workspace Diagnostics",
		},
		{
			"<leader>li",
			function()
				vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ 0 }), { 0 })
			end,
			desc = "Toggle Inlay Hint",
		},
		{ "<leader>lI", "<cmd>LspInfo<cr>", desc = "Info" },
		{ "<leader>lj", "<cmd>lua vim.diagnostic.goto_next()<CR>", desc = "Next Diagnostics" },
		{ "<leader>lk", "<cmd>lua vim.diagnostic.goto_prev()<CR>", desc = "Prev Diagnostics" },
		{ "<leader>lf", "<cmd>lua vim.lsp.buf.format()<cr>", desc = "Format" },
		{ "<leader>ll", "<cmd>lua vim.lsp.codelens.run()<cr>", desc = "CodeLens Action" },
		{ "<leader>lq", "<cmd>lua vim.diagnostic.setloclist()<cr>", desc = "Quickfix" },
		{ "<leader>lr", "<cmd>lua vim.lsp.buf.rename()<cr>", desc = "Rename" },
		{ "<leader>ls", "<cmd>Telescope lsp_document_symbols<cr>", desc = "Document Symbols" },
		{ "<leader>lS", "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>", desc = "Workspace Symbols" },
		{ "<leader>lo", "<cmd>AerialToggle<cr>", desc = "Outline" },
		-- Search group
		{ "<leader>s", group = "Search" },
		{ "<leader>sf", "<cmd>Telescope find_files<cr>", desc = "Files" },
		{
			"<leader>sb",
			"<cmd>lua require('telescope.builtin').buffers(require('telescope.themes').get_dropdown{previewer = true, sort_mru = true})<cr>",
			desc = "Buffers",
		},
		{ "<leader>sr", "<cmd>Telescope resume<cr>", desc = "Resume" },
		{ "<leader>st", "<cmd>Telescope live_grep<cr>", desc = "Text" },
		{ "<leader>su", "<cmd>Telescope undo<cr>", desc = "Undo History" },
		{ "<leader>sc", "<cmd>Telescope colorscheme<cr>", desc = "Colorschemes" },
		{ "<leader>sC", "<cmd>Telescope commands<cr>", desc = "Commands" },
		{ "<leader>sm", "<cmd>Telescope marks<cr>", desc = "Marks" },
		{ "<leader>sM", "<cmd>Telescope man_pages<cr>", desc = "Man Pages" },
		{ "<leader>so", "<cmd>Telescope oldfiles<cr>", desc = "Old Files" },
		{ "<leader>sR", "<cmd>Telescope registers<cr>", desc = "Registers" },
		{ "<leader>sk", "<cmd>Telescope keymaps<cr>", desc = "Keymaps" },
		-- remote group
		{ "<leader>r", group = "Remote" },
		{ "<leader>rc", remote_sshfs_api.connect, desc = "Connect" },
		{ "<leader>rd", remote_sshfs_api.disconnect, desc = "Disconnect" },
		{ "<leader>re", remote_sshfs_api.edit, desc = "Edit" },
		-- ui group
		{ "<leader>u", group = "UI" },
		{ "<leader>a", group = "AI" },
		{ "<leader>ac", "<cmd>CodeCompanionChat<cr>", desc = "Chat" },
		{ "<leader>aa", "<cmd>CodeCompanionActions<cr>", desc = "Actions" },
		{ "<leader>ah", "<cmd>CodeCompanionHistory<cr>", desc = "History" },
	})
	wk.setup({
		preset = "modern",
		delay = function(ctx)
			-- other mode
			if ctx.mode ~= "n" then
				return 2000
			end
			-- normal mode
			return 500
		end,
		layout = {
			width = { min = 8 }, -- min and max width of the columns
			spacing = 6, -- spacing between columns
			align = "center", -- align columns left, center or right
		},
		icons = {
			rules = false,
			keys = { Space = "󱁐" },
		},
		win = {
			no_overlap = false,
		},
	})
end

return {
	"folke/which-key.nvim",
	-- lazy = false,
	-- keys = {"<leader>", "<cmd>WhichKey <leader><cr>", desc = "Which Key"},
	event = "VeryLazy",
	-- init = function()
	-- 	vim.o.timeout = true
	-- 	vim.o.timeoutlen = 500
	-- end,
	config = config,
}
