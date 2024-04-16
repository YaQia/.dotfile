local opts = {
	connections = {
		sshfs_args = { -- arguments to pass to the sshfs command
			"-o idmap=user",
		},
	},
	ui = {
		confirm = {
			connect = false, -- prompt y/n when host is selected to connect to
			-- change_dir = false, -- prompt y/n to change working directory on connection (only applicable if handlers.on_connect.change_dir is enabled)
		},
	},
}

return {
	"nosduco/remote-sshfs.nvim",
	event = "VeryLazy",
	dependencies = { "nvim-telescope/telescope.nvim" },
	opts = opts,
}
