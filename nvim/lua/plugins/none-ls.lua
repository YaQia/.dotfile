local config = function()
  -- they change the name into none-ls, but null-ls still inside
  local null_ls = require("null-ls")
  local completion = null_ls.builtins.completion
  local diagnostics = null_ls.builtins.diagnostics
  local formatting = null_ls.builtins.formatting
  null_ls.setup({
    sources = {
      formatting.stylua,
      formatting.black,
      formatting.clang_format,
      formatting.gofumpt,
      formatting.rustfmt,
      formatting.cbfmt,
      formatting.prettier,
      diagnostics.golangci_lint,
      -- diagnostics.cpplint.with({ extra_args = {""} }),
    },
  })
end

-- new version of null-ls
return {
  "nvimtools/none-ls.nvim",
  event = "VeryLazy",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = config,
}
