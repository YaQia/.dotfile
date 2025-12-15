return {
	"olimorris/codecompanion.nvim",
	-- version = "v17.33.0",
	config = function()
		require("codecompanion").setup({
			opts = {
				language = "Chinese",
			},
			adapters = {
				http = {
					openrouter = function()
						return require("codecompanion.adapters").extend("openai_compatible", {
							env = {
								url = "https://openrouter.ai/api", -- optional: default value is ollama url http://127.0.0.1:11434
								api_key = "OPENROUTER_API_KEY", -- optional: if your endpoint is authenticated
								chat_url = "/v1/chat/completions", -- optional: default value, override if different
							},
							schema = {
								model = {
									default = "deepseek/deepseek-chat-v3-0324:free", -- define llm model to be used
								},
							},
						})
					end,
					deepseek = function()
						return require("codecompanion.adapters").extend("deepseek", {
							env = {
								api_key = "DEEPSEEK_API_KEY",
							},
							schema = {
								model = {
									default = "deepseek-chat",
									choices = {
										["deepseek-reasoner"] = { opts = { can_reason = true } },
										"deepseek-chat",
									},
								},
							},
						})
					end,
					siliconflow = function()
						return require("codecompanion.adapters").extend("openai_compatible", {
							env = {
								url = "https://api.siliconflow.cn",
								api_key = "SILICONFLOW_API_KEY",
							},
							schema = {
								model = {
									default = "deepseek-ai/DeepSeek-R1",
									choices = {
										["deepseek-ai/DeepSeek-R1"] = { opts = { can_reason = true } },
										"Pro/deepseek-ai/DeepSeek-V3",
									},
								},
							},
						})
					end,
					aliyun = function()
						return require("codecompanion.adapters").extend("openai_compatible", {
							env = {
								url = "https://dashscope.aliyuncs.com/compatible-mode",
								api_key = "ALIYUN_API_KEY",
							},
							schema = {
								model = {
									default = "deepseek-r1",
									choices = {
										["deepseek-r1"] = { opts = { can_reason = true } },
										"deepseek-v3",
									},
								},
							},
						})
					end,
				},
			},
			strategies = {
				chat = {
					adapter = "deepseek",
					-- roles = {
					-- 	user = "yaqia",
					-- },
				},
				inline = {
					adapter = "deepseek",
				},
			},
			display = {
				chat = {
					-- Options to customize the UI of the chat buffer
					window = {
						layout = "vertical", -- float|vertical|horizontal|buffer
						position = "right", -- left|right|top|bottom (nil will default depending on vim.opt.plitright|vim.opt.splitbelow)
						border = "rounded",
						height = 0.8,
						width = 0.4,
						relative = "editor",
						full_height = false, -- when set to false, vsplit will be used to open the chat buffer vs. botright/topleft vsplit
						opts = {
							breakindent = true,
							cursorcolumn = false,
							cursorline = true,
							foldcolumn = "0",
							linebreak = true,
							list = false,
							number = false, -- these opts are vim inner options
							relativenumber = false,
							-- numberwidth = 1,
							signcolumn = "no",
							spell = false,
							wrap = true,
						},
					},
				},
				diff = {
					enabled = true,
					close_chat_at = 240, -- Close an open chat buffer if the total columns of your display are less than...
					layout = "vertical", -- vertical|horizontal split for default provider
					opts = { "internal", "filler", "closeoff", "algorithm:patience", "followwrap", "linematch:120" },
					provider = "mini_diff", -- default|mini_diff
				},
			},
			extensions = {
				history = {
					enabled = true,
					opts = {
						-- Keymap to open history from chat buffer (default: gh)
						keymap = "gh",
						-- Automatically generate titles for new chats
						auto_generate_title = true,
						---On exiting and entering neovim, loads the last chat on opening chat
						continue_last_chat = false,
						---When chat is cleared with `gx` delete the chat from history
						delete_on_clearing_chat = false,
						-- Picker interface ("telescope", "snacks" or "default")
						picker = "snacks",
						---Enable detailed logging for history extension
						enable_logging = false,
						---Directory path to save the chats
						dir_to_save = vim.fn.stdpath("data") .. "/codecompanion-history",
						-- Save all chats by default
						auto_save = true,
						-- Keymap to save the current chat manually
						save_chat_keymap = "sc",
					},
				},
			},
			-- opts = {
			-- 	system_prompt = function(opts)
			-- 		local prompt = {
			-- 			[[You are an AI programming assistant named "CodeCompanion". You are currently plugged in to the Neovim text editor on a user's machine.]],
			-- 			[[]],
			-- 			[[Your core tasks include:]],
			-- 			[[- Answering general programming questions.]],
			-- 			[[- Explaining how the code in a Neovim buffer works.]],
			-- 			[[- Reviewing the selected code in a Neovim buffer.]],
			-- 			[[- Generating unit tests for the selected code.]],
			-- 			[[- Proposing fixes for problems in the selected code.]],
			-- 			[[- Scaffolding code for a new workspace.]],
			-- 			[[- Finding relevant code to the user's query.]],
			-- 			[[- Proposing fixes for test failures.]],
			-- 			[[- Answering questions about Neovim.]],
			-- 			[[- Running tools.]],
			-- 			[[]],
			-- 			[[You must:]],
			-- 			[[- Follow the user's requirements carefully and to the letter.]],
			-- 			[[- Keep your answers short and impersonal, especially if the user responds with context outside of your tasks.]],
			-- 			[[- Minimize other prose.]],
			-- 			[[- Use Markdown formatting in your answers.]],
			-- 			[[- Include the programming language name at the start of the Markdown code blocks.]],
			-- 			[[- Avoid including line numbers in code blocks.]],
			-- 			[[- Avoid wrapping the whole response in triple backticks.]],
			-- 			[[- Only return code that's relevant to the task at hand. You may not need to return all of the code that the user has shared.]],
			-- 			[[- Use actual line breaks instead of '\n' in your response to begin new lines.]],
			-- 			[[- Use '\n' only when you want a literal backslash followed by a character 'n'.]],
			-- 			[[- All non-code responses must be in %s.]],
			-- 			[[- Use Chinese to response.]],
			-- 			[[]],
			-- 			[[When given a task:]],
			-- 			[[1. Think step-by-step and describe your plan for what to build in pseudocode, written out in great detail, unless asked not to do so.]],
			-- 			[[2. Output the code in a single code block, being careful to only return relevant code.]],
			-- 			[[3. You should always generate short suggestions for the next user turns that are relevant to the conversation.]],
			-- 			[[4. You can only give one reply for each conversation turn.]],
			-- 		}
			-- 	end,
			-- },
		})
		-- disable minidiff for git lines
		vim.g.minidiff_disable = true
		-- Expand 'cc' into 'CodeCompanion' in the command line
		vim.cmd([[cab ai CodeCompanion]])
	end,
	init = function()
		require("plugins.codecompanion.fidget-spinner"):init()
	end,
	-- lazy = false,
	event = "VeryLazy",
	dependencies = {
		{
			"j-hui/fidget.nvim",
			lazy = false,
			opts = {
				progress = { display = { done_icon = "󰦕" } },
			},
		},
		{
			"echasnovski/mini.diff",
			version = false,
			lazy = true,
			opts = {
				-- view = {
				-- 	style = "sign",
				-- 	signs = {
				-- 		add = "▎",
				-- 		change = "▎",
				-- 		delete = "󰐊",
				-- 	},
				-- },
			},
		},
		"ravitemer/codecompanion-history.nvim",
		{
			"MeanderingProgrammer/render-markdown.nvim",
			ft = { "codecompanion" },
		},
	},
}
