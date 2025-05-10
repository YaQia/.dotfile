-- autopairs
return {
	"windwp/nvim-autopairs",
	event = "InsertEnter",
	-- opts = {
	-- 	check_ts = true,
	-- },
	config = function ()
		require("nvim-autopairs").setup({
			check_ts = true,
		})
	end,
}
