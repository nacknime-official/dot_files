return {
  {
    'lewis6991/gitsigns.nvim',
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      local gs = require('gitsigns')

      gs.setup {
        preview_config = {
          -- Options passed to nvim_open_win
          border = "rounded",
          style = "minimal",
          relative = "cursor",
          row = 0,
          col = 1
        }
      }

      vim.keymap.set({ "n", "v" }, "<leader>gs", gs.stage_hunk)
      vim.keymap.set({ "n", "v" }, "<leader>gr", gs.reset_hunk)
      vim.keymap.set("n", "<leader>gj", gs.next_hunk)
      vim.keymap.set("n", "<leader>gk", gs.prev_hunk)
      vim.keymap.set("n", "<leader>gl", gs.blame_line)
      vim.keymap.set("n", "<leader>gR", gs.reset_buffer)
      vim.keymap.set("n", "<leader>gu", gs.undo_stage_hunk)
      vim.keymap.set("n", "<leader>gd", gs.diffthis)
    end
  }
}
