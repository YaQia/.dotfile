local ensure_installed = {
	"bash",
	"c",
	"cpp",
	"rust",
	"java",
	"javascript",
	"python",
	"go",
	"gomod",
	"lua",
	"vim",
	"vimdoc",
	"query",
	"html",
	"css",
	"fish",
	"doxygen",
	"comment",
	"luadoc",
	"regex",
	"yaml",
	"toml",
	"ebnf",
	"gitcommit",
	"latex",
	"markdown",
	"git_rebase",
}
local filetypes = {
	"bash",
	"c",
	"cpp",
	"rust",
	"java",
	"javascript",
	"python",
	"go",
	"lua",
	"vim",
	"help",
	"html",
	"css",
	"fish",
	"yaml",
	"toml",
	"ebnf",
	"gitcommit",
	"latex",
	"markdown",
	"gitrebase",
}
local opts = {
	-- A list of parser names, or "all" (the five listed parsers should always be installed)
	-- ensure_installed = {
	--   "c",
	--   "cpp",
	--   "rust",
	--   "java",
	--   "javascript",
	--   "python",
	--   "go",
	--   "gomod",
	--   "lua",
	--   "vim",
	--   "vimdoc",
	--   "query",
	--   "html",
	--   "css",
	--   "bash",
	--   "fish",
	--   "doxygen",
	--   "comment",
	--   "luadoc",
	--   "regex",
	--   "yaml",
	--   "toml",
	-- },
	-- Install parsers synchronously (only applied to `ensure_installed`)
	sync_install = false,
	-- Automatically install missing parsers when entering buffer
	-- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
	auto_install = true,
	-- List of parsers to ignore installing (or "all")
	ignore_install = { "latex" },
	---- If you need to change the installation directory of the parsers (see -> Advanced Setup)
	-- parser_install_dir = "/some/path/to/store/parsers", -- Remember to run vim.opt.runtimepath:append("/some/path/to/store/parsers")!
	highlight = {
		enable = true,
		-- NOTE: these are the names of the parsers and not the filetype. (for example if you want to
		-- disable highlighting for the `tex` filetype, you need to include `latex` in this list as this is
		-- the name of the parser)
		-- list of language that will be disabled
		-- Or use a function for more flexibility, e.g. to disable slow treesitter highlight for large files
		-- disable = function(lang, buf)
		-- 	local max_filesize = 100 * 1024 -- 100 KB
		-- 	local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
		-- 	if ok and stats and stats.size > max_filesize then
		-- 		return true
		-- 	end
		-- end,
		-- Setting this to true will run `:h syntax` and tree-sitter at the same time.
		-- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
		-- Using this option may slow down your editor, and you may see some duplicate highlights.
		-- Instead of true it can also be a list of languages
		additional_vim_regex_highlighting = false,
	},
}
return {
	"nvim-treesitter/nvim-treesitter",
	dependencies = {
		"nvim-treesitter/nvim-treesitter-textobjects",
	},
	branch = "main",
	build = ":TSUpdate",
	lazy = false,
	-- event = "VimEnter",
	config = function()
		require("nvim-treesitter").install(ensure_installed)
		vim.api.nvim_create_autocmd("FileType", {
			pattern = filetypes,
			callback = function()
				-- syntax highlighting, provided by Neovim
				vim.treesitter.start()
				-- folds, provided by Neovim
				vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
				vim.wo.foldmethod = "expr"
				-- indentation, provided by nvim-treesitter
				vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
			end,
		})
	end,
}
