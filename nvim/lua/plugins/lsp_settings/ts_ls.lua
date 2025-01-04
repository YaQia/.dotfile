local volar_path = "/usr/lib/node_modules/@vue/language-server"
-- local vue_language_server_path = '/path/to/@vue/language-server'

-- local lspconfig = require('lspconfig')

return {
	init_options = {
		plugins = {
			{
				name = "@vue/typescript-plugin",
				location = volar_path,
				languages = { "vue" },
			},
		},
	},
	settings = {
		typescript = {
			inlayHints = {
				includeInlayParameterNameHints = "all",
				includeInlayParameterNameHintsWhenArgumentMatchesName = true,
				includeInlayFunctionParameterTypeHints = true,
				includeInlayVariableTypeHints = true,
				includeInlayVariableTypeHintsWhenTypeMatchesName = true,
				includeInlayPropertyDeclarationTypeHints = true,
				includeInlayFunctionLikeReturnTypeHints = true,
				includeInlayEnumMemberValueHints = true,
			},
		},
	},
	filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue" },
}
