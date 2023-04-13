require('rose-pine').setup({
    disable_background = true
})
require("tokyonight").setup {
    style = "storm",
    transparent = true
}


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
    ]]
end

ColorMyPencils()
