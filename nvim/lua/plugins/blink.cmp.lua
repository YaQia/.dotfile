return {
	"saghen/blink.cmp",
	-- optional: provides snippets for the snippet source
	dependencies = "rafamadriz/friendly-snippets",

	-- use a release tag to download pre-built binaries
	version = "*",
	-- AND/OR build from source, requires nightly: https://rust-lang.github.io/rustup/concepts/channels.html#working-with-nightly-rust
	-- build = 'cargo build --release',
	-- If you use nix, you can build from source using latest nightly rust with:
	-- build = 'nix run .#build-plugin',

	---@module 'blink.cmp'
	---@type blink.cmp.Config
	opts = {
		-- 'default' for mappings similar to built-in completion
		-- 'super-tab' for mappings similar to vscode (tab to accept, arrow keys to navigate)
		-- 'enter' for mappings similar to 'super-tab' but with 'enter' to accept
		-- See the full "keymap" documentation for information on defining your own keymap.
		keymap = {
			-- set to 'none' to disable the 'default' preset
			preset = "super-tab",

			["<Tab>"] = {
				"select_next",
				"snippet_forward",
				"fallback",
			},
			["<S-Tab>"] = {
				"select_prev",
				"snippet_backward",
				"fallback",
			},
			["<CR>"] = { "accept", "fallback" },
			-- disable a keymap from the preset
			["<C-e>"] = { "hide", "fallback" },
			["<C-space>"] = { "hide", "show" },

			-- show with a list of providers
			-- ["<C-space>"] = {
			-- 	function(cmp)
			-- 		cmp.show({ providers = { "snippets" } })
			-- 	end,
			-- },

			-- control whether the next command will be run when using a function
			-- ["<C-n>"] = {
			-- 	function(cmp)
			-- 		if some_condition then
			-- 			return
			-- 		end -- runs the next command
			-- 		return true -- doesn't run the next command
			-- 	end,
			-- 	"select_next",
			-- },

			-- optionally, separate cmdline keymaps
			cmdline = {
				preset = "super-tab",

				["<Tab>"] = {
					"select_next",
					"fallback",
				},
				["<S-Tab>"] = {
					"select_prev",
					"fallback",
				},
				-- ["<CR>"] = { "accept", "fallback" },
				-- disable a keymap from the preset
				["<C-e>"] = { "hide", "fallback" },
				["<C-space>"] = { "hide", "show" },

				["<CR>"] = {
					function(cmp)
						cmp.accept({
							callback = function()
								vim.api.nvim_feedkeys("\n", "n", true)
							end,
						})
					end,
					"accept",
					"fallback",
				},
			},
		},

		appearance = {
			-- Sets the fallback highlight groups to nvim-cmp's highlight groups
			-- Useful for when your theme doesn't support blink.cmp
			-- Will be removed in a future release
			use_nvim_cmp_as_default = true,
			-- Set to 'mono' for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
			-- Adjusts spacing to ensure icons are aligned
			nerd_font_variant = "mono",
		},

		-- Default list of enabled providers defined so that you can extend it
		-- elsewhere in your config, without redefining it, due to `opts_extend`
		sources = {
			default = { "lsp", "path", "snippets", "buffer" },
		},

		completion = {
			list = { selection = "auto_insert" },
			menu = {
				border = "rounded",
			},
			documentation = {
				auto_show = true,
				auto_show_delay_ms = 0,
				window = {
					border = "rounded",
				},
			},
			ghost_text = { enabled = false },
		},

		signature = { window = { border = "rounded" } },
	},
	opts_extend = { "sources.default" },
}
