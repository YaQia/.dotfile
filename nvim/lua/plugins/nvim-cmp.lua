local config = function()
  require("luasnip.loaders.from_vscode").lazy_load()

  local luasnip = require("luasnip")
  local cmp = require("cmp")
  --   פּ ﯟ   some other good icons
  -- local kind_icons = {
  --   Text = "󰉿",
  --   Method = "󰆧",
  --   Function = "󰊕",
  --   Constructor = "",
  --   Field = "",
  --   Variable = "󰫧",
  --   Class = "",
  --   Interface = "",
  --   Module = "",
  --   Property = "",
  --   Unit = "",
  --   Value = "󰎠",
  --   Enum = "",
  --   Keyword = "󰌋",
  --   Snippet = "",
  --   Color = "",
  --   File = "",
  --   Reference = "",
  --   Folder = "",
  --   EnumMember = "",
  --   Constant = "󰏿",
  --   Struct = "",
  --   Event = "",
  --   Operator = "",
  --   TypeParameter = "󰉺",
  -- }

  cmp.setup({
    snippet = {
      expand = function(args)
        luasnip.lsp_expand(args.body)
      end,
    },
    window = {
      completion = cmp.config.window.bordered(),
      documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
      ["<CR>"] = cmp.mapping.confirm({ select = false }),
      -- Ctrl+Space to trigger completion menu
      ["<C-Space>"] = cmp.mapping.complete(),
      ["<Tab>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_next_item()
        elseif luasnip.expand_or_locally_jumpable() then
          luasnip.expand_or_jump()
        else
          fallback()
        end
      end, { "i", "s" }),
      ["<S-Tab>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_prev_item()
        elseif luasnip.jumpable(-1) then
          luasnip.jump(-1)
        else
          fallback()
        end
      end, { "i", "s" }),
      -- Scroll up and down in the completion documentation
      ["<C-k>"] = cmp.mapping.scroll_docs(-1),
      ["<C-j>"] = cmp.mapping.scroll_docs(1),
    }),
    sources = cmp.config.sources({
      { name = "nvim_lsp" },
      { name = "nvim_lua" },
      { name = "luasnip" },
      { name = "buffer" },
      { name = "path" },
    }),
    formatting = {
      fields = {
        "abbr",
        "kind",
        --[[ "menu" ]]
      },
      format = require("lspkind").cmp_format({
        mode = "symbol_text", -- show symbol annotations and text
        maxwidth = 50,     -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
        ellipsis_char = "...", -- when popup menu exceed maxwidth, the truncated part would show ellipsis_char instead (must define maxwidth first)

        -- The function below will be called before any actual modifications from lspkind
        -- so that you can provide more controls on popup customization. (See [#30](https://github.com/onsails/lspkind-nvim/pull/30))
        -- before = function(entry, vim_item)
        --   return vim_item
        -- end,
      }),
      -- format = function(entry, vim_item)
      --   -- Kind icons
      --   -- vim_item.kind = string.format("%s", kind_icons[vim_item.kind])
      --   vim_item.kind = string.format("%s %s", kind_icons[vim_item.kind], vim_item.kind) -- This concatonates the icons with the name of the item kind
      --   -- vim_item.menu = ({
      --   --   nvim_lsp = "[LSP]",
      --   --   nvim_lua = "[NVIM]",
      --   --   luasnip = "[LuaSnip]",
      --   --   buffer = "[Buffer]",
      --   --   path = "[Path]",
      --   -- })[entry.source.name]
      --   return vim_item
      -- end,
    },
  })

  -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline({ "/", "?" }, {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
      { name = "buffer" },
    },
  })

  -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline(":", {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
      { name = "path" },
    }, {
      { name = "cmdline" },
    }),
  })
end

-- cmp plugins
return {
  "hrsh7th/nvim-cmp",
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-nvim-lua",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-cmdline",
    "saadparwaiz1/cmp_luasnip",
    "onsails/lspkind.nvim",
  },
  event = { "InsertEnter", "CmdlineEnter" },
  config = config,
}
