return {
  capabilities = {
    -- because formatter clang-format needs one particular offsetEncoding, the default offsetEncoding is a list 
    -- (source code: https://github.com/neovim/nvim-lspconfig/blob/master/lua/lspconfig/server_configurations/clangd.lua)
    offsetEncoding = 'utf-8',
  },
}
