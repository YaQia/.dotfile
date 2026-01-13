-- enable cache to speed up nvim load
vim.loader.enable()
-- this should be can for each computer
-- vim.g.node_host_prog = "/home/ethan/.npm-global/bin/neovim-node-host"
-- disable netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.g.tex_flavor = "latex"
vim.g.clipboard = "osc52"

local o = vim.opt

-- basic configs
-- border of windows by default (this is dangerous)
-- o.winborder = 'rounded'
o.clipboard = "unnamedplus"
o.completeopt = { "menuone", "noselect" } -- completion will pop up when there is only one match
o.conceallevel = 0 -- no hide for ``
o.fileencoding = "utf-8"
o.showmode = false -- use plugins to show mode
o.mouse = "a"
o.mousemoveevent = true
o.showtabline = 1 -- 2 means always
o.sessionoptions = "curdir,folds,globals,help,tabpages,terminal,winsize"
o.showcmd = false
o.cursorline = true -- highlight the cursor line
o.number = true
o.relativenumber = true
-- o.statuscolumn = "%@SignCb@%s%=%T%@NumCb@%r│%T"
o.laststatus = 3 -- means statuscolumn will only on the bottom
o.tabstop = 4
o.shiftwidth = 4
o.softtabstop = 4
o.expandtab = true
o.smartindent = true
o.splitbelow = true -- force window to be splited into the bottom
o.splitright = true
o.wrap = false -- display lines as one long line
vim.api.nvim_create_augroup("DocTypeSettings", { clear = true })
vim.api.nvim_create_autocmd("FileType", {
	group = "DocTypeSettings",

	-- 当文件类型是 latex, markdown, 或 typst 时触发
	pattern = { "tex", "latex", "markdown", "md", "typst", "tss" },

	-- 执行的命令：设置 wrap 选项为 true
	-- vim.opt_local 用于只在当前缓冲区设置选项，这是最佳实践
	callback = function()
		vim.opt_local.wrap = true
		-- vim.opt_local.textwidth = 80 -- 设置文本宽度（配合 wrap 可能有用）
	end,
})
o.swapfile = false
o.backup = false
-- o.undodir = os.getenv("HOME") .. "/.vim/undodir"
o.undofile = true
o.hlsearch = true
o.incsearch = true
o.termguicolors = true
o.scrolloff = 8
o.sidescrolloff = 8 -- horizontal scrolling offset
o.numberwidth = 3
o.signcolumn = "yes"
o.updatetime = 300
o.whichwrap:append("hl") -- I only use hl now
-- o.iskeyword:append("-")                -- I don't like it, it is dangerous
-- o.formatoptions:remove("cro")
o.jumpoptions = "stack" -- helps jumps out of the definition without too many C-o
-- folding
-- o.foldcolumn = "0" -- '0' is not bad
-- o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
-- o.foldlevelstart = 99
-- o.foldenable = true
-- o.foldmethod = "expr"
-- o.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]
-- o.foldexpr = "v:lua.vim.treesitter.foldexpr()"
-- colorscheme
-- vim.cmd.colorscheme("darkplus")

-- lsp configs
-- local signs = {
-- 	{ name = "DiagnosticSignError", text = "" },
-- 	{ name = "DiagnosticSignWarn", text = "" },
-- 	{ name = "DiagnosticSignHint", text = "󰌶" },
-- 	{ name = "DiagnosticSignInfo", text = "" },
-- }

-- for _, sign in ipairs(signs) do
-- 	vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
-- end

local config = {
	-- disable virtual text
	virtual_text = true,
	-- show signs
	signs = {
		text = {
			[vim.diagnostic.severity.ERROR] = "",
			[vim.diagnostic.severity.WARN] = "",
			[vim.diagnostic.severity.HINT] = "󰌶",
			[vim.diagnostic.severity.INFO] = "",
		},
	},
	update_in_insert = false,
	underline = true,
	severity_sort = true,
	float = {
		focusable = false,
		style = "minimal",
		border = "rounded",
		source = "always",
		header = "",
		prefix = "",
	},
}

vim.diagnostic.config(config)

vim.filetype.add({
	extension = {
		mdx = "mdx",
	},
})

vim.treesitter.language.register("markdown", { "mdx" })

-- lsp settings
vim.lsp.set_log_level("off")
-- vim.lsp.handlers["textDocument/hover"] = vim.lsp.buf.hover({
-- 	border = "rounded",
-- })
--
-- vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.buf.signature_help({
-- 	border = "rounded",
-- })

-- vim.cmd[[ autocmd BufRead,BufNewFile *.drl set filetype=drools ]]
