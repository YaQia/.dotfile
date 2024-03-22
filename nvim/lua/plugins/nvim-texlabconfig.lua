local config = {
    cache_activate = true,
    cache_filetypes = { "tex", "bib" },
    cache_root = vim.fn.stdpath("cache"),
    reverse_search_start_cmd = function()
        return true
    end,
    reverse_search_edit_cmd = vim.cmd.edit,
    reverse_search_end_cmd = function()
        return true
    end,
    file_permission_mode = 438,
}

return {
    "f3fora/nvim-texlabconfig",
    config = function()
        require("texlabconfig").setup(config)
    end,
    ft = { "tex", "bib" }, -- Lazy-load on filetype
    build = "go build",
    -- build = 'go build -o ~/.bin/' if e.g. ~/.bin/ is in $PATH
}
