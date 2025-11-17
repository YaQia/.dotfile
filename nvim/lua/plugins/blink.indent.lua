return {
	"saghen/blink.indent",
	lazy = false,
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
