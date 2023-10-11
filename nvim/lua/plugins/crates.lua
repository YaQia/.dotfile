local config = function()
	local crates = require("crates")
	local cmp = require("cmp")
	crates.setup({
		popup = {
			border = "rounded",
		},
	})

	vim.api.nvim_create_autocmd("BufRead", {
		group = vim.api.nvim_create_augroup("CmpSourceCargo", { clear = true }),
		pattern = "Cargo.toml",
		callback = function()
			cmp.setup.buffer({ sources = { { name = "crates" } } })
		end,
	})

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
	wk.register({
		C = {
			name = "Crates",
			t = { crates.toggle, "Toggle" },
			r = { crates.reload, "Reload" },
			v = { crates.show_versions_popup, "Version" },
			f = { crates.show_features_popup, "Features" },
			d = { crates.show_dependencies_popup, "Dependencies" },
			u = { crates.update_crate, "Update" },
			a = { crates.update_all_crates, "Update All" },
			U = { crates.upgrade_crate, "Upgrade" },
			A = { crates.upgrade_all_crates, "Upgrade All" },
		},
	}, {
		mode = "n", -- NORMAL mode
		prefix = "<leader>",
		buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
		silent = true, -- use `silent` when creating keymaps
		noremap = true, -- use `noremap` when creating keymaps
	})

	wk.register({
		C = {
			name = "Crates",
			u = { crates.update_crates, "Update" },
			U = { crates.upgrade_crates, "Upgrade" },
		},
	}, {
		mode = "v", -- VISUAL mode
		prefix = "<leader>",
		buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
		silent = true, -- use `silent` when creating keymaps
		noremap = true, -- use `noremap` when creating keymaps
		nowait = true, -- use `nowait` when creating keymaps
	})
end

-- Rust cargo
return {
	"saecki/crates.nvim",
	event = { "BufRead Cargo.toml" },
	dependencies = { "nvim-lua/plenary.nvim" },
	config = config,
}
