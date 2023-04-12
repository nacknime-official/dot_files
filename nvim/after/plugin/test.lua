vim.g["test#strategy"] = 'neovim'
vim.g["test#go#gotest#options"] = '-v'

vim.keymap.set("n", "<leader>tn", "<cmd>TestNearest<CR>")
