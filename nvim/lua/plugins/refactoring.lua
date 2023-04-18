return {
    "theprimeagen/refactoring.nvim",
    keys = {
        { "<leader>rr", mode = "v" },
        { "<leader>ri", mode = "v" },
    },
    config = function()
        require('refactoring').setup({})

        vim.api.nvim_set_keymap("v", "<leader>ri",
            [[ <Esc><Cmd>lua require('refactoring').refactor('Inline Variable')<CR>]],
            { noremap = true, silent = true, expr = false })
        vim.api.nvim_set_keymap(
            "v",
            "<leader>rr",
            ":lua require('refactoring').select_refactor()<CR>",
            { noremap = true, silent = true, expr = false }
        )
    end
}
