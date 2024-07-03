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

-- local mode = {
--   "mode",
--   fmt = function(str)
--     return str
--   end,
--   padding = { left = 0, right = 0 },
-- }

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
	return "󰌒 " .. vim.api.nvim_get_option_value(0, "tabstop")
end

-- theme
-- stylua: ignore
-- local colors
-- if vim.o.background == "dark" then
-- local colors = {
-- 	blue = "#569cd6",
-- 	green = "#6a9955",
-- 	purple = "#c586c0",
-- 	red = "#d16969",
-- 	yellow = "#dcdcaa",
-- 	orange = "#D7BA7D",
-- 	fg = "#ababab",
-- 	-- bg     = '#007acc',
-- 	-- bg     = '#68217a',
-- 	bg = "#252525",
-- 	gray = "#333333",
-- 	-- light_gray  = '#5c6370',
-- 	gray3 = "#3e4452",
-- }
-- else
-- 	colors = {
-- 		blue = "#569cd6",
-- 		green = "#6a9955",
-- 		purple = "#c586c0",
-- 		red = "#d16969",
-- 		yellow = "#dcdcaa",
-- 		orange = "#D7BA7D",
-- 		fg = "#ababab",
-- 		-- bg     = '#007acc',
-- 		-- bg     = '#68217a',
-- 		bg = "#e4e4e4",
-- 		gray = "#f5f5f5",
-- 		-- light_gray  = '#5c6370',
-- 		gray3 = "#3e4452",
-- 	}
-- end

-- local bubbles_theme = {
-- 	normal = {
-- 		a = { fg = colors.bg, bg = colors.blue },
-- 		b = { fg = colors.blue, bg = colors.gray },
-- 		c = { fg = colors.fg, bg = colors.bg },
-- 	},
-- 	insert = { a = { fg = colors.bg, bg = colors.green }, b = { fg = colors.green, bg = colors.gray } },
-- 	visual = { a = { fg = colors.bg, bg = colors.purple }, b = { fg = colors.purple, bg = colors.gray } },
-- 	command = { a = { fg = colors.bg, bg = colors.orange }, b = { fg = colors.orange, bg = colors.gray } },
-- 	replace = { a = { fg = colors.bg, bg = colors.red }, b = { fg = colors.red, bg = colors.gray } },
--
-- 	inactive = {
-- 		a = { bg = colors.bg, fg = colors.blue },
-- 		b = { bg = colors.bg, fg = colors.gray, gui = "bold" },
-- 		c = { bg = colors.bg, fg = colors.gray },
-- 	},
-- }

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
			{
				"mode",
				padding = { left = 0, right = 0 },
			},
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
	-- event = "VimEnter",
	event = "VeryLazy",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	opts = opts,
}
