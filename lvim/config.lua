--[[
 THESE ARE EXAMPLE CONFIGS FEEL FREE TO CHANGE TO WHATEVER YOU WANT
 `lvim` is the global options object
]]
-- vim options
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.relativenumber = false
vim.opt.foldmethod = "indent"
vim.opt.shell = "/usr/bin/bash"
-- vim.opt.foldclose = ''
-- vim.opt.foldenable = false
vim.opt.foldlevelstart = 99

-- general
lvim.transparent_window = false
lvim.log.level = "info"
lvim.format_on_save = {
    enabled = false,
    pattern = "*.lua",
    timeout = 1000,
}
-- to disable icons and use a minimalist setup, uncomment the following
-- lvim.use_icons = false

-- keymappings <https://www.lunarvim.org/docs/configuration/keybindings>
lvim.leader = "space"
-- add your own keymapping
-- lvim.keys.normal_mode["<C-s>"] = ":w<cr>"

lvim.keys.normal_mode["<A-l>"] = ":BufferLineCycleNext<CR>"
lvim.keys.normal_mode["<A-h>"] = ":BufferLineCyclePrev<CR>"
lvim.keys.normal_mode["<S-l>"] = "$"
lvim.keys.normal_mode["<S-h>"] = "^"
lvim.keys.normal_mode["dL"] = "d$"
lvim.keys.normal_mode["dH"] = "d^"
lvim.keys.visual_mode["<S-h>"] = "^"
lvim.keys.visual_mode["<S-l>"] = "$"

lvim.builtin.cmp.preselect = require('cmp').PreselectMode.None
-- -- Use which-key to add extra bindings with the leader-key prefix
-- lvim.builtin.which_key.mappings["W"] = { "<cmd>noautocmd w<cr>", "Save without formatting" }
-- lvim.builtin.which_key.mappings["P"] = { "<cmd>Telescope projects<CR>", "Projects" }

-- -- Change theme settings
lvim.colorscheme = "darkplus"

lvim.builtin.alpha.active = true
lvim.builtin.alpha.mode = "dashboard"
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.setup.renderer.icons.show.git = false

-- Automatically install missing parsers when entering buffer
lvim.builtin.treesitter.auto_install = true

-- disable indent for yaml, python, go
lvim.builtin.treesitter.indent.disable = { "yaml", "python", "go", "c", "cpp", "rust" }

-- lvim.builtin.treesitter.ignore_install = { "haskell" }

-- -- always installed on startup, useful for parsers without a strict filetype
lvim.builtin.treesitter.ensure_installed = { "comment", "markdown_inline", "regex" }

-- -- generic LSP settings <https://www.lunarvim.org/docs/languages#lsp-support>

-- --- disable automatic installation of servers
lvim.lsp.installer.setup.automatic_installation = true

-- ---configure a server manually. IMPORTANT: Requires `:LvimCacheReset` to take effect
-- ---see the full default list `:lua =lvim.lsp.automatic_configuration.skipped_servers`
-- vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "pyright" })
-- local opts = {} -- check the lspconfig documentation for a list of all possible options
-- some settings can only passed as commandline flags, see `clangd --help`
local clangd_flags = {
  -- "-std=c++23",
  "--background-index",
  "--fallback-style=Google",
  "--all-scopes-completion",
  "--clang-tidy",
  "--log=error",
  "--suggest-missing-includes",
  "--cross-file-rename",
  "--completion-style=detailed",
  "--pch-storage=memory", -- could also be disk
  "--folding-ranges",
  "--enable-config", -- clangd 11+ supports reading from .clangd configuration file
  "--offset-encoding=utf-16", --temporary fix for null-ls
  -- "--limit-references=1000",
  -- "--limit-resutls=1000",
  -- "--malloc-trim",
  -- "--clang-tidy-checks=-*,llvm-*,clang-analyzer-*,modernize-*,-modernize-use-trailing-return-type",
  -- "--header-insertion=never",
  -- "--query-driver=<list-of-white-listed-complers>"
}

local provider = "clangd"

local opts = {
  cmd = { provider, unpack(clangd_flags) },
}

require("lvim.lsp.manager").setup("clangd", opts)
require("lvim.lsp.manager").setup("cmake")
require("lvim.lsp.manager").setup("rust_analyzer")
require("lvim.lsp.manager").setup("gopls")
require("lvim.lsp.manager").setup("bashls")
require("lvim.lsp.manager").setup("lua_ls")
require("lvim.lsp.manager").setup("yamlls")
require("lvim.lsp.manager").setup("pylsp")
require("lvim.lsp.manager").setup("html")
require("lvim.lsp.manager").setup("cssls")
require("lvim.lsp.manager").setup("cssmodules_ls")

