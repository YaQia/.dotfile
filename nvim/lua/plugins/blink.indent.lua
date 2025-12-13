return {
	"saghen/blink.indent",
	enabled = false,
	-- lazy = false,
	--- @module 'blink.indent'
	--- @type blink.indent.Config
	opts = {
		static = {
			char = '▏',
		},
		scope = {
			char = '▏',
			highlights = { 'LineNr' },
		}
	},
}
