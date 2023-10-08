local config = function()
  require("nvim-tree").setup({
    renderer = {
      group_empty = true,
      icons = {
        glyphs = {
          default = "",
          symlink = "",
          git = {
            unstaged = "",
            staged = "S",
            unmerged = "",
            renamed = "➜",
            deleted = "",
            untracked = "U",
            ignored = "◌",
          },
        },
      },
    },
    actions = {
      open_file = {
        quit_on_open = true,
      },
    },
    filters = {
      dotfiles = false,
      git_ignored = false,
    },
    update_focused_file = {
      enable = true,
      update_cwd = true,
      ignore_list = {},
    },
    git = {
      enable = true,
      ignore = true,
      timeout = 500,
    },
    diagnostics = {
      enable = true,
      icons = {
        hint = "",
        info = "",
        warning = "",
        error = "",
      },
    },
    view = {
      number = false,
      relativenumber = false,
    },
  })
end

-- file explore
return {
  "nvim-tree/nvim-tree.lua",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  event = "VeryLazy",
  cmd = {
    "NvimTreeToggle",
    "NvimTreeOpen",
    "NvimTreeFocus",
    "NvimTreeFindFileToggle",
  },
  -- keys = "<leader>e",
  config = config,
}
