-- enable cache to speed up nvim load
vim.loader.enable()
-- this should be can for each computer
vim.g.node_host_prog = '/home/ethan/.npm-global/bin/neovim-node-host'
-- disable netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

local o = vim.opt

-- basic configs
o.clipboard = "unnamedplus"
o.completeopt = { "menuone", "noselect" } -- completion will pop up when there is only one match
o.conceallevel = 0 -- no hide for ``
o.fileencoding = "utf-8"
o.showmode = false -- use plugins to show mode
o.mouse = "a"
o.showtabline = 0 -- 2 means always
o.showcmd = false
o.cursorline = true -- highlight the cursor line
o.number = true
o.tabstop = 2
o.shiftwidth = 2
o.expandtab = true
o.smartindent = true
o.splitbelow = true -- force window to be splited into the bottom
o.splitright = true
o.wrap = false -- display lines as one long line
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

-- colorscheme
-- vim.cmd.colorscheme("darkplus")

-- lsp configs
local signs = {
  { name = "DiagnosticSignError", text = "" },
  { name = "DiagnosticSignWarn", text = "" },
  { name = "DiagnosticSignHint", text = "󰌶" },
  { name = "DiagnosticSignInfo", text = "" },
}

for _, sign in ipairs(signs) do
  vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
end

local config = {
  -- disable virtual text
  virtual_text = true,
  -- show signs
  signs = {
    active = signs,
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

-- lsp settings
vim.lsp.set_log_level("off")
vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
  border = "rounded",
})

vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
  border = "rounded",
})
