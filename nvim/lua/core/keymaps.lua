-- local opts = { noremap = true, silent = true }
-- local term_opts = { silent = true }

local keymap = vim.keymap.set
local opt = { silent = true }
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Insert Mode --
-- text movement
keymap("i", "<A-j>", "<esc><Cmd>m .+1<cr>==i", opt)
keymap("i", "<A-k>", "<esc><Cmd>m .-2<cr>==i", opt)

-- Normal Mode --
-- keymap("n", "<leader>e", vim.cmd.Ex)
-- keymap("n", "<leader>w", "<Cmd>w<cr>", opt)
-- keymap("n", "<leader>h", "<Cmd>noh<cr>", opt)

-- text movement
keymap("n", "H", "^")
keymap("n", "L", "$")
keymap("n", "dH", "d^")
keymap("n", "dL", "d$")
keymap("n", "<A-j>", "<Cmd>m .+1<cr>==", opt)
keymap("n", "<A-k>", "<Cmd>m .-2<cr>==", opt)

-- window movement
keymap("n", "<C-h>", "<C-w>h")
keymap("n", "<C-l>", "<C-w>l")
keymap("n", "<C-j>", "<C-w>j")
keymap("n", "<C-k>", "<C-w>k")

-- resize window
keymap("n", "<C-Up>", "<Cmd>resize +2<cr>", opt)
keymap("n", "<C-Down>", "<Cmd>resize -2<cr>", opt)
keymap("n", "<C-Left>", "<Cmd>vertical resize +2<cr>", opt)
keymap("n", "<C-Right>", "<Cmd>vertical resize -2<cr>", opt)

-- buffer movement
-- this is only okay when not using bufferline
keymap("n", "<A-l>", "<Cmd>tabnext<cr>", opt)
keymap("n", "<A-h>", "<Cmd>tabprevious<cr>", opt)
keymap("n", "<A-L>", "<Cmd>+tabmove<cr>", opt)
keymap("n", "<A-H>", "<Cmd>-tabmove<cr>", opt)
for i = 1, 9 do
	vim.keymap.set("n", "<A-" .. tostring(i) .. ">", tostring(i) .. "gt", { silent = true })
end
keymap("n", "<leader>q", "<cmd>confirm q<cr>", opt)
-- keymap("n", "<leader>bc", "<Cmd>bdelete<cr>", opt)

-- disable highlight
keymap("n", "<Esc>", "<cmd>nohl<cr>", opt)

-- Visual Mode --
-- x is only for Visual Mode, not including Select Mode
keymap("x", "<", "<gv")
keymap("x", ">", ">gv")

keymap("x", "H", "^")
keymap("x", "L", "$")

-- move text up and down
keymap("x", "<A-j>", ":m '>+1<cr>gv=gv", opt)
keymap("x", "<A-k>", ":m '<-2<cr>gv=gv", opt)

-- keep the copy buffer unchanged
keymap("x", "p", '"_dP')

-- keymap("n", "<C-e>", function()
-- 	local result = vim.treesitter.get_captures_at_cursor(0)
-- 	print(vim.inspect(result))
-- end, { noremap = true, silent = false })

-- lsp keymaps
-- disable default maps
pcall(vim.keymap.del, "n", "gra")
pcall(vim.keymap.del, "n", "gri")
pcall(vim.keymap.del, "n", "grn")
pcall(vim.keymap.del, "n", "grr")
-- vim.api.nvim_create_autocmd("LspAttach", {
-- 	group = vim.api.nvim_create_augroup("UserLspConfig", {}),
-- 	callback = function(ev)
-- 		-- Enable completion triggered by <c-x><c-o>
-- 		vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"
--
-- 		local opts = { buffer = ev.buf }
--
-- 		keymap("n", "gD", "<cmd>Telescope lsp_definitions<cr>", opts)
-- 		-- This conflicts with nvim-ufo --
-- 		keymap("n", "gd", vim.lsp.buf.definition, opts)
-- 		keymap("n", "gr", "<cmd>Telescope lsp_references<cr>", opts)
-- 		-- keymap("n", "gr", vim.lsp.buf.references, opts)
-- 		keymap("n", "K", "<cmd>lua vim.lsp.buf.hover({border='rounded'})<cr>", opts)
-- 		keymap("n", "gi", "<cmd>Telescope lsp_implementations<cr>", opts)
-- 		-- goto parent
-- 		keymap("n", "gI", "<cmd>Telescope lsp_incoming_calls<cr>", opts)
-- 		-- goto child
-- 		keymap("n", "gO", "<cmd>Telescope lsp_outgoing_calls<cr>", opts)
-- 		-- Buffer local mappings.
-- 		-- See `:help vim.lsp.*` for documentation on any of the below functions
-- 		-- keymap("n", "<C-k>", vim.lsp.buf.signature_help, opts)
-- 		-- keymapis useless ↓
-- 		-- keymapset("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, opts)
-- 		-- keymapset("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, opts)
-- 		-- keymapset("n", "<leader>wl", function()
-- 		--  print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
-- 		-- end, opts)
-- 		-- keymap("n", "<leader>D", vim.lsp.buf.type_definition, opts)
-- 	end,
-- })

local opts = { nowait = true, silent = true }

keymap("n", "gD", "<cmd>Telescope lsp_definitions<cr>", opts)
-- This conflicts with nvim-ufo --
keymap("n", "gd", "<cmd>Telescope lsp_definitions<cr>", opts)
keymap("n", "gr", "<cmd>Telescope lsp_references<cr>", opts)
-- keymap("n", "gr", vim.lsp.buf.references, opts)
keymap("n", "K", "<cmd>lua vim.lsp.buf.hover({border='rounded'})<cr>", opts)
keymap("n", "gi", "<cmd>Telescope lsp_implementations<cr>", opts)
-- goto parent
keymap("n", "gI", "<cmd>Telescope lsp_incoming_calls<cr>", opts)
-- goto child
keymap("n", "gO", "<cmd>Telescope lsp_outgoing_calls<cr>", opts)
