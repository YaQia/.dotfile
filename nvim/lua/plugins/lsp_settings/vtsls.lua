local vue_language_server_path = "/usr/lib/node_modules/@vue/language-server"
local vue_plugin = {
	name = "@vue/typescript-plugin",
	location = vue_language_server_path,
	languages = { "vue" },
	configNamespace = "typescript",
}
return {
	settings = {
		vtsls = {
			tsserver = {
				globalPlugins = {
					vue_plugin,
				},
			},
		},
	},
	on_attach = function(client, bufnr)
		if vim.bo[bufnr].filetype == "vue" then
			client.server_capabilities.semanticTokensProvider = nil
		end
	end,
	filetypes = { "typescript", "javascript", "vue" },
}
