local opts = {
  -- ---LHS of toggle mappings in NORMAL mode
  -- toggler = {
  --   ---Line-comment toggle keymap
  --   line = "<c-/>",
  --   ---Block-comment toggle keymap
  --   block = "<c-s-/>",
  -- },
  -- ---LHS of operator-pending mappings in NORMAL and VISUAL mode
  -- opleader = {
  --   ---Line-comment keymap
  --   line = "<c-/>",
  --   ---Block-comment keymap
  --   block = "<c-s-/>",
  -- },
  -- ---LHS of extra mappings
  -- extra = {
  --   ---Add comment on the line above
  --   above = "gcO",
  --   ---Add comment on the line below
  --   below = "gco",
  --   ---Add comment at the end of line
  --   eol = "gcA",
  -- },
  -- ---Enable keybindings
  -- ---NOTE: If given `false` then the plugin won't create any mappings
  -- mappings = {
  --   ---Operator-pending mapping; `gcc` `gbc` `gc[count]{motion}` `gb[count]{motion}`
  --   basic = true,
  --   extra = false, -- not necessary at all
  -- },
}

-- code comment plugin
return {
  "numToStr/Comment.nvim",
  event = "VeryLazy",
  opts = opts,
}
