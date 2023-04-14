return {
  "vim-test/vim-test",
  keys = { "<leader>tn", "<cmd>TestNearest<CR>" },
  config = function()
    vim.g["test#strategy"] = 'neovim'
    vim.g["test#go#gotest#options"] = '-v'
  end
}
