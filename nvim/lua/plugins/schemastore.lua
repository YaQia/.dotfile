return {
	"b0o/schemastore.nvim",
	ft = { "yaml", "json" },
	cond = function()
		local fname = vim.api.nvim_buf_get_name(0)

		-- 禁用所有 .custom.yaml 文件
		if fname:match("%.custom%.yaml$") then
			return false
		end

		-- 只允许 json 或 yaml 类型的文件
		return true
	end,
	config = function()
		require("lspconfig").jsonls.setup({
			settings = {
				json = {
					schemas = require("schemastore").json.schemas(),
					validate = { enable = true },
				},
			},
		})
		require("lspconfig").yamlls.setup({
			settings = {
				yaml = {
					schemaStore = {
						-- You must disable built-in schemaStore support if you want to use
						-- this plugin and its advanced options like `ignore`.
						enable = false,
						-- Avoid TypeError: Cannot read properties of undefined (reading 'length')
						url = "",
					},
					schemas = require("schemastore").yaml.schemas(),
				},
			},
		})
	end,
}
