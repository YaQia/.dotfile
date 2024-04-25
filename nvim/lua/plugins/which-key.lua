_G.whichkeyTex = function()
	local wk = require("which-key")
	local opts = {
		mode = "n", -- NORMAL mode
		prefix = "<leader>",
		buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
		silent = true, -- use `silent` when creating keymaps
		noremap = true, -- use `noremap` when creating keymaps
	}
	local keymaps = {
		L = {
			name = "LaTeX",
			b = { "<cmd>TexlabBuild<cr>", "Build" },
			p = { "<cmd>TexlabForward<cr>", "Preview" },
		},
	}
	wk.register(keymaps, opts)
end

local config = function()
	local wk = require("which-key")
	-- all options are listed here, some may be useful
	wk.setup({
		-- plugins = {
		--      marks = true, -- shows a list of your marks on ' and `
		--      registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
		--      -- the presets plugin, adds help for a bunch of default keybindings in Neovim
		--      -- No actual key bindings are created
		--      spelling = {
		--              enabled = true, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
		--              suggestions = 20, -- how many suggestions should be shown in the list?
		--      },
		--      presets = {
		--              operators = true, -- adds help for operators like d, y, ...
		--              motions = true, -- adds help for motions
		--              text_objects = true, -- help for text objects triggered after entering an operator
		--              windows = true, -- default bindings on <c-w>
		--              nav = true, -- misc bindings to work with windows
		--              z = true, -- bindings for folds, spelling and others prefixed with z
		--              g = true, -- bindings for prefixed with g
		--      },
		-- },
		-- add operators that will trigger motion and text object completion
		-- to enable all native operators, set the preset / operators plugin above
		-- operators = { gc = "Comments" },
		key_labels = {
			-- override the label used to display some keys. It doesn't effect WK in any other way.
			-- For example:
			["<space>"] = "SPC",
			["<cr>"] = "RET",
			["<tab>"] = "TAB",
		},
		-- motions = {
		--      count = true,
		-- },
		window = {
			border = "rounded", -- none, single, double, shadow
			-- position = "bottom", -- bottom, top
			-- margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]. When between 0 and 1, will be treated as a percentage of the screen size.
			-- padding = { 1, 2, 1, 2 }, -- extra window padding [top, right, bottom, left]
			-- winblend = 0, -- value between 0-100 0 for fully opaque and 100 for fully transparent
			-- zindex = 1000, -- positive value to position WhichKey above other floating windows.
		},
		layout = {
			--      height = { min = 4, max = 25 }, -- min and max height of the columns
			width = { min = 30, max = 80 }, -- min and max width of the columns
			--      spacing = 3, -- spacing between columns
			-- align = "left", -- align columns left, center or right
		},
		ignore_missing = true, -- enable this to hide mappings for which you didn't specify a label
		-- hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "^:", "^ ", "^call ", "^lua " }, -- hide mapping boilerplate
		-- show_help = true, -- show a help message in the command line for using WhichKey
		-- show_keys = true, -- show the currently pressed key and its label as a message in the command line
		-- triggers = "auto", -- automatically setup triggers
		-- triggers = {"<leader>"} -- or specifiy a list manually
		-- list of triggers, where WhichKey should not wait for timeoutlen and show immediately
		-- triggers_nowait = {
		--      -- marks
		--      "`",
		--      "'",
		--      "g`",
		--      "g'",
		--      -- registers
		--      '"',
		--      "<c-r>",
		--      -- spelling
		--      "z=",
		-- },
		triggers_blacklist = {
			--      -- list of mode / prefixes that should never be hooked by WhichKey
			--      -- this is mostly relevant for keymaps that start with a native binding
			--      i = { "j", "k" },
			--      v = { "j", "k" },
			n = { "v" },
		},
		-- disable the WhichKey popup for certain buf types and file types.
		-- Disabled by default for Telescope
		-- disable = {
		--      buftypes = {},
		--      filetypes = {},
		-- },
	})
	local opts = {
		mode = "n", -- NORMAL mode
		prefix = "<leader>",
		buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
		silent = true, -- use `silent` when creating keymaps
		noremap = true, -- use `noremap` when creating keymaps
	}
	local keymaps = {
		[";"] = { "<cmd>Alpha<cr>", "Dashboard" },
		["/"] = { "<cmd>lua require('Comment.api').toggle.linewise()<cr>", "Comment toggle linewise" },
		["?"] = { "<cmd>lua require('Comment.api').toggle.blockwise()<cr>", "Comment toggle blockwise" },
		["e"] = { "<cmd>lua require('oil').toggle_float()<cr>", "Explorer" },
		-- ["e"] = { "<cmd>lua MiniFiles.open(vim.api.nvim_buf_get_name(0))<cr>", "MiniFiles" },
		["w"] = { "<cmd>w!<CR>", "Save" },
		["q"] = { "<cmd>confirm q<cr>", "Quit" },
		["c"] = { "<cmd>bdelete!<CR>", "Close Buffer" },
		["h"] = { "<cmd>nohlsearch<CR>", "No Highlight" },
		p = {
			name = "Plugins",
			i = { "<cmd>Lazy install<cr>", "Install" },
			s = { "<cmd>Lazy sync<cr>", "Sync" },
			h = { "<cmd>Lazy show<cr>", "Home" },
			u = { "<cmd>Lazy update<cr>", "Update" },
			p = { "<cmd>Lazy profile<cr>", "Profile" },
			c = { "<cmd>Lazy clean<cr>", "Clean" },
			l = { "<cmd>Lazy log<cr>", "Log" },
		},

		g = {
			name = "Git",
			j = { "<cmd>lua require 'gitsigns'.next_hunk()<cr>", "Next Hunk" },
			k = { "<cmd>lua require 'gitsigns'.prev_hunk()<cr>", "Prev Hunk" },
			B = { "<cmd>lua require 'gitsigns'.blame_line()<cr>", "Blame" },
			p = { "<cmd>lua require 'gitsigns'.preview_hunk()<cr>", "Preview Hunk" },
			r = { "<cmd>lua require 'gitsigns'.reset_hunk()<cr>", "Reset Hunk" },
			R = { "<cmd>lua require 'gitsigns'.reset_buffer()<cr>", "Reset Buffer" },
			s = { "<cmd>lua require 'gitsigns'.stage_hunk()<cr>", "Stage Hunk" },
			u = {
				"<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>",
				"Undo Stage Hunk",
			},
			o = { "<cmd>Telescope git_status<cr>", "Open changed file" },
			b = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
			c = { "<cmd>Telescope git_commits<cr>", "Checkout commit" },
			d = {
				"<cmd>Gitsigns diffthis HEAD<cr>",
				"Diff",
			},
		},

		l = {
			name = "LSP",
			a = { "<cmd>Lspsaga code_action<cr>", "Code Action" },
			d = {
				"<cmd>Telescope diagnostics bufnr=0<cr>",
				"Document Diagnostics",
			},
			w = {
				"<cmd>Lspsaga show_workspace_diagnostics<cr>",
				"Workspace Diagnostics",
			},
			i = { "<cmd>LspInfo<cr>", "Info" },
			I = { "<cmd>LspInstallInfo<cr>", "Installer Info" },
			j = {
				"<cmd>Lspsaga diagnostic_jump_next<CR>",
				"Next Diagnostic",
			},
			k = {
				"<cmd>Lspsaga diagnostic_jump_prev<cr>",
				"Prev Diagnostic",
			},
			f = { "<cmd>lua vim.lsp.buf.format()<cr>", "Format" },
			l = { "<cmd>lua vim.lsp.codelens.run()<cr>", "CodeLens Action" },
			q = { "<cmd>lua vim.diagnostic.setloclist()<cr>", "Quickfix" },
			-- r = { "<cmd>Lspsaga rename<cr>", "Rename" },
			r = { "<cmd>lua vim.lsp.buf.rename()<cr>", "Rename" },
			s = { "<cmd>Telescope lsp_document_symbols<cr>", "Document Symbols" },
			S = {
				"<cmd>Telescope lsp_dynamic_workspace_symbols<cr>",
				"Workspace Symbols",
			},
			-- D = {
			--   "<cmd>LspStop<cr>",
			--   "Disable",
			-- },
			-- e = {
			--   "<cmd>LspStart<cr>",
			--   "Enable",
			-- },
			-- E = {
			--   "<cmd>LspRestart<cr>",
			--   "Re-enable",
			-- },
			o = {
				"<cmd>Lspsaga outline<cr>",
				"Outline",
			},
		},
		s = {
			name = "Search",
			f = { "<cmd>Telescope find_files<cr>", "Files" },
			b = {
				"<cmd>lua require('telescope.builtin').buffers(require('telescope.themes').get_dropdown{previewer = false})<cr>",
				"Buffers",
			},
			t = { "<cmd>Telescope live_grep<cr>", "Text" },
			u = { "<cmd>Telescope undo<cr>", "Undo History" },
			c = { "<cmd>Telescope colorscheme<cr>", "Colorschemes" },
			h = { "<cmd>Telescope help_tags<cr>", "Help" },
			m = { "<cmd>Telescope marks<cr>", "Marks" },
			M = { "<cmd>Telescope man_pages<cr>", "Man Pages" },
			r = { "<cmd>Telescope oldfiles<cr>", "Recently Opened Files" },
			R = { "<cmd>Telescope registers<cr>", "Registers" },
			k = { "<cmd>Telescope keymaps<cr>", "Keymaps" },
			C = { "<cmd>Telescope commands<cr>", "Commands" },
		},
		m = {
			name = "Mason",
			h = { "<cmd>Mason<cr>", "Home" },
			u = { "<cmd>MasonUninstallAll<cr>", "Uninstall All" },
		},
	}
	local vopts = {
		mode = "v", -- VISUAL mode
		prefix = "<leader>",
		buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
		silent = true, -- use `silent` when creating keymaps
		noremap = true, -- use `noremap` when creating keymaps
		nowait = true, -- use `nowait` when creating keymaps
	}
	local vkeymaps = {
		["/"] = {
			"<esc><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<cr>",
			"Comment toggle linewise (visual)",
		},
		["?"] = {
			"<esc><cmd>lua require('Comment.api').toggle.blockwise(vim.fn.visualmode())<cr>",
			"Comment toggle blockwise (visual)",
		},
		l = {
			name = "LSP",
			a = { "<cmd>Lspsaga code_action<cr>", "Code Action" },
		},
	}
	wk.register(keymaps, opts)
	wk.register(vkeymaps, vopts)
	vim.cmd([[
  autocmd FileType tex lua whichkeyTex()
  ]])
end

return {
	"folke/which-key.nvim",
	-- lazy = false,
	event = "VeryLazy",
	init = function()
		vim.o.timeout = true
		vim.o.timeoutlen = 500
	end,
	config = config,
}
