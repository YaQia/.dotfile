local config = function()
	local crates = require("crates")
	local cmp = require("cmp")
	crates.setup({
		popup = {
			border = "rounded",
		},
		lsp = {
			enabled = true,
			on_attach = function (client, bufnr)
				require("lsp_signature").on_attach({
					hint_enable = true, -- virtual hint enable
					hint_prefix = "• ",
				}, bufnr)
			end,
			actions = true,
			completion = true,
			hover = true,
		},
		completion = {
			crates = {
				enabled = true, -- disabled by default
				max_results = 8, -- The maximum number of search results to display
				min_chars = 3 -- The minimum number of charaters to type before completions begin appearing
			},
			cmp = {
				enabled = true,
			}
		}
	})

	-- vim.api.nvim_create_autocmd("BufRead", {
	-- 	group = vim.api.nvim_create_augroup("CmpSourceCargo", { clear = true }),
	-- 	pattern = "Cargo.toml",
	-- 	callback = function()
	-- 		cmp.setup.buffer({ sources = { { name = "crates" } } })
	-- 	end,
	-- })

	local function show_documentation()
		local filetype = vim.bo.filetype
		if vim.tbl_contains({ "vim", "help" }, filetype) then
			vim.cmd("h " .. vim.fn.expand("<cword>"))
		elseif vim.tbl_contains({ "man" }, filetype) then
			vim.cmd("Man " .. vim.fn.expand("<cword>"))
		elseif vim.fn.expand("%:t") == "Cargo.toml" and require("crates").popup_available() then
			require("crates").show_popup()
		else
			vim.lsp.buf.hover()
		end
	end

	vim.keymap.set("n", "K", show_documentation, { silent = true })

	local wk = require("which-key")
	wk.add({
		{ "<leader>C", group = "Crates", remap = false },
		{ "<leader>CA", crates.upgrade_all_crates, desc = "Upgrade All", remap = false },
		{ "<leader>CU", crates.upgrade_crate, desc = "Upgrade", remap = false },
		{ "<leader>Ca", crates.update_all_crates, desc = "Update All", remap = false },
		{ "<leader>Cd", crates.show_dependencies_popup, desc = "Dependencies", remap = false },
		{ "<leader>Cf", crates.show_features_popup, desc = "Features", remap = false },
		{ "<leader>Cr", crates.show_features_popup, desc = "Reload", remap = false },
		{ "<leader>Ct", crates.toggle, desc = "Toggle", remap = false },
		{ "<leader>Cu", crates.update_crate, desc = "Update", remap = false },
		{ "<leader>Cv", crates.show_versions_popup, desc = "Version", remap = false },
	})

	wk.add({
		{
			mode = { "x" },
			{ "<leader>C", group = "Crates", nowait = true, remap = false },
			{ "<leader>CU", crates.upgrade_crates, desc = "Upgrade", nowait = true, remap = false },
			{ "<leader>Cu", crates.update_crates, desc = "Update", nowait = true, remap = false },
		},
	})
end

-- Rust cargo
return {
	"saecki/crates.nvim",
	event = { "BufRead Cargo.toml" },
	dependencies = { "nvim-lua/plenary.nvim" },
	config = config,
}
