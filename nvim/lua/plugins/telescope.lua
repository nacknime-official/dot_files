return {
  {
    'nvim-telescope/telescope.nvim',
    version = '0.1.3',
    dependencies = { { 'nvim-lua/plenary.nvim' } },
    cmd = "Telescope",
    keys = { "<leader>pf", "<leader>gf", "<leader>ps", "<leader>vh" },
    config = function()
      local builtin = require('telescope.builtin')
      vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
      vim.keymap.set('n', '<leader>gf', builtin.git_files, {})
      -- vim.keymap.set('n', '<leader>ps', function()
      -- 	builtin.grep_string({ search = vim.fn.input("Grep > ") })
      -- end)
      vim.keymap.set('n', '<leader>ps', builtin.live_grep, {})
      vim.keymap.set('n', '<leader>vh', builtin.help_tags, {})

      require("telescope").load_extension("file_browser")
      require('telescope').load_extension('projects')
    end
  },
  {
    "nvim-telescope/telescope-file-browser.nvim",
    dependencies = { "nvim-telescope/telescope.nvim" }
  }
}
