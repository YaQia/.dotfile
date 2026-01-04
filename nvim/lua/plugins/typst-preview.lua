return {
	"chomosuke/typst-preview.nvim",
	ft = "typst",
	dependencies = {
		"neovim/nvim-lspconfig",
	},
	opts = {
		dependencies_bin = {
			["tinymist"] = vim.fn.exepath("tinymist"),
			["websocat"] = vim.fn.exepath("websocat"),
		},
		extra_args = function(path_of_main_file, _, _)
			local folders = vim.lsp.buf.list_workspace_folders()
			local font_path = "--font-path="
			if folders ~= nil and #folders > 0 then
				font_path = font_path .. folders[1]
			else
				font_path = font_path .. vim.fn.getcwd()
			end
			return { font_path }
		end,
		get_root = function(path_of_main_file)
			local folders = vim.lsp.buf.list_workspace_folders()
			if folders ~= nil and #folders > 0 then
				return folders[1]
			end
			-- return vim.fn.fnamemodify(path_of_main_file, ":p:h")
			return vim.fn.getcwd()
		end,
	},
}
