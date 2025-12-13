return {
	on_new_config = function(new_config, new_root_dir)
		new_config.cmd = {
			"tinymist",
			"lsp",
			"--font-path",
			new_root_dir,
		}
	end,
	root_markers = { ".git", "typst.toml" },
}
