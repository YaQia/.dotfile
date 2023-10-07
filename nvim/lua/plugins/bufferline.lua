local opts = {
  options = {
    diagnostics = "nvim_lsp", -- | "nvim_lsp" | "coc",
    diagnostics_update_in_insert = false,
    offsets = { { filetype = "NvimTree", text = "", padding = 1 } },
    enforce_regular_tabs = true,
    always_show_bufferline = false,
    sort_by = "directory",
    -- sort_by = 'id' | 'extension' | 'relative_directory' | 'directory' | 'tabs' | function(buffer_a, buffer_b)
    --   -- add custom logic
    --   return buffer_a.modified > buffer_b.modified
    -- end
  },
}
vim.keymap.set("n", "<A-l>", "<Cmd>BufferLineCycleNext<cr>", { silent = true })
vim.keymap.set("n", "<A-h>", "<Cmd>BufferLineCyclePrev<cr>", { silent = true })

-- bufferline
return {
  "akinsho/bufferline.nvim",
  event = "BufAdd",
  version = "*",
  dependencies = "nvim-tree/nvim-web-devicons",
  opts = opts,
}
