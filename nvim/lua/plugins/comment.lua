return {
    {
        "numToStr/Comment.nvim",
        keys = { { "<leader>/", mode = { "n", "v" } } },
        config = function()
            require("Comment").setup()

            vim.keymap.set("n", "<leader>/", "<Plug>(comment_toggle_linewise_current)")
            vim.keymap.set("v", "<leader>/", "<Plug>(comment_toggle_linewise_visual)")
        end
    }
}
