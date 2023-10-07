local config = function()
  require("nvim-autopairs").setup()
  local cmp_autopairs = require("nvim-autopairs.completion.cmp")
  local cmp = require("cmp")
  -- If you want insert `(` after select function or method item
  cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
end

-- autopairs
return {
  "windwp/nvim-autopairs",
  event = "InsertEnter",
  dependencies = { "hrsh7th/nvim-cmp" },
  config = config,
}
