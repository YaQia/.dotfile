return {
	-- "typescript", "javascript", "javascriptreact", "typescriptreact",
	-- filetypes = { "vue" },
	init_options = {
		vue = {
			hybridMode = true,
		},
		-- NOTE: This might not be needed. Uncomment if you encounter issues.

		-- typescript = {
		--   tsdk = vim.fn.getcwd() .. "/node_modules/typescript/lib",
		-- },
	},
	-- settings = {
	-- 	typescript = {
	-- 		inlayHints = {
	-- 			enumMemberValues = {
	-- 				enabled = true,
	-- 			},
	-- 			functionLikeReturnTypes = {
	-- 				enabled = true,
	-- 			},
	-- 			propertyDeclarationTypes = {
	-- 				enabled = true,
	-- 			},
	-- 			parameterTypes = {
	-- 				enabled = true,
	-- 				suppressWhenArgumentMatchesName = true,
	-- 			},
	-- 			variableTypes = {
	-- 				enabled = true,
	-- 			},
	-- 		},
	-- 	},
	-- },
}
