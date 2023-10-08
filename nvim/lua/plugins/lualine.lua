-- Bubbles config for lualine
-- Author: lokesh-krishna
-- MIT license, see LICENSE for more details.

-- stylua: ignore

local icon = function()
  return "󰀘 "
end

local hide_in_width = function()
  return vim.fn.winwidth(0) > 80
end

local diagnostics = {
  "diagnostics",
  sources = { "nvim_diagnostic" },
  sections = { "error", "warn" },
  symbols = { error = " ", warn = " " },
  colored = true,
  update_in_insert = false,
  always_visible = false,
}

local diff = {
  "diff",
  colored = true,
  symbols = { added = " ", modified = " ", removed = " " }, -- changes diff symbols
  cond = hide_in_width,
}

local mode = {
  "mode",
  fmt = function(str)
    return str
  end,
  padding = { left = 0, right = 0 },
}

local filename = {
  "filename",
  padding = { left = 1, right = 0 },
}

-- local filetype = {
--  "filetype",
--  icons_enabled = true,
--  -- icon = nil,
-- }

local branch = {
  "branch",
  icons_enabled = true,
  icon = "",
}

local get_location = function()
  local current_line = vim.fn.line(".")
  local current_column = vim.fn.col(".")
  local line_str = tostring(current_line)
  local column_str = tostring(current_column)
  return line_str .. ":" .. column_str
end

local location = {
  get_location,
  separator = { left = "", right = "" },
  padding = { left = 1, right = 1 },
}

-- cool function for progress

local spaces = function()
  return "󰌒 " .. vim.api.nvim_buf_get_option(0, "tabstop")
end

local opts = {
  options = {
    theme = "auto",
    component_separators = { left = "", right = "" },
    section_separators = { left = "", right = "" },
    -- section_separators = { left = "", right = "" },
    disabled_filetypes = { "dashboard", "NvimTree", "Outline" },
    always_divide_middle = true,
  },
  sections = {
    lualine_a = {
      {
        icon,
        separator = { left = "" },
        padding = { left = 0, right = 0 },
      },
      mode,
    },
    lualine_b = { filename },
    lualine_c = { branch },
    -- lualine_x = { "encoding", "fileformat", "filetype" },
    lualine_x = { diagnostics, diff, spaces, "encoding" },
    lualine_y = { "filetype" },
    lualine_z = { location },
  },
  inactive_sections = {
    lualine_a = { icon },
    lualine_b = { "filename" },
    lualine_c = {},
    lualine_x = {},
    lualine_y = { "filetype" },
    lualine_z = { "location" },
  },
  tabline = {},
  extensions = {},
}

-- lualine
return {
  "nvim-lualine/lualine.nvim",
  -- lazy = false,
  event = "VimEnter",
  dependencies = { "nvim-tree/nvim-web-devicons", "YaQia/darkplus.nvim" },
  opts = opts,
}
