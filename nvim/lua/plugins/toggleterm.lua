return {
  "akinsho/toggleterm.nvim",
  version = '*',
  keys = { "<leader>gg" },
  config = function()
    require("toggleterm").setup {
      size = 10,
      shading_factor = 2,
      float_opts = {
        border = "curved",
        winblend = 0,
        highlights = { border = "Normal", background = "Normal" }
      }
    }

    local Terminal = require("toggleterm.terminal").Terminal
    local lazygit = Terminal:new({
      cmd = "lazygit",
      hidden = true,
      direction = "float"
    })

    local function _lazygitToggle() lazygit:toggle() end

    vim.keymap.set("n", "<leader>gg", _lazygitToggle)
  end
}
