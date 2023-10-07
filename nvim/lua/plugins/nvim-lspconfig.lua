local config = function()
  -- lsp keymaps
  vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("UserLspConfig", {}),
    callback = function(ev)
      -- Enable completion triggered by <c-x><c-o>
      vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

      -- Buffer local mappings.
      -- See `:help vim.lsp.*` for documentation on any of the below functions
      local opts = { buffer = ev.buf }
      vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
      vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
      vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
      vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
      vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
      -- vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)
      vim.keymap.set("n", "<leader>lr", vim.lsp.buf.rename, opts)
      -- well, this is useless ↓
      -- vim.keymap.set("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, opts)
      -- vim.keymap.set("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, opts)
      -- vim.keymap.set("n", "<leader>wl", function()
      -- 	print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
      -- end, opts)
      vim.keymap.set("n", "<leader>D", vim.lsp.buf.type_definition, opts)
      vim.keymap.set({ "n", "v" }, "<leader>la", vim.lsp.buf.code_action, opts)
    end,
  })

  -- local function lsp_highlight_document(client, bufnr)
  --   -- Set autocommands conditional on server_capabilities
  --   -- https://github.com/neovim/nvim-lspconfig/wiki/UI-Customization#highlight-symbol-under-cursor
  --   if client.server_capabilities.documentHighlightProvider then
  --     vim.api.nvim_create_augroup("lsp_document_highlight", {
  --       clear = false,
  --     })
  --     vim.api.nvim_clear_autocmds({
  --       buffer = bufnr,
  --       group = "lsp_document_highlight",
  --     })
  --     vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
  --       group = "lsp_document_highlight",
  --       buffer = bufnr,
  --       callback = vim.lsp.buf.document_highlight,
  --     })
  --     vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
  --       group = "lsp_document_highlight",
  --       buffer = bufnr,
  --       callback = vim.lsp.buf.clear_references,
  --     })
  --   end
  -- end

  -- set the border
  require("lspconfig.ui.windows").default_options.border = "rounded"
  local lspconfig = require("lspconfig")
  local servers = require("plugins.lsp_settings.serverlist")

  local opts = {}
  for _, server in pairs(servers) do
    local require_ok, conf_opts = pcall(require, "plugins.lsp_settings." .. server)
    if require_ok then
      opts = vim.tbl_deep_extend("force", conf_opts, opts)
    end

    lspconfig[server].setup(opts)
  end
end

return {
  "neovim/nvim-lspconfig",
  lazy = false,
  config = config,
}
