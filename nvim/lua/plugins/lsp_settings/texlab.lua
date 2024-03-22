return {
	settings = {
		texlab = {
			auxDirectory = ".",
			bibtexFormatter = "texlab",
			build = {
				args = { "-xelatex", "-interaction=nonstopmode", "-synctex=1", "%f" },
				executable = "latexmk",
				forwardSearchAfter = false,
				onSave = false,
			},
			chktex = {
				onEdit = true,
				onOpenAndSave = true,
			},
			diagnosticsDelay = 300,
			formatterLineLength = 80,
			forwardSearch = {
				executable = "zathura",
				args = {
					"--synctex-editor-command",
					[[/home/ethan/.local/share/nvim/lazy/nvim-texlabconfig/nvim-texlabconfig -file '%%%{input}' -line %%%{line} -server ]]
						.. vim.v.servername,
					"--synctex-forward",
					"%l:1:%f",
					"%p",
				},
			},
			latexFormatter = "latexindent",
			latexindent = {
				modifyLineBreaks = true,
				["local"] = "/home/ethan/.latexindent.yaml",
			},
		},
	},
}
