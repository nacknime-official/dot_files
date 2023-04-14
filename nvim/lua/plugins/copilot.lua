return {
    "github/copilot.vim",
    -- event = "VeryLazy",
    keys = { "<leadercp>" },
    config = function()
        -- disable by default
        vim.g.copilot_enabled = 0
        vim.keymap.set("n", "<leader>cp", ":let g:copilot_enabled = !g:copilot_enabled<CR>", { silent = true })
    end
}