-- ---remove a server from the skipped list, e.g. eslint, or emmet_ls. IMPORTANT: Requires `:LvimCacheReset` to take effect
-- ---`:LvimInfo` lists which server(s) are skipped for the current filetype
-- lvim.lsp.automatic_configuration.skipped_servers = vim.tbl_filter(function(server)
--   return server ~= "emmet_ls"
-- end, lvim.lsp.automatic_configuration.skipped_servers)

-- -- you can set a custom on_attach function that will be used for all the language servers
-- -- See <https://github.com/neovim/nvim-lspconfig#keybindings-and-completion>
-- lvim.lsp.on_attach_callback = function(client, bufnr)
--   local function buf_set_option(...)
--     vim.api.nvim_buf_set_option(bufnr, ...)
--   end
--   --Enable completion triggered by <c-x><c-o>
--   buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")
-- end

-- -- linters and formatters <https://www.lunarvim.org/docs/languages#lintingformatting>
-- local formatters = require "lvim.lsp.null-ls.formatters"
-- formatters.setup {
--   { command = "stylua" },
--   {
--     command = "prettier",
--     extra_args = { "--print-width", "100" },
--     filetypes = { "typescript", "typescriptreact" },
--   },
-- }
-- local formatters = require "lvim.lsp.null-ls.formatters"
-- formatters.setup { { exe = "clang-format", args = { "-style=Microsoft" } } }
-- local linters = require "lvim.lsp.null-ls.linters"
-- linters.setup {
--   { command = "flake8", filetypes = { "python" } },
--   {
--     command = "shellcheck",
--     args = { "--severity", "warning" },
--   },
-- }

-- -- Additional Plugins <https://www.lunarvim.org/docs/plugins#user-plugins>
lvim.plugins = {
    -- {
    --   "folke/trouble.nvim",
    --   cmd = "TroubleToggle",
    -- },
    {
        "lunarvim/darkplus.nvim",
        lazy = false,
        priority = 1000,
        config = function()
            vim.cmd([[colorscheme darkplus]])
        end
    },
    {
        "lunarvim/colorschemes",
    },
    {
        "iamcco/markdown-preview.nvim",
        build = "cd app && npm install",
        ft = "markdown",
        init = function()
            vim.g.mkdp_filetypes = { "markdown" }
        end,
        config = function()
            vim.g.mkdp_auto_start = 1
        end,
    },
    {
        "ray-x/lsp_signature.nvim",
    },
    -- {
    --     "mfussenegger/nvim-dap-python"
    -- },
    -- {
    --     "simrat39/rust-tools.nvim"
    -- },
    -- {
    --     "saecki/crates.nvim",
    --     -- version = "v0.3.0",
    --     event = { "BufRead Cargo.toml" },
    --     dependencies = { { "nvim-lua/plenary.nvim" } },
    --     config = function()
    --         require("crates").setup()
    --         --     null_ls = {
    --         --         enabled = true,
    --         --         name = "crates.nvim",
    --         --     },
    --         --     popup = {
    --         --         border = "rounded",
    --         --     },
    --     end,
    -- },
}
local cfg = {
    hint_prefix = "• ",
    bind = true, -- This is mandatory, otherwise border config won't get registered.
    handler_opts = {
        border = "rounded"
    },
}
require("lsp_signature").setup(cfg)
-- -- Autocommands (`:help autocmd`) <https://neovim.io/doc/user/autocmd.html>
-- vim.api.nvim_create_autocmd("FileType", {
--   pattern = "zsh",
--   callback = function()
--     -- let treesitter use bash highlight for zsh files as well
--     require("nvim-treesitter.highlight").attach(0, "bash")
--   end,
-- })
-- This fix the luasnip tab behavior
local luasnip = require("luasnip")
vim.api.nvim_create_autocmd("ModeChanged", {
    group = vim.api.nvim_create_augroup("UnlinkLuaSnipSnippetOnModeChange", {
        clear = true,
    }),
    pattern = { "s:n", "i:*" },
    desc = "Forget the current snippet when leaving the insert mode",
    callback = function(evt)
        -- If we have n active nodes, n - 1 will still remain after a `unlink_current()` call.
        -- We unlink all of them by wrapping the calls in a loop.
        while true do
            if luasnip.session and luasnip.session.current_nodes[evt.buf] and not luasnip.session.jump_active then
                luasnip.unlink_current()
            else
                break
            end
        end
    end,
})
