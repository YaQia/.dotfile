-- local opts = { noremap = true, silent = true }
-- local term_opts = { silent = true }

local keymap = vim.keymap.set
local opt = { silent = true }
vim.g.mapleader = " "

-- Insert Mode --
-- text movement
keymap("i", "<A-j>", "<esc><Cmd>m .+1<cr>==i", opt)
keymap("i", "<A-k>", "<esc><Cmd>m .-2<cr>==i", opt)

-- Normal Mode --
keymap("n", "<leader>e", vim.cmd.Ex)
keymap("n", "<leader>w", "<Cmd>w<cr>", opt)
keymap("n", "<leader>h", "<Cmd>noh<cr>", opt)

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
keymap("n", "<A-l>", "<Cmd>bnext<cr>", opt)
keymap("n", "<A-h>", "<Cmd>bprev<cr>", opt)
keymap("n", "<leader>q", "<cmd>confirm q<cr>", opt)
keymap("n", "<leader>c", "<Cmd>bdelete<cr>", opt)

-- Visual Mode --
keymap("v", "<", "<gv")
keymap("v", ">", ">gv")

-- move text up and down
keymap("v", "<A-j>", ":m '>+1<cr>gv=gv", opt)
keymap("v", "<A-k>", ":m '<-2<cr>gv=gv", opt)

-- keep the copy buffer unchanged
keymap("v", "p", '"_dP')

-- Visual Block Mode --
keymap("x", "<A-j>", ":m '>+1<cr>gv=gv", opt)
keymap("x", "<A-k>", ":m '<-2<cr>gv=gv", opt)

keymap("n",    "<C-e>",
    function()
        local result = vim.treesitter.get_captures_at_cursor(0)
        print(vim.inspect(result))
    end,
    { noremap = true, silent = false }
)
