return {
    "theprimeagen/refactoring.nvim",
    keys = { { "<leader>ri", mode = { "v" } } },
    config = function()
        require('refactoring').setup({})

        vim.api.nvim_set_keymap("v", "<leader>ri",
            [[ <Esc><Cmd>lua require('refactoring').refactor('Inline Variable')<CR>]],
            { noremap = true, silent = true, expr = false })
    end
}
