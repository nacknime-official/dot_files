function ColorMyPencils(color)
    color = color or "tokyonight"
    vim.cmd.colorscheme(color)

    vim.cmd [[
        hi Normal guibg=none
        hi NormalFloat guibg=none
        hi TelescopeNormal guibg=none
        hi TelescopeBorder guibg=none
        hi FloatBorder guibg=none
        hi Pmenu guibg=none
        hi NvimTreeNormal guibg=none
        hi NvimTreeNormalNC guibg=none
        hi NvimTreeWinSeparator guibg=none
    ]]
end

return {
    {
        "rose-pine/neovim",
        name = "rose-pine",
        config = function()
            require('rose-pine').setup({ disable_background = true })
            ColorMyPencils('rose-pine')
        end
    },
    {
        "folke/tokyonight.nvim",
        lazy = false,
        priority = 1000,
        config = function()
            require("tokyonight").setup { style = "storm", transparent = true }
            ColorMyPencils('tokyonight')
        end
    }
}
